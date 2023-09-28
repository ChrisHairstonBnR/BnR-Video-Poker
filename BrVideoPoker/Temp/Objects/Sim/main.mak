SHELL := cmd.exe
CYGWIN=nontsec
export PATH := C:\Users\hairstonc\AppData\Local\Programs\Python\Python310\Scripts\;C:\Users\hairstonc\AppData\Local\Programs\Python\Python310\;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\Program Files (x86)\Pulse Secure\VC142.CRT\X64\;C:\Program Files (x86)\Pulse Secure\VC142.CRT\X86\;C:\Program Files (x86)\NVIDIA Corporation\PhysX\Common;C:\Program Files\SourceGear\Common\DiffMerge\;C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\170\Tools\Binn\;C:\Program Files (x86)\Microsoft SQL Server\150\Tools\Binn\;C:\Program Files\Microsoft SQL Server\150\Tools\Binn\;C:\Program Files\Microsoft SQL Server\150\DTS\Binn\;C:\Program Files (x86)\Microsoft SQL Server\150\DTS\Binn\;C:\Program Files\Azure Data Studio\bin;C:\Program Files\CMake\bin;C:\msys64\mingw64\bin;C:\Program Files\dotnet\;C:\Program Files\nodejs\;C:\ProgramData\chocolatey\bin;C:\Program Files (x86)\Common Files\Pulse Secure\TNC Client Plugin\;C:\Program Files\Git\cmd;C:\Program Files\PuTTY\;C:\Python38\Scripts\;C:\Python38\;C:\Users\hairstonc\AppData\Local\Microsoft\WindowsApps;C:\Users\hairstonc\AppData\Local\Programs\Microsoft VS Code\bin;C:\Users\hairstonc\AppData\Local\GitHubDesktop\bin;C:\Users\hairstonc\AppData\Roaming\npm;C:\Program Files (x86)\Common Files\Hilscher GmbH\TLRDecode;C:\Users\hairstonc\AppData\Local\Programs\Python\Python310\Scripts\;C:\Users\hairstonc\AppData\Local\Programs\Python\Python310\;C:\Python38\Scripts\;C:\Python38\;C:\Users\hairstonc\AppData\Local\Microsoft\WindowsApps;C:\Program Files\Azure Data Studio\bin;C:\Users\hairstonc\AppData\Local\Programs\Microsoft VS Code\bin;C:\Users\hairstonc\AppData\Local\GitHubDesktop\bin;C:\Users\hairstonc\AppData\Roaming\npm;C:\Program Files (x86)\Common Files\Hilscher GmbH\TLRDecode;C:\BrAutomation\AS411\Bin-en\4.11;C:\BrAutomation\AS411\Bin-en\4.10;C:\BrAutomation\AS411\Bin-en\4.9;C:\BrAutomation\AS411\Bin-en\4.8;C:\BrAutomation\AS411\Bin-en\4.7;C:\BrAutomation\AS411\Bin-en\4.6;C:\BrAutomation\AS411\Bin-en\4.5;C:\BrAutomation\AS411\Bin-en\4.4;C:\BrAutomation\AS411\Bin-en\4.3;C:\BrAutomation\AS411\Bin-en\4.2;C:\BrAutomation\AS411\Bin-en\4.1;C:\BrAutomation\AS411\Bin-en\4.0;C:\BrAutomation\AS411\Bin-en
export AS_BUILD_MODE := Build
export AS_VERSION := 4.11.5.46 SP
export AS_WORKINGVERSION := 4.11
export AS_COMPANY_NAME := B&R Industrial Automation GmbH
export AS_USER_NAME := hairstonc
export AS_PATH := C:/BrAutomation/AS411
export AS_BIN_PATH := C:/BrAutomation/AS411/Bin-en
export AS_PROJECT_PATH := C:/Projects/BnR-Video-Poker/BrVideoPoker
export AS_PROJECT_NAME := BrVideoPoker
export AS_SYSTEM_PATH := C:/BrAutomation/AS/System
export AS_VC_PATH := C:/BrAutomation/AS411/AS/VC
export AS_TEMP_PATH := C:/Projects/BnR-Video-Poker/BrVideoPoker/Temp
export AS_CONFIGURATION := Sim
export AS_BINARIES_PATH := C:/Projects/BnR-Video-Poker/BrVideoPoker/Binaries
export AS_GNU_INST_PATH := C:/BrAutomation/AS411/AS/GnuInst/V4.1.2
export AS_GNU_BIN_PATH := C:/BrAutomation/AS411/AS/GnuInst/V4.1.2/4.9/bin
export AS_GNU_INST_PATH_SUB_MAKE := C:/BrAutomation/AS411/AS/GnuInst/V4.1.2
export AS_GNU_BIN_PATH_SUB_MAKE := C:/BrAutomation/AS411/AS/GnuInst/V4.1.2/4.9/bin
export AS_INSTALL_PATH := C:/BrAutomation/AS411
export WIN32_AS_PATH := "C:\BrAutomation\AS411"
export WIN32_AS_BIN_PATH := "C:\BrAutomation\AS411\Bin-en"
export WIN32_AS_PROJECT_PATH := "C:\Projects\BnR-Video-Poker\BrVideoPoker"
export WIN32_AS_SYSTEM_PATH := "C:\BrAutomation\AS\System"
export WIN32_AS_VC_PATH := "C:\BrAutomation\AS411\AS\VC"
export WIN32_AS_TEMP_PATH := "C:\Projects\BnR-Video-Poker\BrVideoPoker\Temp"
export WIN32_AS_BINARIES_PATH := "C:\Projects\BnR-Video-Poker\BrVideoPoker\Binaries"
export WIN32_AS_GNU_INST_PATH := "C:\BrAutomation\AS411\AS\GnuInst\V4.1.2"
export WIN32_AS_GNU_BIN_PATH := "C:\BrAutomation\AS411\AS\GnuInst\V4.1.2\bin"
export WIN32_AS_INSTALL_PATH := "C:\BrAutomation\AS411"

.suffixes:

ProjectMakeFile:

	@'$(AS_BIN_PATH)/4.9/BR.AS.AnalyseProject.exe' '$(AS_PROJECT_PATH)/BrVideoPoker.apj' -t '$(AS_TEMP_PATH)' -c '$(AS_CONFIGURATION)' -o '$(AS_BINARIES_PATH)'   -sfas -buildMode 'Build'   

