; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Nanny Notes - Secret of Broche"
#define MyAppVersion "0.5"
#define MyAppPublisher "My Company, Inc."
#define MyAppURL "http://www.example.com/"
#define MyAppExeName "VimIdeInstaller"
#define ProjectDir "E:/projects/vim/vimide"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{49D7F530-8789-40BC-B5F6-43E73C775513}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputDir=I:\NannyNoteInstaller\
OutputBaseFilename=VimIde
SetupIconFile=E:\projects/cpp/nannynotes\game\bin\nannyIco.ico
Compression=lzma
SolidCompression=yes
Uninstallable=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
#Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
#Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]
Source: "{#ProjectDir}\NannyNotes - Secret of Broche.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#ProjectDir}\data\Animations\*.*"; DestDir: "{app}\data\Animations\"; Flags: ignoreversion

; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon

[Run]
#Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

;[UninstallDelete]
;Type: Files; Name: "{%allusersprofile}\Nannynotes\settings.cfg"; Check: CheckDelSettings
;Type: Files; Name: {%homedrive}\{%homepath}\Documents\Nannynotes\*.pro; Check: CheckDelProfiles

[Code]
function CheckDelSettings() : Boolean;
begin
  Result := MsgBox('Remove settings ?', mbConfirmation, MB_YESNO) = IDYES;
end;

function CheckDelProfiles() : Boolean;
begin
  Result := MsgBox('Remove Profiles ?', mbConfirmation, MB_YESNO) = IDYES;
end;

function InitializeUninstall(): Boolean;
var 
    allusersprofile: string;
    documentsPath:   string;
begin
  allusersprofile := Format('%s\Nannynotes', [GetEnv('allusersprofile')]);
  documentsPath   := Format('%s\%s\Documents\Nannynotes\', [GetEnv('homedrive'), GetEnv('homepath')]);

  Result := MsgBox('Remove Profiles ?', mbConfirmation, MB_YESNO) = idYes;
  if Result = True then
  begin
      if RemoveDir(documentsPath) = False then 
        MsgBox('Fuck', mbConfirmation, MB_OK);
      if RemoveDir(allusersprofile) = False then
        MsgBox('Fuck', mbConfirmation, MB_OK);
  end;

  Result := True;
end;
     
