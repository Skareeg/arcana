# Arcana

UPDATE 2024

### Building main.c with a standard cmake setup.

cmake -GNinja -DCMAKE_BUILD_TYPE="Release" -DLLVM_ENABLE_PROJECTS="clang" -DLLVM_TARGETS_TO_BUILD="X86" -DLLVM_DEFAULT_TARGET_TRIPLE="x86_64-pc-win64-unknown" ..\deps\llvm-project\llvm
cmake --build . --config "Release"
cmake --install . --prefix ../llvminstall

### Various LLVM Notes

https://clang.llvm.org/docs/CrossCompilation.html  
Triple format is `<arch><sub>-<vendor>-<sys>-<env>`  
The target triple seems to be [ x86_64-pc-win64-unknown ].

For powershell, use:  
`$env:Path = "$(pwd)\llvminstall\bin;$env:Path"`

Clang useful flags:
`-isystem <directory>   # Changes system include directories.`