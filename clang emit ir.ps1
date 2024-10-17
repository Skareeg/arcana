# Generate just the IR form the clang fronted for the main.c file.
# S - Only run preprocess, compile, and assemble steps.
# emit-llvm - Emit LLVM IR instead of machine code.
# std=c99 - Use the C99 standard.
# fms-extensions - Enable Microsoft extensions (for those pesky "pack" errors).
# isystem - Add the *system* (does not show redeclaration of sys functions warnings) include directories for the Windows SDK and MSVC. MSVC is required, as the corecrt.h header includes vcruntime.h.
# src/$($args[0]) - The source file to compile.

if ($args.Count -eq 0) {
    Write-Error "You must supply an input file!"
    Exit
}

$inputFile = $args[0]

& llvminstall/bin/clang.exe `
    -S `
    -emit-llvm `
    -std=c99 `
    -fms-extensions `
    -isystem "C:\Program Files (x86)\Windows Kits\10\Include\$env:WIN_SDK\ucrt" `
    -isystem "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\$env:MSVC_SDK\include" `
    -I "$env:VULKAN_SDK\Include" `
    src/$inputFile