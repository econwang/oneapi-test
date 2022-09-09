set VS_VER=%1

@call "C:\Program Files (x86)\Intel\oneAPI\setvars-vcvarsall.bat" %VS_VER%

for /f "tokens=* usebackq" %%f in (`dir /b "C:\Program Files (x86)\Intel\oneAPI\compiler\" ^| findstr /V latest ^| sort`) do @set "LATEST_VERSION=%%f"
@call "C:\Program Files (x86)\Intel\oneAPI\compiler\%LATEST_VERSION%\env\vars.bat"

ifort /Qmkl /O3 /QxHost /exe:imtest.exe src/fortran-test/mtest.f90
imtest.exe
set RESULT=%ERRORLEVEL%
set /a RESULT=%RESULT%+%ERRORLEVEL%

exit /b %RESULT%
