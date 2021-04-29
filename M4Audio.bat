@echo off
C:\Windows\Microsoft.NET\Framework64\v4.0.30319\csc.exe ^
/r:C:\Windows\Microsoft.NET\Framework64\v4.0.30319\WPF\WindowsBase.dll ^
/r:C:\Windows\Microsoft.NET\Framework64\v4.0.30319\WPF\PresentationCore.dll ^
/r:C:\Windows\Microsoft.NET\Framework64\v4.0.30319\WPF\PresentationFramework.dll ^
/out:audio.exe /t:winexe M4Audio.cs
echo csc.exe 64
