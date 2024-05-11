@echo off
color 0A
title GitUpdate

:menu
cls
echo -----------------------------------
echo    GitHub Tool - Menu Principal
echo -----------------------------------
echo.

echo 1. Cloner un depot GitHub
echo 2. Mettre a jour un depot existant
echo 3. Quitter
echo.
set /p choice="Choisissez une option: "

if "%choice%"=="1" goto clone_repository
if "%choice%"=="2" goto update_repository
if "%choice%"=="3" goto end

echo Choix invalide. Choisit une réponse valide.
timeout /t 3 >nul
goto menu

:clone_repository
cls
echo.
echo -----------------------------------
echo    Clonage d'un depot GitHub
echo -----------------------------------
echo.
set /p repo_url="Entrez l'URL du depot GitHub a cloner : "
echo.
git clone %repo_url% >nul 2>&1
if %errorlevel% neq 0 (
    echo Le clonage du depot echoue.
) else (
    echo Clonage du depot reussi.
)
timeout /t 3 >nul
goto menu

:update_repository
cls
echo.
echo -----------------------------------
echo    Mise a jour d'un depot existant
echo -----------------------------------
echo.
set /p repo_path="Entre le chemin du repertoire que tu veut mettre a jour : "
cd %repo_path%
echo.
git pull >nul 2>&1
if %errorlevel% neq 0 (
    echo Mise a jour du depot echouee.
) else (
    echo Mise a jour du depot reussie.
)
timeout /t 3 >nul
goto menu

:end
cls
echo.
echo -----------------------------------
echo      Merci de m'avoir utilser        
echo -----------------------------------
echo.
