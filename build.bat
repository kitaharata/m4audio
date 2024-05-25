@echo off
echo Build started...
C:\Windows\Microsoft.NET\Framework64\v4.0.30319\csc.exe ^
/t:winexe ^
/r:C:\Windows\Microsoft.NET\Framework64\v4.0.30319\WPF\PresentationCore.dll ^
/r:C:\Windows\Microsoft.NET\Framework64\v4.0.30319\WPF\PresentationFramework.dll ^
/r:C:\Windows\Microsoft.NET\Framework64\v4.0.30319\WPF\WindowsBase.dll ^
/out:main.exe ^
/nologo ^
Program.cs
echo Build succeeded.
