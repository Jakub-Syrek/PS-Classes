
class Installator
{


[string]$program  ;
[string]$args ;

Install($program , [string]$args)
   {
    Write-Host $this.program
    Write-Host $this.args
     Invoke-Command  -ScriptBlock {
                                       Start-Process $this.program  -ArgumentList $this.args -Wait 
                                   }  
   }
Uninstall($program)
   {
     Invoke-Command -ScriptBlock {
                                  Install-Module ProgramManagement
                                  Import-Module ProgramManagement                                     
                                  Write-Host "Uninstalling $program"
                                                                 
                                  }
    }    
[bool]CheckIfInstalled([string]$program)
   {
    $this.program ;
    $x86 = ((Get-ChildItem "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall") |
        Where-Object { $_.GetValue( "DisplayName" ) -like "*$program*" } ).Length -gt 0;

    $x64 = ((Get-ChildItem "HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall") |
        Where-Object { $_.GetValue( "DisplayName" ) -like "*$program*" } ).Length -gt 0;

    return $x86 -or $x64; 
    }
}

$program = "C:\Users\QB\Desktop\DellBioSMoD\CitrixReceiver.exe"
$args = " /silent"


$ins = New-Object Installator
$ins.args = $args
$ins.program = $program
$ins.CheckIfInstalled("Citrix")
#$ins.Install($program , $args)
$ins.CheckIfInstalled("Citrix")
$ins.Uninstall("Citrix")
$ins.CheckIfInstalled("Citrixx")