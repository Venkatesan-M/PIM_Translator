; ModuleID = 'src/frontend/matrix_mult.cpp'
source_filename = "src/frontend/matrix_mult.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::basic_ostream" = type { ptr, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", ptr, i8, i8, ptr, ptr, ptr, ptr }
%"class.std::ios_base" = type { ptr, i64, i64, i32, i32, i32, ptr, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, ptr, %"class.std::locale" }
%"struct.std::ios_base::_Words" = type { ptr, i64 }
%"class.std::locale" = type { ptr }
%"class.std::basic_istream" = type { ptr, i64, %"class.std::basic_ios" }
%"class.std::vector" = type { %"struct.std::_Vector_base" }
%"struct.std::_Vector_base" = type { %"struct.std::_Vector_base<std::vector<int>, std::allocator<std::vector<int>>>::_Vector_impl" }
%"struct.std::_Vector_base<std::vector<int>, std::allocator<std::vector<int>>>::_Vector_impl" = type { %"struct.std::_Vector_base<std::vector<int>, std::allocator<std::vector<int>>>::_Vector_impl_data" }
%"struct.std::_Vector_base<std::vector<int>, std::allocator<std::vector<int>>>::_Vector_impl_data" = type { ptr, ptr, ptr }
%"class.std::vector.0" = type { %"struct.std::_Vector_base.1" }
%"struct.std::_Vector_base.1" = type { %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl" }
%"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl" = type { %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data" }
%"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data" = type { ptr, ptr, ptr }

$_ZNSt6vectorIS_IiSaIiEESaIS1_EED2Ev = comdat any

$__clang_call_terminate = comdat any

$_ZNSt22__uninitialized_fill_nILb0EE15__uninit_fill_nIPSt6vectorIiSaIiEEmS4_EET_S6_T0_RKT1_ = comdat any

$_ZSt8_DestroyIPSt6vectorIiSaIiEEEvT_S4_ = comdat any

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@_ZSt4cout = external global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.1 = private unnamed_addr constant [42 x i8] c"Enter rows and columns for first matrix: \00", align 1
@_ZSt3cin = external global %"class.std::basic_istream", align 8
@.str.2 = private unnamed_addr constant [43 x i8] c"Enter rows and columns for second matrix: \00", align 1
@.str.3 = private unnamed_addr constant [92 x i8] c"Error: Number of columns of first matrix must be equal to number of rows of second matrix.\0A\00", align 1
@.str.4 = private unnamed_addr constant [33 x i8] c"Enter elements of first matrix:\0A\00", align 1
@.str.5 = private unnamed_addr constant [34 x i8] c"Enter elements of second matrix:\0A\00", align 1
@.str.6 = private unnamed_addr constant [19 x i8] c"Resultant matrix:\0A\00", align 1
@.str.7 = private unnamed_addr constant [49 x i8] c"cannot create std::vector larger than max_size()\00", align 1
@llvm.global_ctors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 65535, ptr @_GLOBAL__sub_I_matrix_mult.cpp, ptr null }]

declare void @_ZNSt8ios_base4InitC1Ev(ptr noundef nonnull align 1 dereferenceable(1)) unnamed_addr #0

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(ptr noundef nonnull align 1 dereferenceable(1)) unnamed_addr #1

; Function Attrs: nofree nounwind
declare i32 @__cxa_atexit(ptr, ptr, ptr) local_unnamed_addr #2

; Function Attrs: mustprogress uwtable
define dso_local void @_Z16multiplyMatricesRKSt6vectorIS_IiSaIiEESaIS1_EES5_iii(ptr dead_on_unwind noalias nocapture writable writeonly sret(%"class.std::vector") align 8 %0, ptr nocapture noundef nonnull readonly align 8 dereferenceable(24) %1, ptr nocapture noundef nonnull readonly align 8 dereferenceable(24) %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) local_unnamed_addr #3 personality ptr @__gxx_personality_v0 {
  %7 = alloca %"class.std::vector.0", align 8
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %7) #16
  %8 = sext i32 %5 to i64
  %9 = icmp slt i32 %5, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %6
  tail call void @_ZSt20__throw_length_errorPKc(ptr noundef nonnull @.str.7) #17
  unreachable

11:                                               ; preds = %6
  %12 = icmp eq i32 %5, 0
  br i1 %12, label %13, label %14

13:                                               ; preds = %11
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %7, i8 0, i64 24, i1 false)
  br label %19

14:                                               ; preds = %11
  %15 = shl nuw nsw i64 %8, 2
  %16 = tail call noalias noundef nonnull ptr @_Znwm(i64 noundef %15) #18
  store ptr %16, ptr %7, align 8, !tbaa !5
  %17 = getelementptr inbounds i32, ptr %16, i64 %8
  %18 = getelementptr inbounds i8, ptr %7, i64 16
  store ptr %17, ptr %18, align 8, !tbaa !10
  tail call void @llvm.memset.p0.i64(ptr nonnull align 4 %16, i8 0, i64 %15, i1 false), !tbaa !11
  br label %19

19:                                               ; preds = %14, %13
  %20 = phi ptr [ null, %13 ], [ %17, %14 ]
  %21 = getelementptr inbounds i8, ptr %7, i64 8
  store ptr %20, ptr %21, align 8, !tbaa !13
  %22 = sext i32 %3 to i64
  %23 = icmp slt i32 %3, 0
  br i1 %23, label %24, label %26

24:                                               ; preds = %19
  invoke void @_ZSt20__throw_length_errorPKc(ptr noundef nonnull @.str.7) #17
          to label %25 unwind label %69

25:                                               ; preds = %24
  unreachable

26:                                               ; preds = %19
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %0, i8 0, i64 24, i1 false)
  %27 = icmp eq i32 %3, 0
  br i1 %27, label %31, label %28

28:                                               ; preds = %26
  %29 = mul nuw nsw i64 %22, 24
  %30 = invoke noalias noundef nonnull ptr @_Znwm(i64 noundef %29) #18
          to label %31 unwind label %69

31:                                               ; preds = %28, %26
  %32 = phi ptr [ null, %26 ], [ %30, %28 ]
  store ptr %32, ptr %0, align 8, !tbaa !14
  %33 = getelementptr inbounds i8, ptr %0, i64 8
  store ptr %32, ptr %33, align 8, !tbaa !16
  %34 = getelementptr inbounds %"class.std::vector.0", ptr %32, i64 %22
  %35 = getelementptr inbounds i8, ptr %0, i64 16
  store ptr %34, ptr %35, align 8, !tbaa !17
  %36 = invoke noundef ptr @_ZNSt22__uninitialized_fill_nILb0EE15__uninit_fill_nIPSt6vectorIiSaIiEEmS4_EET_S6_T0_RKT1_(ptr noundef %32, i64 noundef %22, ptr noundef nonnull align 8 dereferenceable(24) %7)
          to label %42 unwind label %37

37:                                               ; preds = %31
  %38 = landingpad { ptr, i32 }
          cleanup
  %39 = icmp eq ptr %32, null
  br i1 %39, label %71, label %40

