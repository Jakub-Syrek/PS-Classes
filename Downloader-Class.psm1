
class Downloader
{


[string]$ip  ;

[string]GetDesktopPath()
   { 
    [string]$path = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::Desktop)
     return $path ;
   }
[bool]CheckConnectionToDriverServer([string]$_)
   {
      [bool]$con = $false ;
      if (Test-Connection -ComputerName $_ -Quiet)  
        {
        $con = $true ;
        }
      return $con ;
    }
[bool]CheckIfPathExists([string]$_)
     {
       [bool]$pat = $false ;
       if(Test-Path -Path $_ )
         {
          $pat = $true ;
         }
       return $pat ;
     }
CopyFiles([string]$source , [string]$destin)
     {
         try 
          {
           Copy-Item $source -destination $destin -Force        
           Write-Host "Files copied succesfully"
          }
         catch
          {
           Write-Host $_.Exception.Message`n    
          }
     }
    
DecompressArchive([string]$arch , [string]$destin)
     {
        try 
         {
          Expand-Archive -Path $arch -DestinationPath $destin -Force ;
          Write-Host "Decompressed succesfully"
         }
        catch
         {
          Write-Host $_.Exception.Message`n
         }
      }
CompressArchive([string]$arch , [string]$destin)
     {
        try 
         {
          Compress-Archive -Path $arch -DestinationPath $destin -Force
          Write-Host "Compressed succesfully"
         }
        catch
         {
          Write-Host $_.Exception.Message`n
         }
      }
 }
 #CSharp way
 <#
 [Downloader]::new().GetDesktopPath()
 [Downloader]::new().CheckConnectionToDriverServer( "192.168.0.220")
 [Downloader]::new().CheckIfPathExists( "Env:\TEMP")
 [Downloader]::new().CopyFiles("C:\Users\QB\Desktop\ScriptsPS\test.txt" , "C:\Users\QB\Desktop\")
 [Downloader]::new().CompressArchive("C:\Users\QB\Desktop\ScriptsPS\test.txt" , "C:\Users\QB\Desktop\ScriptsPS\" )
 [Downloader]::new().DecompressArchive("C:\Users\QB\Desktop\ScriptsPS\test.zip" , "C:\Users\QB\Desktop\" )

 #Powershell way

 $d  = New-Object Downloader 
 $d.GetDesktopPath()
 $d.CheckConnectionToDriverServer("192.168.0.220")
 $d.CheckIfPathExists( "Env:\TEMP")
 $d.CopyFiles("C:\Users\QB\Desktop\ScriptsPS\test.txt" , "C:\Users\QB\Desktop\")
 $d.CompressArchive("C:\Users\QB\Desktop\ScriptsPS\test.txt" , "C:\Users\QB\Desktop\ScriptsPS\" )
 $d.DecompressArchive("C:\Users\QB\Desktop\ScriptsPS\test.zip" , "C:\Users\QB\Desktop\" )

 #Mixed
 $dd = [Downloader]::new()
 $dd.CheckIfPathExists( "Env:\TEMP")
 #>
