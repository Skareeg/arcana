& llvminstall/bin/lld-link.exe `
    /entry:main `
    /subsystem:console `
    /out:vulkantest.exe `
    /libpath:"C:\Program Files (x86)\Windows Kits\10\Lib\$env:WIN_SDK\ucrt\x64" `
    /libpath:"C:\Program Files (x86)\Windows Kits\10\Lib\$env:WIN_SDK\um\x64" `
    /libpath:"C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\$env:MSVC_SDK\lib\x64" `
    /libpath:"C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\$env:MSVC_SDK\atlmfc\lib\x64" `
    /libpath:"$env:VULKAN_SDK\Lib" `
    vulkantest.obj `
    libcmt.lib libvcruntime.lib libucrt.lib vulkan-1.lib