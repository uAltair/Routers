@echo off

if "%~1" neq "" (echo %~1) else (goto help)
del /q /f openwrt_for_breed*.bin >nul
del /q /f ~tempfile* >nul
del /q /f ~kernel* >nul
set size=0
copy /A %1 ~kernel0~
for %%I in (~kernel0~) do set/A size=4194304-%%~zI
fsutil file createnew ~tempfile %size%
copy /b ~kernel0~+~tempfile ~kernel0
del /q /f ~tempfile >nul
del /q /f ~kernel0~ >nul
for %%I in (%1) do set/A size=4194304-%%~zI
fsutil file createnew ~tempfile %size%
copy /b %1+~tempfile ~kernel1
del /q /f ~tempfile >nul
copy /b ~kernel0+~kernel1+%2 openwrt_for_breed.bin
del /q /f ~kernel* >nul
del /q /f ~tempfile* >nul
exit
:help
echo.
echo This will make OpenWrt binary file for using with Breed for Mi Router 3G.
echo Result file is Broken Kernel 4Mb + Kernel 4Mb + Rootfs0
echo.
echo Warning! You MUST add string in Breed for booting from 0x600000:
echo autoboot.command boot flash 0x600000
echo (see example at http://4pda.ru/forum/index.php?s=&showtopic=837667&view=findpost&p=71453185)
echo.
echo Usage: 
echo create_openwrt_for_breed.cmd {kernel1 file} {rootfs0 file}
echo.
echo Example: %0
echo create_openwrt_for_breed.cmd xxx-kernel1.bin xxx-rootfs0.bin
echo.
