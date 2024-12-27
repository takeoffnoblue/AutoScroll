# AutoScroll
powershell script to automatically scroll any application

## Instructions
Change $windowTitle to your desired application. The name needs to be the application's title. Default is "Notepad".

Change $timeInt value to your desired interval (unit is seconds). Default is 1 s.

If you wish to continuously scroll down instead of repeatedly down and up, comment out "$isPageDown = -not $isPageDown" by adding "#" in front of this line.
