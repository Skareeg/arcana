; ModuleID = 'src/main1.c'
source_filename = "src/main1.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.41.34120"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  store i32 0, ptr %1, align 4
  store i32 5, ptr %2, align 4
  store float 5.500000e+00, ptr %3, align 4
  %5 = load i32, ptr %2, align 4
  %6 = sitofp i32 %5 to float
  %7 = load float, ptr %3, align 4
  %8 = fmul float %6, %7
  store float %8, ptr %4, align 4
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 2}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 2}
!3 = !{i32 1, !"MaxTLSAlign", i32 65536}
!4 = !{!"clang version 20.0.0git (https://github.com/llvm/llvm-project.git ec31f76df11d624699a7b2d4d9da052b4cc47452)"}