40:                                               ; preds = %37
  %41 = mul nuw nsw i64 %22, 24
  call void @_ZdlPvm(ptr noundef nonnull %32, i64 noundef %41) #16
  br label %71

42:                                               ; preds = %31
  store ptr %36, ptr %33, align 8, !tbaa !16
  %43 = load ptr, ptr %7, align 8, !tbaa !5
  %44 = icmp eq ptr %43, null
  br i1 %44, label %51, label %45

45:                                               ; preds = %42
  %46 = getelementptr inbounds i8, ptr %7, i64 16
  %47 = load ptr, ptr %46, align 8, !tbaa !10
  %48 = ptrtoint ptr %47 to i64
  %49 = ptrtoint ptr %43 to i64
  %50 = sub i64 %48, %49
  call void @_ZdlPvm(ptr noundef nonnull %43, i64 noundef %50) #16
  br label %51

51:                                               ; preds = %42, %45
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %7) #16
  br i1 %27, label %131, label %52

52:                                               ; preds = %51
  %53 = icmp sgt i32 %4, 0
  %54 = call i32 @llvm.umax.i32(i32 %5, i32 1)
  %55 = zext nneg i32 %3 to i64
  %56 = zext nneg i32 %54 to i64
  %57 = zext i32 %4 to i64
  %58 = and i64 %57, 1
  %59 = icmp eq i32 %4, 1
  %60 = and i64 %57, 2147483646
  %61 = icmp eq i64 %58, 0
  br label %62

62:                                               ; preds = %52, %89
  %63 = phi i64 [ 0, %52 ], [ %90, %89 ]
  br i1 %12, label %89, label %64

64:                                               ; preds = %62
  %65 = load ptr, ptr %1, align 8
  %66 = getelementptr inbounds %"class.std::vector.0", ptr %65, i64 %63
  %67 = load ptr, ptr %2, align 8
  %68 = getelementptr inbounds %"class.std::vector.0", ptr %32, i64 %63
  br label %82

69:                                               ; preds = %28, %24
  %70 = landingpad { ptr, i32 }
          cleanup
  br label %71

71:                                               ; preds = %37, %40, %69
  %72 = phi { ptr, i32 } [ %70, %69 ], [ %38, %40 ], [ %38, %37 ]
  %73 = load ptr, ptr %7, align 8, !tbaa !5
  %74 = icmp eq ptr %73, null
  br i1 %74, label %81, label %75

75:                                               ; preds = %71
  %76 = getelementptr inbounds i8, ptr %7, i64 16
  %77 = load ptr, ptr %76, align 8, !tbaa !10
  %78 = ptrtoint ptr %77 to i64
  %79 = ptrtoint ptr %73 to i64
  %80 = sub i64 %78, %79
  call void @_ZdlPvm(ptr noundef nonnull %73, i64 noundef %80) #16
  br label %81

81:                                               ; preds = %75, %71
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %7) #16
  resume { ptr, i32 } %72

82:                                               ; preds = %64, %104
  %83 = phi i64 [ 0, %64 ], [ %105, %104 ]
  br i1 %53, label %84, label %104

84:                                               ; preds = %82
  %85 = load ptr, ptr %66, align 8, !tbaa !5
  %86 = load ptr, ptr %68, align 8, !tbaa !5
  %87 = getelementptr inbounds i32, ptr %86, i64 %83
  %88 = load i32, ptr %87, align 4, !tbaa !11
  br i1 %59, label %92, label %107

89:                                               ; preds = %104, %62
  %90 = add nuw nsw i64 %63, 1
  %91 = icmp eq i64 %90, %55
  br i1 %91, label %131, label %62, !llvm.loop !18

92:                                               ; preds = %107, %84
  %93 = phi i64 [ 0, %84 ], [ %128, %107 ]
  %94 = phi i32 [ %88, %84 ], [ %127, %107 ]
  br i1 %61, label %104, label %95

95:                                               ; preds = %92
  %96 = getelementptr inbounds i32, ptr %85, i64 %93
  %97 = load i32, ptr %96, align 4, !tbaa !11
  %98 = getelementptr inbounds %"class.std::vector.0", ptr %67, i64 %93
  %99 = load ptr, ptr %98, align 8, !tbaa !5
  %100 = getelementptr inbounds i32, ptr %99, i64 %83
  %101 = load i32, ptr %100, align 4, !tbaa !11
  %102 = mul nsw i32 %101, %97
  %103 = add nsw i32 %94, %102
  store i32 %103, ptr %87, align 4, !tbaa !11
  br label %104

104:                                              ; preds = %95, %92, %82
  %105 = add nuw nsw i64 %83, 1
  %106 = icmp eq i64 %105, %56
  br i1 %106, label %89, label %82, !llvm.loop !20

107:                                              ; preds = %84, %107
  %108 = phi i64 [ %128, %107 ], [ 0, %84 ]
  %109 = phi i32 [ %127, %107 ], [ %88, %84 ]
  %110 = phi i64 [ %129, %107 ], [ 0, %84 ]
  %111 = getelementptr inbounds i32, ptr %85, i64 %108
  %112 = load i32, ptr %111, align 4, !tbaa !11
  %113 = getelementptr inbounds %"class.std::vector.0", ptr %67, i64 %108
  %114 = load ptr, ptr %113, align 8, !tbaa !5
  %115 = getelementptr inbounds i32, ptr %114, i64 %83
  %116 = load i32, ptr %115, align 4, !tbaa !11
  %117 = mul nsw i32 %116, %112
  %118 = add nsw i32 %109, %117
  store i32 %118, ptr %87, align 4, !tbaa !11
  %119 = or disjoint i64 %108, 1
  %120 = getelementptr inbounds i32, ptr %85, i64 %119
  %121 = load i32, ptr %120, align 4, !tbaa !11
  %122 = getelementptr inbounds %"class.std::vector.0", ptr %67, i64 %119
  %123 = load ptr, ptr %122, align 8, !tbaa !5
  %124 = getelementptr inbounds i32, ptr %123, i64 %83
  %125 = load i32, ptr %124, align 4, !tbaa !11
  %126 = mul nsw i32 %125, %121
  %127 = add nsw i32 %118, %126
  store i32 %127, ptr %87, align 4, !tbaa !11
  %128 = add nuw nsw i64 %108, 2
  %129 = add i64 %110, 2
  %130 = icmp eq i64 %129, %60
  br i1 %130, label %92, label %107, !llvm.loop !21

131:                                              ; preds = %89, %51
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #4

declare i32 @__gxx_personality_v0(...)

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #4

; Function Attrs: mustprogress nounwind uwtable
define linkonce_odr dso_local void @_ZNSt6vectorIS_IiSaIiEESaIS1_EED2Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) unnamed_addr #5 comdat align 2 personality ptr @__gxx_personality_v0 {
  %2 = load ptr, ptr %0, align 8, !tbaa !14
  %3 = getelementptr inbounds i8, ptr %0, i64 8
  %4 = load ptr, ptr %3, align 8, !tbaa !16
  %5 = icmp eq ptr %2, %4
  br i1 %5, label %21, label %6

