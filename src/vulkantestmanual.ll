; I renamed this file to prevent my work here from being easily overwritten by clang emitting IR with -S -emit-llvm.
; ModuleID = 'src/vulkantest.c'
source_filename = "src/vulkantest.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.41.34123"

; These structs from Vulkan are declared in the header file.
; If I want to use them manually, I will need to have clang emit 
%struct.VkApplicationInfo = type { i32, ptr, ptr, i32, ptr, i32, i32 }

; These comdats
; $"??_C@_0P@NFLJHBMK@Hello?5Triangle?$AA@" = comdat any
; $"??_C@_09PFJINCFB@No?5Engine?$AA@" = comdat any

; Renamed these to look prettier.
@HelloTriangleString = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"Hello Triangle\00", align 1
@NoEngineString = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"No Engine\00", align 1

@TestGlobal = constant i8 5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct.VkApplicationInfo, align 8
  store i32 0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  store i32 %0, ptr %5, align 4
  %7 = getelementptr inbounds nuw %struct.VkApplicationInfo, ptr %6, i32 0, i32 0
  store i32 0, ptr %7, align 8
  %8 = getelementptr inbounds nuw %struct.VkApplicationInfo, ptr %6, i32 0, i32 2
  store ptr @HelloTriangleString, ptr %8, align 8
  %9 = getelementptr inbounds nuw %struct.VkApplicationInfo, ptr %6, i32 0, i32 3
  store i32 4206872, ptr %9, align 8
  %10 = getelementptr inbounds nuw %struct.VkApplicationInfo, ptr %6, i32 0, i32 4
  store ptr @NoEngineString, ptr %10, align 8
  %11 = getelementptr inbounds nuw %struct.VkApplicationInfo, ptr %6, i32 0, i32 5
  store i32 4206872, ptr %11, align 8
  %12 = getelementptr inbounds nuw %struct.VkApplicationInfo, ptr %6, i32 0, i32 6
  store i32 4206872, ptr %12, align 4
  %testvar = load i32, ptr @TestGlobal
  ret i32 %testvar
}

attributes #0 = { noinline nounwind optnone uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

; Metadata area down here.

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 2}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 2}
!3 = !{i32 1, !"MaxTLSAlign", i32 65536}
!4 = !{!"clang version 20.0.0git (https://github.com/llvm/llvm-project.git ec31f76df11d624699a7b2d4d9da052b4cc47452)"}

; Can link libraries in this way apparently.
; !5 = !{!"vulkan-1.lib"}
; !llvm.dependent-libraries = !{ !5 }