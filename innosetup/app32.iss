[Setup]
AppName=Elvarg Launcher
AppPublisher=Elvarg
UninstallDisplayName=Elvarg
AppVersion=${project.version}
AppSupportURL=https://runelite.net/
DefaultDirName={localappdata}\Elvarg

; ~30 mb for the repo the launcher downloads
ExtraDiskSpaceRequired=30000000
ArchitecturesAllowed=x86 x64
PrivilegesRequired=lowest

WizardSmallImageFile={basedir}/app_small.bmp
SetupIconFile=${basedir}/app.ico
WizardImageFile=${basedir}/left.bmp
UninstallDisplayIcon={app}\Elvarg.exe

Compression=lzma2
SolidCompression=yes

OutputDir=${basedir}
OutputBaseFilename=ElvargSetup32

[Setup]
DefaultGroupName={#AppPublisher}\{#AppName}

[Tasks]
Name: DesktopIcon; Description: "Create a &desktop icon";

[Files]
Source: "${basedir}\app.ico"; DestDir: "{app}"
Source: "${basedir}\left.bmp"; DestDir: "{app}"
Source: "${basedir}\app_small.bmp"; DestDir: "{app}"
Source: "${basedir}\native-win32\Elvarg.exe"; DestDir: "{app}"
Source: "${basedir}\native-win32\Elvarg.jar"; DestDir: "{app}"
Source: "${basedir}\native\launcher_x86.dll"; DestDir: "{app}"
Source: "${basedir}\native-win32\config.json"; DestDir: "{app}"
Source: "${basedir}\native-win32\jre\*"; DestDir: "{app}\jre"; Flags: recursesubdirs

[Icons]
; start menu
Name: "{userprograms}\Elvarg"; IconFilename: "{app}\app.ico"; Filename: "{app}\Elvarg.exe"
Name: "{userdesktop}\Elvarg"; IconFilename: "{app}\app.ico"; Filename: "{app}\Elvarg.exe"; Tasks: DesktopIcon

[Run]
Filename: "{app}\Elvarg.exe"; Parameters: "--postinstall"; Flags: nowait
Filename: "{app}\Elvarg.exe"; Description: "&Open Elvarg"; Flags: postinstall skipifsilent nowait

[InstallDelete]
; Delete the old jvm so it doesn't try to load old stuff with the new vm and crash
Type: filesandordirs; Name: "{app}"

[UninstallDelete]
Type: filesandordirs; Name: "{%USERPROFILE}\.elvarg\repository2"