6:                                                ; preds = %1, %16
  %7 = phi ptr [ %17, %16 ], [ %2, %1 ]
  %8 = load ptr, ptr %7, align 8, !tbaa !5
  %9 = icmp eq ptr %8, null
  br i1 %9, label %16, label %10

10:                                               ; preds = %6
  %11 = getelementptr inbounds i8, ptr %7, i64 16
  %12 = load ptr, ptr %11, align 8, !tbaa !10
  %13 = ptrtoint ptr %12 to i64
  %14 = ptrtoint ptr %8 to i64
  %15 = sub i64 %13, %14
  tail call void @_ZdlPvm(ptr noundef nonnull %8, i64 noundef %15) #16
  br label %16

16:                                               ; preds = %10, %6
  %17 = getelementptr inbounds i8, ptr %7, i64 24
  %18 = icmp eq ptr %17, %4
  br i1 %18, label %19, label %6, !llvm.loop !22

19:                                               ; preds = %16
  %20 = load ptr, ptr %0, align 8, !tbaa !14
  br label %21

21:                                               ; preds = %19, %1
  %22 = phi ptr [ %20, %19 ], [ %2, %1 ]
  %23 = icmp eq ptr %22, null
  br i1 %23, label %30, label %24

24:                                               ; preds = %21
  %25 = getelementptr inbounds i8, ptr %0, i64 16
  %26 = load ptr, ptr %25, align 8, !tbaa !17
  %27 = ptrtoint ptr %26 to i64
  %28 = ptrtoint ptr %22 to i64
  %29 = sub i64 %27, %28
  tail call void @_ZdlPvm(ptr noundef nonnull %22, i64 noundef %29) #16
  br label %30

30:                                               ; preds = %21, %24
  ret void
}

; Function Attrs: mustprogress uwtable
define dso_local void @_Z13displayMatrixRKSt6vectorIS_IiSaIiEESaIS1_EE(ptr nocapture noundef nonnull readonly align 8 dereferenceable(24) %0) local_unnamed_addr #3 {
  %2 = load ptr, ptr %0, align 8, !tbaa !23
  %3 = getelementptr inbounds i8, ptr %0, i64 8
  %4 = load ptr, ptr %3, align 8, !tbaa !23
  %5 = icmp eq ptr %2, %4
  br i1 %5, label %6, label %7

6:                                                ; preds = %33, %1
  ret void

7:                                                ; preds = %1, %33
  %8 = phi ptr [ %37, %33 ], [ %2, %1 ]
  %9 = load ptr, ptr %8, align 8, !tbaa !23
  %10 = getelementptr inbounds i8, ptr %8, i64 8
  %11 = load ptr, ptr %10, align 8, !tbaa !23
  %12 = icmp eq ptr %9, %11
  br i1 %12, label %13, label %39

13:                                               ; preds = %39, %7
  %14 = load ptr, ptr @_ZSt4cout, align 8, !tbaa !24
  %15 = getelementptr i8, ptr %14, i64 -24
  %16 = load i64, ptr %15, align 8
  %17 = getelementptr i8, ptr getelementptr inbounds (i8, ptr @_ZSt4cout, i64 240), i64 %16
  %18 = load ptr, ptr %17, align 8, !tbaa !26
  %19 = icmp eq ptr %18, null
  br i1 %19, label %20, label %21

20:                                               ; preds = %13
  tail call void @_ZSt16__throw_bad_castv() #17
  unreachable

21:                                               ; preds = %13
  %22 = getelementptr inbounds i8, ptr %18, i64 56
  %23 = load i8, ptr %22, align 8, !tbaa !35
  %24 = icmp eq i8 %23, 0
  br i1 %24, label %28, label %25

25:                                               ; preds = %21
  %26 = getelementptr inbounds i8, ptr %18, i64 67
  %27 = load i8, ptr %26, align 1, !tbaa !38
  br label %33

28:                                               ; preds = %21
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %18)
  %29 = load ptr, ptr %18, align 8, !tbaa !24
  %30 = getelementptr inbounds i8, ptr %29, i64 48
  %31 = load ptr, ptr %30, align 8
  %32 = tail call noundef signext i8 %31(ptr noundef nonnull align 8 dereferenceable(570) %18, i8 noundef signext 10)
  br label %33

33:                                               ; preds = %25, %28
  %34 = phi i8 [ %27, %25 ], [ %32, %28 ]
  %35 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8 noundef signext %34)
  %36 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %35)
  %37 = getelementptr inbounds i8, ptr %8, i64 24
  %38 = icmp eq ptr %37, %4
  br i1 %38, label %6, label %7

39:                                               ; preds = %7, %39
  %40 = phi ptr [ %44, %39 ], [ %9, %7 ]
  %41 = load i32, ptr %40, align 4, !tbaa !11
  %42 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef %41)
  %43 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) %42, ptr noundef nonnull @.str, i64 noundef 1)
  %44 = getelementptr inbounds i8, ptr %40, i64 4
  %45 = icmp eq ptr %44, %11
  br i1 %45, label %13, label %39
}

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8), i32 noundef) local_unnamed_addr #0

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef range(i32 0, 2) i32 @main() local_unnamed_addr #6 personality ptr @__gxx_personality_v0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca %"class.std::vector", align 8
  %6 = alloca %"class.std::vector.0", align 8
  %7 = alloca %"class.std::vector", align 8
  %8 = alloca %"class.std::vector.0", align 8
  %9 = alloca %"class.std::vector", align 8
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %1) #16
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2) #16
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %3) #16
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4) #16
  %10 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.1, i64 noundef 41)
  %11 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZNSirsERi(ptr noundef nonnull align 8 dereferenceable(16) @_ZSt3cin, ptr noundef nonnull align 4 dereferenceable(4) %1)
  %12 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZNSirsERi(ptr noundef nonnull align 8 dereferenceable(16) %11, ptr noundef nonnull align 4 dereferenceable(4) %2)
  %13 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.2, i64 noundef 42)
  %14 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZNSirsERi(ptr noundef nonnull align 8 dereferenceable(16) @_ZSt3cin, ptr noundef nonnull align 4 dereferenceable(4) %3)
  %15 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZNSirsERi(ptr noundef nonnull align 8 dereferenceable(16) %14, ptr noundef nonnull align 4 dereferenceable(4) %4)
  %16 = load i32, ptr %2, align 4, !tbaa !11
  %17 = load i32, ptr %3, align 4, !tbaa !11
  %18 = icmp eq i32 %16, %17
  br i1 %18, label %21, label %19

19:                                               ; preds = %0
  %20 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.3, i64 noundef 91)
  br label %307

21:                                               ; preds = %0
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %5) #16
  %22 = load i32, ptr %1, align 4, !tbaa !11
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %6) #16
  %23 = sext i32 %16 to i64
  %24 = icmp slt i32 %16, 0
  br i1 %24, label %25, label %27

