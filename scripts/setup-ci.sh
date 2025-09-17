#!/bin/bash

# Flutter Firebase App Distribution CI/CD Setup Script
# This script helps you set up the CI/CD pipeline

set -e

echo "🚀 Setting up Flutter Firebase App Distribution CI/CD..."

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter is not installed. Please install Flutter first."
    exit 1
fi

echo "✅ Flutter found: $(flutter --version | head -n 1)"

# Check if we're in a Flutter project
if [ ! -f "pubspec.yaml" ]; then
    echo "❌ Not in a Flutter project directory"
    exit 1
fi

echo "✅ Flutter project detected"

# Install Flutter dependencies
echo "📦 Installing Flutter dependencies..."
flutter pub get

# Check if Firebase is configured
if [ ! -f "android/app/google-services.json" ]; then
    echo "⚠️  Warning: android/app/google-services.json not found"
    echo "   Please configure Firebase for Android"
fi

if [ ! -f "ios/Runner/GoogleService-Info.plist" ]; then
    echo "⚠️  Warning: ios/Runner/GoogleService-Info.plist not found"
    echo "   Please configure Firebase for iOS"
fi

# Check if Android signing is configured
if [ ! -f "android/key.properties" ]; then
    echo "⚠️  Warning: android/key.properties not found"
    echo "   Please copy android/key.properties.example to android/key.properties"
    echo "   and fill in your keystore details"
fi

# Install Fastlane if not present
if ! command -v fastlane &> /dev/null; then
    echo "📱 Installing Fastlane..."
    if command -v gem &> /dev/null; then
        gem install fastlane
    else
        echo "⚠️  Ruby/Gem not found. Please install Fastlane manually."
    fi
else
    echo "✅ Fastlane found: $(fastlane --version | head -n 1)"
fi

# Install Fastlane plugins
if command -v fastlane &> /dev/null; then
    echo "🔌 Installing Fastlane plugins..."
    cd fastlane && fastlane add_plugin firebase_app_distribution && cd ..
fi

echo ""
echo "🎉 CI/CD setup complete!"
echo ""
echo "Next steps:"
echo "1. 📖 Read CI_CD_SETUP.md for detailed configuration"
echo "2. 🔐 Set up GitHub secrets (see documentation)"
echo "3. 🔥 Configure Firebase App Distribution"
echo "4. 📱 Set up Android keystore and iOS certificates"
echo "5. 🚀 Push to GitHub to trigger your first build!"
echo ""
echo "Happy deploying! 🚀"
