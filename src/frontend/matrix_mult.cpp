#include <iostream>
#include <vector>

using namespace std;

vector<vector<int>> multiplyMatrices(const vector<vector<int>>& A, const vector<vector<int>>& B, int r1, int c1, int c2) {
    vector<vector<int>> result(r1, vector<int>(c2, 0));

    for (int i = 0; i < r1; i++) {
        for (int j = 0; j < c2; j++) {
            for (int k = 0; k < c1; k++) {
                result[i][j] += A[i][k] * B[k][j];
            }
        }
    }
    return result;
}

// Function to display a matrix
void displayMatrix(const vector<vector<int>>& matrix) {
    for (const auto& row : matrix) {
        for (int val : row) {
            cout << val << " ";
        }
        cout << endl;
    }
}

int main() {
    int r1, c1, r2, c2;

    // Input dimensions for matrix A
    cout << "Enter rows and columns for first matrix: ";
    cin >> r1 >> c1;

    // Input dimensions for matrix B
    cout << "Enter rows and columns for second matrix: ";
    cin >> r2 >> c2;

    // Check if multiplication is possible
    if (c1 != r2) {
        cout << "Error: Number of columns of first matrix must be equal to number of rows of second matrix.\n";
        return 1;
    }

    // Declare matrices
    vector<vector<int>> A(r1, vector<int>(c1));
    vector<vector<int>> B(r2, vector<int>(c2));

    // Input elements of matrix A
    cout << "Enter elements of first matrix:\n";
    for (int i = 0; i < r1; i++)
        for (int j = 0; j < c1; j++)
            cin >> A[i][j];

    // Input elements of matrix B
    cout << "Enter elements of second matrix:\n";
    for (int i = 0; i < r2; i++)
        for (int j = 0; j < c2; j++)
            cin >> B[i][j];

    // Multiply matrices
    vector<vector<int>> result = multiplyMatrices(A, B, r1, c1, c2);

    // Display result
    cout << "Resultant matrix:\n";
    displayMatrix(result);

    return 0;
}