25:                                               ; preds = %21
  invoke void @_ZSt20__throw_length_errorPKc(ptr noundef nonnull @.str.7) #17
          to label %26 unwind label %142

26:                                               ; preds = %25
  unreachable

27:                                               ; preds = %21
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %6, i8 0, i64 24, i1 false)
  %28 = icmp eq i32 %16, 0
  br i1 %28, label %39, label %29

29:                                               ; preds = %27
  %30 = shl nuw nsw i64 %23, 2
  %31 = invoke noalias noundef nonnull ptr @_Znwm(i64 noundef %30) #18
          to label %32 unwind label %142

32:                                               ; preds = %29
  store ptr %31, ptr %6, align 8, !tbaa !5
  %33 = getelementptr i32, ptr %31, i64 %23
  %34 = getelementptr inbounds i8, ptr %6, i64 16
  store ptr %33, ptr %34, align 8, !tbaa !10
  store i32 0, ptr %31, align 4, !tbaa !11
  %35 = getelementptr i8, ptr %31, i64 4
  %36 = icmp eq i32 %16, 1
  br i1 %36, label %39, label %37

37:                                               ; preds = %32
  %38 = add nsw i64 %30, -4
  call void @llvm.memset.p0.i64(ptr align 4 %35, i8 0, i64 %38, i1 false), !tbaa !11
  br label %39

39:                                               ; preds = %27, %37, %32
  %40 = phi ptr [ %35, %32 ], [ %33, %37 ], [ null, %27 ]
  %41 = getelementptr inbounds i8, ptr %6, i64 8
  store ptr %40, ptr %41, align 8, !tbaa !13
  %42 = sext i32 %22 to i64
  %43 = icmp slt i32 %22, 0
  br i1 %43, label %44, label %46

44:                                               ; preds = %39
  invoke void @_ZSt20__throw_length_errorPKc(ptr noundef nonnull @.str.7) #17
          to label %45 unwind label %144

45:                                               ; preds = %44
  unreachable

46:                                               ; preds = %39
  %47 = icmp eq i32 %22, 0
  br i1 %47, label %51, label %48

48:                                               ; preds = %46
  %49 = mul nuw nsw i64 %42, 24
  %50 = invoke noalias noundef nonnull ptr @_Znwm(i64 noundef %49) #18
          to label %51 unwind label %144

51:                                               ; preds = %48, %46
  %52 = phi ptr [ null, %46 ], [ %50, %48 ]
  store ptr %52, ptr %5, align 8, !tbaa !14
  %53 = getelementptr inbounds %"class.std::vector.0", ptr %52, i64 %42
  %54 = getelementptr inbounds i8, ptr %5, i64 16
  store ptr %53, ptr %54, align 8, !tbaa !17
  %55 = invoke noundef ptr @_ZNSt22__uninitialized_fill_nILb0EE15__uninit_fill_nIPSt6vectorIiSaIiEEmS4_EET_S6_T0_RKT1_(ptr noundef %52, i64 noundef %42, ptr noundef nonnull align 8 dereferenceable(24) %6)
          to label %61 unwind label %56

56:                                               ; preds = %51
  %57 = landingpad { ptr, i32 }
          cleanup
  %58 = icmp eq ptr %52, null
  br i1 %58, label %146, label %59

59:                                               ; preds = %56
  %60 = mul nuw nsw i64 %42, 24
  call void @_ZdlPvm(ptr noundef nonnull %52, i64 noundef %60) #16
  br label %146

61:                                               ; preds = %51
  %62 = getelementptr inbounds i8, ptr %5, i64 8
  store ptr %55, ptr %62, align 8, !tbaa !16
  %63 = load ptr, ptr %6, align 8, !tbaa !5
  %64 = icmp eq ptr %63, null
  br i1 %64, label %71, label %65

65:                                               ; preds = %61
  %66 = getelementptr inbounds i8, ptr %6, i64 16
  %67 = load ptr, ptr %66, align 8, !tbaa !10
  %68 = ptrtoint ptr %67 to i64
  %69 = ptrtoint ptr %63 to i64
  %70 = sub i64 %68, %69
  call void @_ZdlPvm(ptr noundef nonnull %63, i64 noundef %70) #16
  br label %71

71:                                               ; preds = %61, %65
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %6) #16
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %7) #16
  %72 = load i32, ptr %3, align 4, !tbaa !11
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %8) #16
  %73 = load i32, ptr %4, align 4, !tbaa !11
  %74 = sext i32 %73 to i64
  %75 = icmp slt i32 %73, 0
  br i1 %75, label %76, label %78

76:                                               ; preds = %71
  invoke void @_ZSt20__throw_length_errorPKc(ptr noundef nonnull @.str.7) #17
          to label %77 unwind label %158

77:                                               ; preds = %76
  unreachable

78:                                               ; preds = %71
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %8, i8 0, i64 24, i1 false)
  %79 = icmp eq i32 %73, 0
  br i1 %79, label %90, label %80

80:                                               ; preds = %78
  %81 = shl nuw nsw i64 %74, 2
  %82 = invoke noalias noundef nonnull ptr @_Znwm(i64 noundef %81) #18
          to label %83 unwind label %158

83:                                               ; preds = %80
  store ptr %82, ptr %8, align 8, !tbaa !5
  %84 = getelementptr i32, ptr %82, i64 %74
  %85 = getelementptr inbounds i8, ptr %8, i64 16
  store ptr %84, ptr %85, align 8, !tbaa !10
  store i32 0, ptr %82, align 4, !tbaa !11
  %86 = getelementptr i8, ptr %82, i64 4
  %87 = icmp eq i32 %73, 1
  br i1 %87, label %90, label %88

88:                                               ; preds = %83
  %89 = add nsw i64 %81, -4
  call void @llvm.memset.p0.i64(ptr align 4 %86, i8 0, i64 %89, i1 false), !tbaa !11
  br label %90

90:                                               ; preds = %78, %88, %83
  %91 = phi ptr [ %86, %83 ], [ %84, %88 ], [ null, %78 ]
  %92 = getelementptr inbounds i8, ptr %8, i64 8
  store ptr %91, ptr %92, align 8, !tbaa !13
  %93 = sext i32 %72 to i64
  %94 = icmp slt i32 %72, 0
  br i1 %94, label %95, label %97

95:                                               ; preds = %90
  invoke void @_ZSt20__throw_length_errorPKc(ptr noundef nonnull @.str.7) #17
          to label %96 unwind label %160

96:                                               ; preds = %95
  unreachable

97:                                               ; preds = %90
  %98 = icmp eq i32 %72, 0
  br i1 %98, label %102, label %99

99:                                               ; preds = %97
  %100 = mul nuw nsw i64 %93, 24
  %101 = invoke noalias noundef nonnull ptr @_Znwm(i64 noundef %100) #18
          to label %102 unwind label %160

