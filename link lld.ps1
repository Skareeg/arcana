# The libvcruntime.lib and the two extra libpaths (Win SDK "um" and MSVC "atlmfc") (which are separate from even that) are not required.
& llvminstall/bin/lld-link.exe `
    /subsystem:console `
    /out:main2.exe `
    /libpath:"C:\Program Files (x86)\Windows Kits\10\Lib\$env:WIN_SDK\ucrt\x64" `
    /libpath:"C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\$env:MSVC_SDK\lib\x64" `
    main2.obj `
    libcmt.lib libucrt.lib