$program = "C:\CitrixReceiver.exe"
$args = " /silent"


$ins = New-Object Installator
$ins.args = $args
$ins.program = $program
$ins.CheckIfInstalled("Citrix")
$ins.Install($program , $args)
$ins.CheckIfInstalled("Citrix")
$ins.Uninstall("Citrix")
$ins.CheckIfInstalled("Citrixx")