102:                                              ; preds = %99, %97
  %103 = phi ptr [ null, %97 ], [ %101, %99 ]
  store ptr %103, ptr %7, align 8, !tbaa !14
  %104 = getelementptr inbounds %"class.std::vector.0", ptr %103, i64 %93
  %105 = getelementptr inbounds i8, ptr %7, i64 16
  store ptr %104, ptr %105, align 8, !tbaa !17
  %106 = invoke noundef ptr @_ZNSt22__uninitialized_fill_nILb0EE15__uninit_fill_nIPSt6vectorIiSaIiEEmS4_EET_S6_T0_RKT1_(ptr noundef %103, i64 noundef %93, ptr noundef nonnull align 8 dereferenceable(24) %8)
          to label %112 unwind label %107

107:                                              ; preds = %102
  %108 = landingpad { ptr, i32 }
          cleanup
  %109 = icmp eq ptr %103, null
  br i1 %109, label %162, label %110

110:                                              ; preds = %107
  %111 = mul nuw nsw i64 %93, 24
  call void @_ZdlPvm(ptr noundef nonnull %103, i64 noundef %111) #16
  br label %162

112:                                              ; preds = %102
  %113 = getelementptr inbounds i8, ptr %7, i64 8
  store ptr %106, ptr %113, align 8, !tbaa !16
  %114 = load ptr, ptr %8, align 8, !tbaa !5
  %115 = icmp eq ptr %114, null
  br i1 %115, label %122, label %116

116:                                              ; preds = %112
  %117 = getelementptr inbounds i8, ptr %8, i64 16
  %118 = load ptr, ptr %117, align 8, !tbaa !10
  %119 = ptrtoint ptr %118 to i64
  %120 = ptrtoint ptr %114 to i64
  %121 = sub i64 %119, %120
  call void @_ZdlPvm(ptr noundef nonnull %114, i64 noundef %121) #16
  br label %122

122:                                              ; preds = %112, %116
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %8) #16
  %123 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.4, i64 noundef 32)
          to label %124 unwind label %174

124:                                              ; preds = %122
  %125 = load i32, ptr %1, align 4, !tbaa !11
  %126 = icmp sgt i32 %125, 0
  br i1 %126, label %127, label %136

127:                                              ; preds = %124
  %128 = load i32, ptr %2, align 4, !tbaa !11
  br label %129

129:                                              ; preds = %127, %178
  %130 = phi i32 [ %125, %127 ], [ %179, %178 ]
  %131 = phi i32 [ %128, %127 ], [ %180, %178 ]
  %132 = phi i64 [ 0, %127 ], [ %181, %178 ]
  %133 = icmp sgt i32 %131, 0
  br i1 %133, label %134, label %178

134:                                              ; preds = %129
  %135 = getelementptr inbounds %"class.std::vector.0", ptr %52, i64 %132
  br label %184

136:                                              ; preds = %178, %124
  %137 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.5, i64 noundef 33)
          to label %138 unwind label %174

138:                                              ; preds = %136
  %139 = load i32, ptr %3, align 4, !tbaa !11
  %140 = icmp sgt i32 %139, 0
  %141 = load i32, ptr %4, align 4, !tbaa !11
  br i1 %140, label %196, label %203

142:                                              ; preds = %29, %25
  %143 = landingpad { ptr, i32 }
          cleanup
  br label %156

144:                                              ; preds = %48, %44
  %145 = landingpad { ptr, i32 }
          cleanup
  br label %146

146:                                              ; preds = %56, %59, %144
  %147 = phi { ptr, i32 } [ %145, %144 ], [ %57, %59 ], [ %57, %56 ]
  %148 = load ptr, ptr %6, align 8, !tbaa !5
  %149 = icmp eq ptr %148, null
  br i1 %149, label %156, label %150

150:                                              ; preds = %146
  %151 = getelementptr inbounds i8, ptr %6, i64 16
  %152 = load ptr, ptr %151, align 8, !tbaa !10
  %153 = ptrtoint ptr %152 to i64
  %154 = ptrtoint ptr %148 to i64
  %155 = sub i64 %153, %154
  call void @_ZdlPvm(ptr noundef nonnull %148, i64 noundef %155) #16
  br label %156

156:                                              ; preds = %150, %146, %142
  %157 = phi { ptr, i32 } [ %143, %142 ], [ %147, %146 ], [ %147, %150 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %6) #16
  br label %305

158:                                              ; preds = %80, %76
  %159 = landingpad { ptr, i32 }
          cleanup
  br label %172

160:                                              ; preds = %99, %95
  %161 = landingpad { ptr, i32 }
          cleanup
  br label %162

162:                                              ; preds = %107, %110, %160
  %163 = phi { ptr, i32 } [ %161, %160 ], [ %108, %110 ], [ %108, %107 ]
  %164 = load ptr, ptr %8, align 8, !tbaa !5
  %165 = icmp eq ptr %164, null
  br i1 %165, label %172, label %166

166:                                              ; preds = %162
  %167 = getelementptr inbounds i8, ptr %8, i64 16
  %168 = load ptr, ptr %167, align 8, !tbaa !10
  %169 = ptrtoint ptr %168 to i64
  %170 = ptrtoint ptr %164 to i64
  %171 = sub i64 %169, %170
  call void @_ZdlPvm(ptr noundef nonnull %164, i64 noundef %171) #16
  br label %172

172:                                              ; preds = %166, %162, %158
  %173 = phi { ptr, i32 } [ %159, %158 ], [ %163, %162 ], [ %163, %166 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %8) #16
  br label %303

174:                                              ; preds = %136, %122
  %175 = landingpad { ptr, i32 }
          cleanup
  br label %301

176:                                              ; preds = %189
  %177 = load i32, ptr %1, align 4, !tbaa !11
  br label %178

178:                                              ; preds = %176, %129
  %179 = phi i32 [ %177, %176 ], [ %130, %129 ]
  %180 = phi i32 [ %191, %176 ], [ %131, %129 ]
  %181 = add nuw nsw i64 %132, 1
  %182 = sext i32 %179 to i64
  %183 = icmp slt i64 %181, %182
  br i1 %183, label %129, label %136, !llvm.loop !39

184:                                              ; preds = %134, %189
  %185 = phi i64 [ 0, %134 ], [ %190, %189 ]
  %186 = load ptr, ptr %135, align 8, !tbaa !5
  %187 = getelementptr inbounds i32, ptr %186, i64 %185
  %188 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZNSirsERi(ptr noundef nonnull align 8 dereferenceable(16) @_ZSt3cin, ptr noundef nonnull align 4 dereferenceable(4) %187)
          to label %189 unwind label %194

189:                                              ; preds = %184
  %190 = add nuw nsw i64 %185, 1
  %191 = load i32, ptr %2, align 4, !tbaa !11
  %192 = sext i32 %191 to i64
  %193 = icmp slt i64 %190, %192
  br i1 %193, label %184, label %176, !llvm.loop !40

194:                                              ; preds = %184
  %195 = landingpad { ptr, i32 }
          cleanup
  br label %301

