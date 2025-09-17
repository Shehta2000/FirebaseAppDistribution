# 🚀 Flutter Firebase App Distribution - CI/CD Setup Guide

This guide will help you set up a complete CI/CD pipeline for your Flutter app with Firebase App Distribution, Google Play Store, and App Store deployments.

## 📋 Table of Contents

- [Prerequisites](#prerequisites)
- [GitHub Secrets Setup](#github-secrets-setup)
- [Android Configuration](#android-configuration)
- [iOS Configuration](#ios-configuration)
- [Firebase Setup](#firebase-setup)
- [Workflow Overview](#workflow-overview)
- [Deployment Strategies](#deployment-strategies)
- [Troubleshooting](#troubleshooting)

## 🔧 Prerequisites

Before setting up the CI/CD pipeline, ensure you have:

- [ ] Flutter project with Firebase integration
- [ ] GitHub repository
- [ ] Firebase project with App Distribution enabled
- [ ] Google Play Console account (for Android releases)
- [ ] Apple Developer account (for iOS releases)
- [ ] Android signing keystore
- [ ] iOS signing certificates and provisioning profiles

## 🔐 GitHub Secrets Setup

Add the following secrets to your GitHub repository (`Settings > Secrets and variables > Actions`):

### Android Secrets

| Secret Name | Description | How to Get |
|-------------|-------------|------------|
| `ANDROID_KEYSTORE` | Base64 encoded keystore file | `base64 -i your-keystore.jks` |
| `ANDROID_KEY_ALIAS` | Keystore key alias | From your keystore |
| `ANDROID_STORE_PASSWORD` | Keystore password | From your keystore |
| `ANDROID_KEY_PASSWORD` | Key password | From your keystore |
| `GOOGLE_PLAY_SERVICE_ACCOUNT` | Google Play service account JSON | From Google Play Console |

### iOS Secrets

| Secret Name | Description | How to Get |
|-------------|-------------|------------|
| `IOS_CERTIFICATE` | Base64 encoded .p12 certificate | `base64 -i certificate.p12` |
| `IOS_CERTIFICATE_PASSWORD` | Certificate password | From certificate creation |
| `IOS_PROVISIONING_PROFILE` | Base64 encoded provisioning profile | `base64 -i profile.mobileprovision` |
| `IOS_KEYCHAIN_PASSWORD` | Temporary keychain password | Any secure password |
| `APPSTORE_ISSUER_ID` | App Store Connect API issuer ID | From App Store Connect |
| `APPSTORE_KEY_ID` | App Store Connect API key ID | From App Store Connect |
| `APPSTORE_PRIVATE_KEY` | App Store Connect API private key | From App Store Connect |

### Firebase Secrets

| Secret Name | Description | How to Get |
|-------------|-------------|------------|
| `FIREBASE_SERVICE_ACCOUNT` | Firebase service account JSON | From Firebase Console |
| `FIREBASE_ANDROID_APP_ID` | Firebase Android app ID | From Firebase project settings |
| `FIREBASE_IOS_APP_ID` | Firebase iOS app ID | From Firebase project settings |

### Optional Secrets

| Secret Name | Description |
|-------------|-------------|
| `SLACK_WEBHOOK_URL` | Slack webhook for notifications |
| `CODECOV_TOKEN` | Codecov token for coverage reports |

## 📱 Android Configuration

### 1. Create Android Keystore

```bash
keytool -genkey -v -keystore android/app/keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
```

### 2. Configure Signing

1. Copy `android/key.properties.example` to `android/key.properties`
2. Fill in your keystore details:

```properties
storeFile=keystore.jks
keyAlias=key
storePassword=your_store_password
keyPassword=your_key_password
```

### 3. Google Play Console Setup

1. Create a service account in Google Cloud Console
2. Download the JSON key file
3. Grant necessary permissions in Google Play Console
4. Add the JSON content as `GOOGLE_PLAY_SERVICE_ACCOUNT` secret

## 🍎 iOS Configuration

### 1. Certificates and Provisioning

1. Create distribution certificate in Apple Developer portal
2. Create provisioning profile for your app
3. Export certificate as .p12 file
4. Download provisioning profile

### 2. Update ExportOptions.plist

Edit `ios/Runner/ExportOptions.plist`:

```xml
<key>teamID</key>
<string>YOUR_TEAM_ID</string>
<key>provisioningProfiles</key>
<dict>
    <key>com.example.firebase_app_distribution</key>
    <string>YOUR_PROVISIONING_PROFILE_NAME</string>
</dict>
```

### 3. App Store Connect API

1. Generate API key in App Store Connect
2. Note down the Issuer ID and Key ID
3. Download the private key file

## 🔥 Firebase Setup

### 1. Enable App Distribution

1. Go to Firebase Console
2. Navigate to App Distribution
3. Add testers and groups
4. Note down your app IDs

### 2. Service Account

1. Go to Project Settings > Service Accounts
2. Generate new private key
3. Add the JSON content as GitHub secret

## 🔄 Workflow Overview

The CI/CD pipeline includes three main workflows:

### 1. Main CI/CD (`ci-cd.yml`)

**Triggers:**
- Push to `main` or `develop` branches
- Pull requests to `main`
- Release published

**Jobs:**
- Code analysis and testing
- Android build and distribution
- iOS build and distribution
- Firebase App Distribution
- Production releases
- Team notifications

### 2. Pull Request Checks (`pull-request.yml`)

**Triggers:**
- Pull requests to `main` or `develop`

**Features:**
- Code formatting checks
- Static analysis
- Unit tests with coverage
- Build verification
- Automated PR comments

### 3. Manual Deployment (`manual-deploy.yml`)

**Triggers:**
- Manual workflow dispatch

**Options:**
- Choose platform (Android/iOS/Both)
- Select environment (Staging/Production)
- Add custom release notes

## 🚀 Deployment Strategies

### Development Flow

1. **Feature Branch** → Create PR → Automated checks run
2. **Merge to Develop** → Build and deploy to Firebase (staging)
3. **Merge to Main** → Build and deploy to Firebase (production testers)
4. **Create Release** → Deploy to App Stores

### Environment Mapping

- **Pull Requests**: Code quality checks only
- **Develop Branch**: Firebase App Distribution (internal testers)
- **Main Branch**: Firebase App Distribution (external testers)
- **Releases**: Google Play Store & App Store

## 🔧 Customization

### Modify Build Configuration

Edit `.github/workflows/ci-cd.yml` to customize:

- Flutter version
- Build variants
- Test commands
- Deployment conditions

### Add Custom Steps

```yaml
- name: Custom Step
  run: |
    echo "Add your custom commands here"
    # Custom build steps
    # Additional testing
    # Security scans
```

### Environment Variables

Add environment-specific variables:

```yaml
env:
  CUSTOM_VAR: ${{ secrets.CUSTOM_SECRET }}
```

## 🐛 Troubleshooting

### Common Issues

#### Android Build Fails

1. **Keystore Issues**: Verify keystore path and passwords
2. **Gradle Issues**: Check Java version compatibility
3. **Signing Issues**: Ensure key.properties is correctly formatted

#### iOS Build Fails

1. **Certificate Issues**: Verify certificate is valid and not expired
2. **Provisioning Issues**: Check provisioning profile matches app ID
3. **Xcode Version**: Ensure compatible Xcode version

#### Firebase Distribution Fails

1. **Service Account**: Verify service account has App Distribution permissions
2. **App ID**: Check Firebase app IDs are correct
3. **File Path**: Ensure build artifacts exist at specified paths

### Debug Steps

1. **Check Logs**: Review GitHub Actions logs for detailed errors
2. **Local Testing**: Test builds locally before pushing
3. **Secrets**: Verify all required secrets are set correctly
4. **Dependencies**: Ensure all dependencies are up to date

### Getting Help

- Check GitHub Actions documentation
- Review Flutter CI/CD best practices
- Firebase App Distribution documentation
- Platform-specific deployment guides

## 📊 Monitoring and Analytics

### Build Metrics

The pipeline provides:
- Build times and success rates
- Test coverage reports
- APK/IPA size tracking
- Deployment success metrics

### Notifications

Configure notifications for:
- Build failures
- Successful deployments
- Security alerts
- Performance regressions

## 🔒 Security Best Practices

1. **Never commit secrets** to version control
2. **Rotate keys regularly** (certificates, API keys)
3. **Use least privilege** for service accounts
4. **Monitor access logs** for unusual activity
5. **Keep dependencies updated** for security patches

## 📈 Next Steps

After setup, consider:

1. **Automated Testing**: Add more comprehensive tests
2. **Code Quality**: Integrate additional linting tools
3. **Performance**: Add performance monitoring
4. **Security**: Implement security scanning
5. **Analytics**: Add deployment analytics

---

## 🆘 Support

If you encounter issues:

1. Check this documentation
2. Review GitHub Actions logs
3. Consult platform-specific documentation
4. Open an issue in the repository

**Happy Deploying! 🚀**
