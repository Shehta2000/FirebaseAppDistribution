@echo off
REM Flutter Firebase App Distribution CI/CD Setup Script for Windows
REM This script helps you set up the CI/CD pipeline

echo 🚀 Setting up Flutter Firebase App Distribution CI/CD...

REM Check if Flutter is installed
flutter --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Flutter is not installed. Please install Flutter first.
    exit /b 1
)

echo ✅ Flutter found
flutter --version | findstr /C:"Flutter"

REM Check if we're in a Flutter project
if not exist "pubspec.yaml" (
    echo ❌ Not in a Flutter project directory
    exit /b 1
)

echo ✅ Flutter project detected

REM Install Flutter dependencies
echo 📦 Installing Flutter dependencies...
flutter pub get

REM Check if Firebase is configured
if not exist "android\app\google-services.json" (
    echo ⚠️  Warning: android\app\google-services.json not found
    echo    Please configure Firebase for Android
)

if not exist "ios\Runner\GoogleService-Info.plist" (
    echo ⚠️  Warning: ios\Runner\GoogleService-Info.plist not found
    echo    Please configure Firebase for iOS
)

REM Check if Android signing is configured
if not exist "android\key.properties" (
    echo ⚠️  Warning: android\key.properties not found
    echo    Please copy android\key.properties.example to android\key.properties
    echo    and fill in your keystore details
)

echo.
echo 🎉 CI/CD setup complete!
echo.
echo Next steps:
echo 1. 📖 Read CI_CD_SETUP.md for detailed configuration
echo 2. 🔐 Set up GitHub secrets (see documentation)
echo 3. 🔥 Configure Firebase App Distribution
echo 4. 📱 Set up Android keystore and iOS certificates
echo 5. 🚀 Push to GitHub to trigger your first build!
echo.
echo Happy deploying! 🚀

pause