196:                                              ; preds = %138, %209
  %197 = phi i32 [ %210, %209 ], [ %139, %138 ]
  %198 = phi i32 [ %211, %209 ], [ %141, %138 ]
  %199 = phi i64 [ %212, %209 ], [ 0, %138 ]
  %200 = icmp sgt i32 %198, 0
  br i1 %200, label %201, label %209

201:                                              ; preds = %196
  %202 = getelementptr inbounds %"class.std::vector.0", ptr %103, i64 %199
  br label %215

203:                                              ; preds = %209, %138
  %204 = phi i32 [ %141, %138 ], [ %211, %209 ]
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %9) #16
  %205 = load i32, ptr %1, align 4, !tbaa !11
  %206 = load i32, ptr %2, align 4, !tbaa !11
  invoke void @_Z16multiplyMatricesRKSt6vectorIS_IiSaIiEESaIS1_EES5_iii(ptr dead_on_unwind nonnull writable sret(%"class.std::vector") align 8 %9, ptr noundef nonnull align 8 dereferenceable(24) %5, ptr noundef nonnull align 8 dereferenceable(24) %7, i32 noundef %205, i32 noundef %206, i32 noundef %204)
          to label %227 unwind label %295

207:                                              ; preds = %220
  %208 = load i32, ptr %3, align 4, !tbaa !11
  br label %209

209:                                              ; preds = %207, %196
  %210 = phi i32 [ %208, %207 ], [ %197, %196 ]
  %211 = phi i32 [ %222, %207 ], [ %198, %196 ]
  %212 = add nuw nsw i64 %199, 1
  %213 = sext i32 %210 to i64
  %214 = icmp slt i64 %212, %213
  br i1 %214, label %196, label %203, !llvm.loop !41

215:                                              ; preds = %201, %220
  %216 = phi i64 [ 0, %201 ], [ %221, %220 ]
  %217 = load ptr, ptr %202, align 8, !tbaa !5
  %218 = getelementptr inbounds i32, ptr %217, i64 %216
  %219 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZNSirsERi(ptr noundef nonnull align 8 dereferenceable(16) @_ZSt3cin, ptr noundef nonnull align 4 dereferenceable(4) %218)
          to label %220 unwind label %225

220:                                              ; preds = %215
  %221 = add nuw nsw i64 %216, 1
  %222 = load i32, ptr %4, align 4, !tbaa !11
  %223 = sext i32 %222 to i64
  %224 = icmp slt i64 %221, %223
  br i1 %224, label %215, label %207, !llvm.loop !42

225:                                              ; preds = %215
  %226 = landingpad { ptr, i32 }
          cleanup
  br label %301

227:                                              ; preds = %203
  %228 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.6, i64 noundef 18)
          to label %229 unwind label %297

229:                                              ; preds = %227
  invoke void @_Z13displayMatrixRKSt6vectorIS_IiSaIiEESaIS1_EE(ptr noundef nonnull align 8 dereferenceable(24) %9)
          to label %230 unwind label %297

230:                                              ; preds = %229
  %231 = load ptr, ptr %9, align 8, !tbaa !14
  %232 = getelementptr inbounds i8, ptr %9, i64 8
  %233 = load ptr, ptr %232, align 8, !tbaa !16
  %234 = icmp eq ptr %231, %233
  br i1 %234, label %248, label %235

235:                                              ; preds = %230, %245
  %236 = phi ptr [ %246, %245 ], [ %231, %230 ]
  %237 = load ptr, ptr %236, align 8, !tbaa !5
  %238 = icmp eq ptr %237, null
  br i1 %238, label %245, label %239

239:                                              ; preds = %235
  %240 = getelementptr inbounds i8, ptr %236, i64 16
  %241 = load ptr, ptr %240, align 8, !tbaa !10
  %242 = ptrtoint ptr %241 to i64
  %243 = ptrtoint ptr %237 to i64
  %244 = sub i64 %242, %243
  call void @_ZdlPvm(ptr noundef nonnull %237, i64 noundef %244) #16
  br label %245

245:                                              ; preds = %239, %235
  %246 = getelementptr inbounds i8, ptr %236, i64 24
  %247 = icmp eq ptr %246, %233
  br i1 %247, label %248, label %235, !llvm.loop !22

248:                                              ; preds = %245, %230
  %249 = icmp eq ptr %231, null
  br i1 %249, label %256, label %250

250:                                              ; preds = %248
  %251 = getelementptr inbounds i8, ptr %9, i64 16
  %252 = load ptr, ptr %251, align 8, !tbaa !17
  %253 = ptrtoint ptr %252 to i64
  %254 = ptrtoint ptr %231 to i64
  %255 = sub i64 %253, %254
  call void @_ZdlPvm(ptr noundef nonnull %231, i64 noundef %255) #16
  br label %256

256:                                              ; preds = %248, %250
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %9) #16
  %257 = icmp eq ptr %103, %106
  br i1 %257, label %271, label %258

258:                                              ; preds = %256, %268
  %259 = phi ptr [ %269, %268 ], [ %103, %256 ]
  %260 = load ptr, ptr %259, align 8, !tbaa !5
  %261 = icmp eq ptr %260, null
  br i1 %261, label %268, label %262

262:                                              ; preds = %258
  %263 = getelementptr inbounds i8, ptr %259, i64 16
  %264 = load ptr, ptr %263, align 8, !tbaa !10
  %265 = ptrtoint ptr %264 to i64
  %266 = ptrtoint ptr %260 to i64
  %267 = sub i64 %265, %266
  call void @_ZdlPvm(ptr noundef nonnull %260, i64 noundef %267) #16
  br label %268

268:                                              ; preds = %262, %258
  %269 = getelementptr inbounds i8, ptr %259, i64 24
  %270 = icmp eq ptr %269, %106
  br i1 %270, label %271, label %258, !llvm.loop !22

271:                                              ; preds = %268, %256
  %272 = icmp eq ptr %103, null
  br i1 %272, label %275, label %273

273:                                              ; preds = %271
  %274 = mul nuw nsw i64 %93, 24
  call void @_ZdlPvm(ptr noundef nonnull %103, i64 noundef %274) #16
  br label %275

275:                                              ; preds = %271, %273
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %7) #16
  %276 = icmp eq ptr %52, %55
  br i1 %276, label %290, label %277

277:                                              ; preds = %275, %287
  %278 = phi ptr [ %288, %287 ], [ %52, %275 ]
  %279 = load ptr, ptr %278, align 8, !tbaa !5
  %280 = icmp eq ptr %279, null
  br i1 %280, label %287, label %281

281:                                              ; preds = %277
  %282 = getelementptr inbounds i8, ptr %278, i64 16
  %283 = load ptr, ptr %282, align 8, !tbaa !10
  %284 = ptrtoint ptr %283 to i64
  %285 = ptrtoint ptr %279 to i64
  %286 = sub i64 %284, %285
  call void @_ZdlPvm(ptr noundef nonnull %279, i64 noundef %286) #16
  br label %287

