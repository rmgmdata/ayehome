@echo off
REM ========================================
REM Aye-Home Prebuilt ZIP Generator
REM Creates a deployment-ready ZIP with dist/
REM ========================================

SET ROOT=%CD%\Aye-Home
SET DIST=%ROOT%\dist

REM --- Step 1: Create folder structure ---
mkdir "%ROOT%"
mkdir "%ROOT%\dist"

REM --- Step 2: Create minimal index.html for dist ---
(
echo ^<!DOCTYPE html^>
echo ^<html lang="en"^>
echo ^<head^>
echo   ^<meta charset="UTF-8" /^>
echo   ^<meta name="viewport" content="width=device-width, initial-scale=1.0" /^>
echo   ^<title^>AyeHome^</title^>
echo   ^<link rel="stylesheet" href="style.css" /^>
echo ^</head^>
echo ^<body class="bg-gray-100"^>
echo   ^<div id="root"^>
echo     ^<h1 style="text-align:center;margin-top:50px;"^>AyeHome Mortgage App^</h1^>
echo     ^<p style="text-align:center;"^>This is a prebuilt placeholder for your live app.^</p^>
echo   ^</div^>
echo   ^<script src="app.js"^>^</script^>
echo ^</body^>
echo ^</html^>
) > "%DIST%\index.html"

REM --- Step 3: Create placeholder CSS ---
(
echo body { font-family: sans-serif; background-color:#f3f4f6; }
echo h1 { color:#1f2937; }
echo p { color:#4b5563; }
) > "%DIST%\style.css"

REM --- Step 4: Create placeholder JS ---
(
echo console.log("AyeHome prebuilt placeholder loaded.");
) > "%DIST%\app.js"

REM --- Step 5: Create ZIP of dist/ ---
powershell Compress-Archive -Path "%DIST%" -DestinationPath "%CD%\Aye-Home-Deploy.zip"

echo ========================================
echo Prebuilt ZIP created!
echo Path: %CD%\Aye-Home-Deploy.zip
echo ========================================
pause