# Arcana

UPDATE 2024

## Building main.c with a standard cmake setup.

cmake -GNinja -DCMAKE_BUILD_TYPE="Release" -DLLVM_ENABLE_PROJECTS="clang;lld" -DLLVM_TARGETS_TO_BUILD="X86" -DLLVM_DEFAULT_TARGET_TRIPLE="x86_64-pc-windows-msvc" ..\deps\llvm-project\llvm
cmake --build . --config "Release"
cmake --install . --prefix ../llvminstall

## Various LLVM Notes

[Cross Compilation with Clang](https://clang.llvm.org/docs/CrossCompilation.html)  
Triple format is `<arch><sub>-<vendor>-<sys>-<env>`  
The target triple seems to be [ x86_64-pc-win64-msvc ].

For powershell, use:  
`$env:Path = "$(pwd)\llvminstall\bin;$env:Path"`

Clang useful flags:  
`-isystem <directory>   # Changes system include directories.`

## Clang Emit IR From C

`& '.\clang emit ir.ps1' main2.c`

## llc Compile to obj

`llvminstall/bin/llc -filetype obj main2.ll`

## lld-link Step

The libvcruntime.lib does not actually appear to be required here, but it gets trimmed out if not used.  
`llvminstall/bin/lld-link /subsystem:console /out:main2.exe /libpath:"C:\Program Files (x86)\Windows Kits\10\Lib\$env:WIN_SDK\ucrt\x64"  /libpath:"C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\$env:MSVC_SDK\lib\x64" main2.obj libcmt.lib libvcruntime.lib libucrt.lib`