287:                                              ; preds = %281, %277
  %288 = getelementptr inbounds i8, ptr %278, i64 24
  %289 = icmp eq ptr %288, %55
  br i1 %289, label %290, label %277, !llvm.loop !22

290:                                              ; preds = %287, %275
  %291 = icmp eq ptr %52, null
  br i1 %291, label %294, label %292

292:                                              ; preds = %290
  %293 = mul nuw nsw i64 %42, 24
  call void @_ZdlPvm(ptr noundef nonnull %52, i64 noundef %293) #16
  br label %294

294:                                              ; preds = %290, %292
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %5) #16
  br label %307

295:                                              ; preds = %203
  %296 = landingpad { ptr, i32 }
          cleanup
  br label %299

297:                                              ; preds = %227, %229
  %298 = landingpad { ptr, i32 }
          cleanup
  call void @_ZNSt6vectorIS_IiSaIiEESaIS1_EED2Ev(ptr noundef nonnull align 8 dereferenceable(24) %9) #16
  br label %299

299:                                              ; preds = %297, %295
  %300 = phi { ptr, i32 } [ %298, %297 ], [ %296, %295 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %9) #16
  br label %301

301:                                              ; preds = %299, %225, %194, %174
  %302 = phi { ptr, i32 } [ %195, %194 ], [ %226, %225 ], [ %300, %299 ], [ %175, %174 ]
  call void @_ZNSt6vectorIS_IiSaIiEESaIS1_EED2Ev(ptr noundef nonnull align 8 dereferenceable(24) %7) #16
  br label %303

303:                                              ; preds = %301, %172
  %304 = phi { ptr, i32 } [ %302, %301 ], [ %173, %172 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %7) #16
  call void @_ZNSt6vectorIS_IiSaIiEESaIS1_EED2Ev(ptr noundef nonnull align 8 dereferenceable(24) %5) #16
  br label %305

305:                                              ; preds = %303, %156
  %306 = phi { ptr, i32 } [ %304, %303 ], [ %157, %156 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %5) #16
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #16
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %3) #16
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2) #16
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %1) #16
  resume { ptr, i32 } %306

307:                                              ; preds = %294, %19
  %308 = phi i32 [ 1, %19 ], [ 0, %294 ]
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #16
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %3) #16
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2) #16
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %1) #16
  ret i32 %308
}

declare noundef nonnull align 8 dereferenceable(16) ptr @_ZNSirsERi(ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 4 dereferenceable(4)) local_unnamed_addr #0

; Function Attrs: noreturn
declare void @_ZSt20__throw_length_errorPKc(ptr noundef) local_unnamed_addr #7

; Function Attrs: noinline noreturn nounwind uwtable
define linkonce_odr hidden void @__clang_call_terminate(ptr noundef %0) local_unnamed_addr #8 comdat {
  %2 = tail call ptr @__cxa_begin_catch(ptr %0) #16
  tail call void @_ZSt9terminatev() #19
  unreachable
}

declare ptr @__cxa_begin_catch(ptr) local_unnamed_addr

declare void @_ZSt9terminatev() local_unnamed_addr

; Function Attrs: noreturn
declare void @_ZSt28__throw_bad_array_new_lengthv() local_unnamed_addr #7

; Function Attrs: nobuiltin allocsize(0)
declare noundef nonnull ptr @_Znwm(i64 noundef) local_unnamed_addr #9

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPvm(ptr noundef, i64 noundef) local_unnamed_addr #10

; Function Attrs: mustprogress uwtable
define linkonce_odr dso_local noundef ptr @_ZNSt22__uninitialized_fill_nILb0EE15__uninit_fill_nIPSt6vectorIiSaIiEEmS4_EET_S6_T0_RKT1_(ptr noundef %0, i64 noundef %1, ptr noundef nonnull align 8 dereferenceable(24) %2) local_unnamed_addr #3 comdat align 2 personality ptr @__gxx_personality_v0 {
  %4 = icmp eq i64 %1, 0
  br i1 %4, label %50, label %5

5:                                                ; preds = %3
  %6 = getelementptr inbounds i8, ptr %2, i64 8
  %7 = load ptr, ptr %2, align 8, !tbaa !5
  br label %8

8:                                                ; preds = %5, %36
  %9 = phi ptr [ %7, %5 ], [ %29, %36 ]
  %10 = phi ptr [ %0, %5 ], [ %39, %36 ]
  %11 = phi i64 [ %1, %5 ], [ %38, %36 ]
  %12 = load ptr, ptr %6, align 8, !tbaa !13
  %13 = ptrtoint ptr %12 to i64
  %14 = ptrtoint ptr %9 to i64
  %15 = sub i64 %13, %14
  %16 = ashr exact i64 %15, 2
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %10, i8 0, i64 24, i1 false)
  %17 = icmp eq ptr %12, %9
  br i1 %17, label %24, label %18

18:                                               ; preds = %8
  %19 = icmp ugt i64 %16, 2305843009213693951
  br i1 %19, label %20, label %22, !prof !43

20:                                               ; preds = %18
  invoke void @_ZSt28__throw_bad_array_new_lengthv() #17
          to label %21 unwind label %43

21:                                               ; preds = %20
  unreachable

22:                                               ; preds = %18
  %23 = invoke noalias noundef nonnull ptr @_Znwm(i64 noundef %15) #18
          to label %24 unwind label %41

24:                                               ; preds = %22, %8
  %25 = phi ptr [ null, %8 ], [ %23, %22 ]
  store ptr %25, ptr %10, align 8, !tbaa !5
  %26 = getelementptr inbounds i8, ptr %10, i64 8
  store ptr %25, ptr %26, align 8, !tbaa !13
  %27 = getelementptr inbounds i32, ptr %25, i64 %16
  %28 = getelementptr inbounds i8, ptr %10, i64 16
  store ptr %27, ptr %28, align 8, !tbaa !10
  %29 = load ptr, ptr %2, align 8, !tbaa !23
  %30 = load ptr, ptr %6, align 8, !tbaa !23
  %31 = ptrtoint ptr %30 to i64
  %32 = ptrtoint ptr %29 to i64
  %33 = sub i64 %31, %32
  %34 = icmp eq ptr %30, %29
  br i1 %34, label %36, label %35

35:                                               ; preds = %24
  tail call void @llvm.memmove.p0.p0.i64(ptr align 4 %25, ptr align 4 %29, i64 %33, i1 false)
  br label %36

36:                                               ; preds = %35, %24
  %37 = getelementptr inbounds i8, ptr %25, i64 %33
  store ptr %37, ptr %26, align 8, !tbaa !13
  %38 = add i64 %11, -1
  %39 = getelementptr inbounds i8, ptr %10, i64 24
  %40 = icmp eq i64 %38, 0
  br i1 %40, label %50, label %8, !llvm.loop !44

41:                                               ; preds = %22
  %42 = landingpad { ptr, i32 }
          catch ptr null
  br label %45

