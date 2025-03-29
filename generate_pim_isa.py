import math

# --- Configuration ---
# Set these according to your matrix dimensions
M = 4  # Rows of A and C
N = 4  # Columns of B and C
K = 4  # Columns of A and Rows of B

# Assume simple memory layout:
# Matrix A starts at PIM Row 0
# Matrix B starts at PIM Row M * K
# Matrix C starts at PIM Row M * K + K * N
# Adjust these base addresses as needed!
BASE_ROW_A = 0
BASE_ROW_B = M * K
BASE_ROW_C = M * K + K * N

# Check if addresses exceed PIM's 9-bit limit (512 rows)
MAX_ROW = 511
if (BASE_ROW_C + M * N - 1) > MAX_ROW:
    print(f"Warning: Calculated rows exceed PIM limit ({MAX_ROW})!")
    # Consider a different layout (e.g., tiling) if this happens

# --- PIM ISA Definitions (Based on Figure 5) ---
OPCODE_NOOP = 0b00
OPCODE_PROG = 0b01
OPCODE_EXE  = 0b10
OPCODE_END  = 0b11

# Placeholder Pointer Values (You NEED to confirm their meaning from paper/context)
# Assuming specific pointers might select the microcoded operation (e.g., MAC8)
POINTER_MAC8_EXE = 0x01 # Example: Pointer value triggering the MAC8 microcode sequence
POINTER_LOAD_A = 0x0A   # Example: Pointer that might signify 'operand A' context (if needed)
POINTER_LOAD_B = 0x0B   # Example: Pointer that might signify 'operand B' context (if needed)
POINTER_STORE_C = 0x0C  # Example: Pointer that might signify 'result C' context (if needed)
POINTER_GENERIC_END = 0x00 # Example: Pointer for the END operation

# --- Helper Functions ---

def calculate_pim_row_address(matrix_char, idx1, idx2):
    """
    Calculates the PIM row address based on assumed row-major layout.
    A[i][k] -> maps idx1=i, idx2=k
    B[k][j] -> maps idx1=k, idx2=j
    C[i][j] -> maps idx1=i, idx2=j
    """
    if matrix_char == 'A':
        # A is M x K. Row-major index: i * K + k
        if idx1 >= M or idx2 >= K:
            raise ValueError(f"Index out of bounds for A: ({idx1}, {idx2})")
        element_index = idx1 * K + idx2
        row_addr = BASE_ROW_A + element_index
    elif matrix_char == 'B':
        # B is K x N. Row-major index: k * N + j
        if idx1 >= K or idx2 >= N:
             raise ValueError(f"Index out of bounds for B: ({idx1}, {idx2})")
        element_index = idx1 * N + idx2
        row_addr = BASE_ROW_B + element_index
    elif matrix_char == 'C':
        # C is M x N. Row-major index: i * N + j
        if idx1 >= M or idx2 >= N:
             raise ValueError(f"Index out of bounds for C: ({idx1}, {idx2})")
        element_index = idx1 * N + idx2
        row_addr = BASE_ROW_C + element_index
    else:
        raise ValueError("Invalid matrix character")

    if row_addr > MAX_ROW:
        print(f"Warning: Calculated row address {row_addr} exceeds PIM limit ({MAX_ROW})!")
        # Handle this error appropriately - maybe cap or raise stricter error
        row_addr = MAX_ROW # Example: Cap at max address

    return row_addr & 0x1FF # Ensure it fits in 9 bits

def format_pim_instruction(opcode, pointer, rd_bit, wr_bit, row_addr):
    """
    Formats the PIM instruction into a 24-bit integer and a readable string.
    Format: | Op (2) | Ptr (6) | Unused (5) | RD (1) | WR (1) | RowAddr (9) |
    """
    if not (0 <= opcode <= 3): raise ValueError("Invalid Opcode")
    if not (0 <= pointer <= 63): raise ValueError("Invalid Pointer")
    if not (0 <= rd_bit <= 1): raise ValueError("Invalid RD bit")
    if not (0 <= wr_bit <= 1): raise ValueError("Invalid WR bit")
    if not (0 <= row_addr <= 511): raise ValueError("Invalid Row Address")

    instruction_val = (
        ((opcode   & 0b11)  << 22) |
        ((pointer  & 0b111111) << 16) |
        # Skipping 5 unused bits (15 down to 11)
        ((rd_bit   & 0b1)   << 10) |
        ((wr_bit   & 0b1)   << 9)  |
        ((row_addr & 0b111111111) << 0)
    )

    # Create a readable string representation
    op_str = {0b00: "NOOP", 0b01: "PROG", 0b10: "EXE ", 0b11: "END "}.get(opcode)
    # Adjust pointer based on opcode for readability, using placeholders
    ptr_str = f"0x{pointer:02X}"
    if opcode == OPCODE_EXE:
        if rd_bit: ptr_str = f"Ptr_RD? (0x{pointer:02X})"
        elif wr_bit: ptr_str = f"Ptr_WR? (0x{pointer:02X})"
        else: ptr_str = f"Ptr_OP? (0x{pointer:02X})" # e.g., MAC8
    elif opcode == OPCODE_END:
         ptr_str = f"Ptr_END (0x{pointer:02X})"


    instr_str = (f"{op_str:<5} | Ptr={ptr_str:<15} | "
                 f"RD={rd_bit} | WR={wr_bit} | Addr=0x{row_addr:03X} | "
                 f"(Hex: 0x{instruction_val:06X})")

    return instruction_val, instr_str

