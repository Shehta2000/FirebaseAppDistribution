# 🚀 Build Instructions

## How to Generate APK & IPA Files

This project includes an automated GitHub workflow that builds both Android APK and iOS IPA files that you can download directly from GitHub.

## 🎯 Quick Start

### Method 1: Manual Build (Recommended)

1. **Go to GitHub Actions**:
   - Visit your repository on GitHub
   - Click on the **"Actions"** tab
   - Find **"Build APK & IPA"** workflow

2. **Trigger Manual Build**:
   - Click **"Run workflow"** button
   - Choose your options:
     - **Build Type**: `release` (recommended) or `debug`
     - **Platforms**: `both` (for APK + IPA), `android` (APK only), or `ios` (IPA only)
   - Click **"Run workflow"**

3. **Download Your Files**:
   - Wait for the workflow to complete (5-10 minutes)
   - Scroll down to **"Artifacts"** section
   - Download:
     - **`android-apks`** - Contains your APK files
     - **`ios-ipa`** - Contains your IPA file

### Method 2: Automatic Build

The workflow automatically runs when you:
- Push code to the `main` branch
- Create a new tag (e.g., `v1.0.0`)

## 📱 Installation Guide

### Android APK
1. Download the APK from GitHub artifacts
2. On your Android device:
   - Enable **"Install unknown apps"** in Settings
   - Open the APK file to install

### iOS IPA
1. Download the IPA from GitHub artifacts
2. Install using one of these methods:
   - **AltStore** (free, requires computer)
   - **Sideloadly** (free, requires computer)
   - **Xcode** (if you're a developer)
   - **TestFlight** (if distributed through App Store Connect)

## 🔧 Build Options

### Build Types
- **Release**: Optimized, smaller size, better performance
- **Debug**: Larger size, includes debugging information

### Platform Options
- **Both**: Builds both Android APK and iOS IPA
- **Android**: Only builds APK
- **iOS**: Only builds IPA

## 📊 What Gets Built

### Android
- **Universal APK**: Works on all Android devices
- **Split APKs**: Separate APKs for different CPU architectures (smaller size)

### iOS
- **IPA File**: iOS app package (requires code signing for distribution)

## 🚨 Important Notes

### iOS Code Signing
- The IPA builds **without code signing** (using `--no-codesign`)
- This means the IPA can be built successfully but requires additional steps for installation
- For distribution, you'll need Apple Developer certificates

### File Retention
- Artifacts are kept for **30 days**
- Download them before they expire
- Tagged releases create permanent downloads

## 🔍 Troubleshooting

### Build Fails
1. Check the **Actions** tab for error logs
2. Common issues:
   - Missing dependencies in `pubspec.yaml`
   - Flutter version compatibility
   - Code analysis errors

### Can't Download Artifacts
- Make sure you're logged into GitHub
- Artifacts are only available to repository collaborators
- Check if the workflow completed successfully

### APK Won't Install
- Enable **"Install unknown apps"** for your browser/file manager
- Try downloading again if the file is corrupted

### IPA Won't Install
- iOS requires code signing for installation
- Use development tools like AltStore or Xcode
- Consider using TestFlight for distribution

## 📈 Workflow Status

You can monitor build progress:
1. Go to **Actions** tab
2. Click on the running workflow
3. Watch real-time logs
4. Get notified when complete

## 🎉 Success!

Once your build completes successfully, you'll have:
- ✅ Android APK ready for installation
- ✅ iOS IPA ready for sideloading
- ✅ Downloadable from GitHub artifacts
- ✅ Automatic builds on every push

---

**Happy Building! 🚀**