43:                                               ; preds = %20
  %44 = landingpad { ptr, i32 }
          catch ptr null
  br label %45

45:                                               ; preds = %43, %41
  %46 = phi { ptr, i32 } [ %42, %41 ], [ %44, %43 ]
  %47 = extractvalue { ptr, i32 } %46, 0
  %48 = tail call ptr @__cxa_begin_catch(ptr %47) #16
  invoke void @_ZSt8_DestroyIPSt6vectorIiSaIiEEEvT_S4_(ptr noundef %0, ptr noundef nonnull %10)
          to label %49 unwind label %52

49:                                               ; preds = %45
  invoke void @__cxa_rethrow() #17
          to label %58 unwind label %52

50:                                               ; preds = %36, %3
  %51 = phi ptr [ %0, %3 ], [ %39, %36 ]
  ret ptr %51

52:                                               ; preds = %49, %45
  %53 = landingpad { ptr, i32 }
          cleanup
  invoke void @__cxa_end_catch()
          to label %54 unwind label %55

54:                                               ; preds = %52
  resume { ptr, i32 } %53

55:                                               ; preds = %52
  %56 = landingpad { ptr, i32 }
          catch ptr null
  %57 = extractvalue { ptr, i32 } %56, 0
  tail call void @__clang_call_terminate(ptr %57) #19
  unreachable

58:                                               ; preds = %49
  unreachable
}

; Function Attrs: inlinehint mustprogress uwtable
define linkonce_odr dso_local void @_ZSt8_DestroyIPSt6vectorIiSaIiEEEvT_S4_(ptr noundef %0, ptr noundef %1) local_unnamed_addr #11 comdat personality ptr @__gxx_personality_v0 {
  %3 = icmp eq ptr %0, %1
  br i1 %3, label %17, label %4

4:                                                ; preds = %2, %14
  %5 = phi ptr [ %15, %14 ], [ %0, %2 ]
  %6 = load ptr, ptr %5, align 8, !tbaa !5
  %7 = icmp eq ptr %6, null
  br i1 %7, label %14, label %8

8:                                                ; preds = %4
  %9 = getelementptr inbounds i8, ptr %5, i64 16
  %10 = load ptr, ptr %9, align 8, !tbaa !10
  %11 = ptrtoint ptr %10 to i64
  %12 = ptrtoint ptr %6 to i64
  %13 = sub i64 %11, %12
  tail call void @_ZdlPvm(ptr noundef nonnull %6, i64 noundef %13) #16
  br label %14

14:                                               ; preds = %8, %4
  %15 = getelementptr inbounds i8, ptr %5, i64 24
  %16 = icmp eq ptr %15, %1
  br i1 %16, label %17, label %4, !llvm.loop !22

17:                                               ; preds = %14, %2
  ret void
}

declare void @__cxa_rethrow() local_unnamed_addr

declare void @__cxa_end_catch() local_unnamed_addr

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memmove.p0.p0.i64(ptr nocapture writeonly, ptr nocapture readonly, i64, i1 immarg) #12

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8), ptr noundef, i64 noundef) local_unnamed_addr #0

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8), i8 noundef signext) local_unnamed_addr #0

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8)) local_unnamed_addr #0

; Function Attrs: noreturn
declare void @_ZSt16__throw_bad_castv() local_unnamed_addr #7

declare void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570)) local_unnamed_addr #0

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_matrix_mult.cpp() #13 section ".text.startup" {
  tail call void @_ZNSt8ios_base4InitC1Ev(ptr noundef nonnull align 1 dereferenceable(1) @_ZStL8__ioinit)
  %1 = tail call i32 @__cxa_atexit(ptr nonnull @_ZNSt8ios_base4InitD1Ev, ptr nonnull @_ZStL8__ioinit, ptr nonnull @__dso_handle) #16
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #14

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umax.i32(i32, i32) #15

attributes #0 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind }
attributes #3 = { mustprogress uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { mustprogress nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress norecurse uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { noinline noreturn nounwind uwtable "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nobuiltin allocsize(0) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nobuiltin nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { inlinehint mustprogress uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #13 = { uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #15 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #16 = { nounwind }
attributes #17 = { noreturn }
attributes #18 = { allocsize(0) }
attributes #19 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 19.1.7 (++20250114103320+cd708029e0b2-1~exp1~20250114103432.75)"}
!5 = !{!6, !7, i64 0}
!6 = !{!"_ZTSNSt12_Vector_baseIiSaIiEE17_Vector_impl_dataE", !7, i64 0, !7, i64 8, !7, i64 16}
!7 = !{!"any pointer", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!6, !7, i64 16}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !8, i64 0}
!13 = !{!6, !7, i64 8}
!14 = !{!15, !7, i64 0}
!15 = !{!"_ZTSNSt12_Vector_baseISt6vectorIiSaIiEESaIS2_EE17_Vector_impl_dataE", !7, i64 0, !7, i64 8, !7, i64 16}
!16 = !{!15, !7, i64 8}
!17 = !{!15, !7, i64 16}
!18 = distinct !{!18, !19}
!19 = !{!"llvm.loop.mustprogress"}
!20 = distinct !{!20, !19}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !19}
!23 = !{!7, !7, i64 0}
!24 = !{!25, !25, i64 0}
!25 = !{!"vtable pointer", !9, i64 0}
!26 = !{!27, !7, i64 240}
!27 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !28, i64 0, !7, i64 216, !8, i64 224, !34, i64 225, !7, i64 232, !7, i64 240, !7, i64 248, !7, i64 256}
!28 = !{!"_ZTSSt8ios_base", !29, i64 8, !29, i64 16, !30, i64 24, !31, i64 28, !31, i64 32, !7, i64 40, !32, i64 48, !8, i64 64, !12, i64 192, !7, i64 200, !33, i64 208}
!29 = !{!"long", !8, i64 0}
!30 = !{!"_ZTSSt13_Ios_Fmtflags", !8, i64 0}
!31 = !{!"_ZTSSt12_Ios_Iostate", !8, i64 0}
!32 = !{!"_ZTSNSt8ios_base6_WordsE", !7, i64 0, !29, i64 8}
!33 = !{!"_ZTSSt6locale", !7, i64 0}
!34 = !{!"bool", !8, i64 0}
!35 = !{!36, !8, i64 56}
!36 = !{!"_ZTSSt5ctypeIcE", !37, i64 0, !7, i64 16, !34, i64 24, !7, i64 32, !7, i64 40, !7, i64 48, !8, i64 56, !8, i64 57, !8, i64 313, !8, i64 569}
!37 = !{!"_ZTSNSt6locale5facetE", !12, i64 8}
!38 = !{!8, !8, i64 0}
!39 = distinct !{!39, !19}
!40 = distinct !{!40, !19}
!41 = distinct !{!41, !19}
!42 = distinct !{!42, !19}
!43 = !{!"branch_weights", !"expected", i32 1, i32 2000}
!44 = distinct !{!44, !19}