# --- Main Generation Logic ---

pim_instructions = []

print(f"Generating PIM instructions for {M}x{K} * {K}x{N} -> {M}x{N} matrix multiplication")
print(f"Layout: A @ row {BASE_ROW_A}, B @ row {BASE_ROW_B}, C @ row {BASE_ROW_C}")
print("-" * 60)
print("Opcode| Pointer         | RD| WR| Addr    | Raw Hex Value")
print("-" * 60)

# Simulate the C++ loops
for i in range(M):
    for j in range(N):
        # --- Start of calculation for C[i][j] ---
        # Assumption: Accumulator implicitly reset at start or by END.
        # The paper doesn't explicitly state accumulator reset mechanism.

        for k in range(K):
            # 1. Load A[i][k]
            row_a = calculate_pim_row_address('A', i, k)
            # Use POINTER_LOAD_A if pointer signifies operand source, else maybe POINTER_MAC8_EXE? Needs clarification.
            val_rd_a, str_rd_a = format_pim_instruction(
                opcode=OPCODE_EXE,
                pointer=POINTER_LOAD_A, # Placeholder - maybe MAC8 pointer is enough?
                rd_bit=1,
                wr_bit=0,
                row_addr=row_a
            )
            pim_instructions.append(str_rd_a)

            # 2. Load B[k][j]
            row_b = calculate_pim_row_address('B', k, j)
            val_rd_b, str_rd_b = format_pim_instruction(
                opcode=OPCODE_EXE,
                pointer=POINTER_LOAD_B, # Placeholder
                rd_bit=1,
                wr_bit=0,
                row_addr=row_b
            )
            pim_instructions.append(str_rd_b)

            # 3. Execute MAC operation
            # Assumes the previous two RD operations loaded operands into the PIM cluster
            # correctly and this EXE triggers the microcoded MAC sequence.
            val_exe_mac, str_exe_mac = format_pim_instruction(
                opcode=OPCODE_EXE,
                pointer=POINTER_MAC8_EXE, # Pointer selecting the MAC8 operation microcode
                rd_bit=0,
                wr_bit=0,
                row_addr=0 # Address likely ignored for pure EXE
            )
            pim_instructions.append(str_exe_mac)

        # --- End of k loop (inner loop) ---

        # 4. Store result C[i][j] from accumulator
        row_c = calculate_pim_row_address('C', i, j)
        val_wr_c, str_wr_c = format_pim_instruction(
            opcode=OPCODE_EXE, # Store might still be an 'EXE' type with WR bit set? Or END handles write? Fig 7 is key.
                               # Let's assume EXE with WR bit based on Fig 5 structure.
            pointer=POINTER_STORE_C, # Placeholder
            rd_bit=0,
            wr_bit=1,
            row_addr=row_c
        )
        pim_instructions.append(str_wr_c)

        # 5. End the sequence for C[i][j]
        # Assumption: END might implicitly write back result OR reset accumulator.
        # If EXE WR already wrote, END might just be for sequencing/reset.
        val_end, str_end = format_pim_instruction(
            opcode=OPCODE_END,
            pointer=POINTER_GENERIC_END, # Generic pointer for END
            rd_bit=0,
            wr_bit=0,
            row_addr=0 # Address ignored
        )
        pim_instructions.append(str_end)
        pim_instructions.append("-" * 60) # Separator for clarity

# --- Output the generated instructions ---
for instr_str in pim_instructions:
    print(instr_str)

print(f"\nGenerated {len(pim_instructions) - M*N} PIM instructions.") # Adjust count for separators

# Optional: Write to an output file
with open("output_pim.isa", "w") as f:
    for instr_str in pim_instructions:
        f.write(instr_str + "\n")