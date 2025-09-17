# Firebase App Distribution Flutter Project

A Flutter project with Firebase App Distribution and complete CI/CD pipeline.

## 🚀 Features

- **Flutter** - Cross-platform mobile development
- **Firebase Integration** - Backend services and app distribution
- **GitHub Actions CI/CD** - Automated testing and deployment
- **Multi-platform Support** - Android, iOS, Web, Windows, macOS, Linux
- **Firebase App Distribution** - Beta testing and app distribution
- **Automated Testing** - Unit tests with coverage reports
- **Code Quality** - Automated linting and formatting checks

## 📱 CI/CD Pipeline

This project includes a comprehensive CI/CD pipeline with:

### Workflows
- **Main CI/CD** (`ci-cd.yml`) - Full build and deployment pipeline
- **Pull Request Checks** (`pull-request.yml`) - Code quality validation
- **Manual Deployment** (`manual-deploy.yml`) - On-demand deployments

### Deployment Targets
- **Firebase App Distribution** - Beta testing
- **Google Play Store** - Android production releases
- **Apple App Store** - iOS production releases

## 🛠️ Quick Setup

### Prerequisites
- Flutter SDK 3.24.0+
- Android Studio / Xcode
- Firebase project
- GitHub repository

### 1. Clone and Setup
```bash
git clone <your-repo-url>
cd firebase_app_distribution
flutter pub get
```

### 2. Run Setup Script
```bash
# On macOS/Linux
chmod +x scripts/setup-ci.sh
./scripts/setup-ci.sh

# On Windows
scripts\setup-ci.bat
```

### 3. Configure CI/CD
Follow the detailed setup guide in [`CI_CD_SETUP.md`](CI_CD_SETUP.md)

## 🔧 Development

### Running the App
```bash
flutter run
```

### Building
```bash
# Debug builds
flutter build apk --debug
flutter build ios --debug

# Release builds
flutter build apk --release
flutter build ios --release
```

### Testing
```bash
flutter test
flutter test --coverage
```

### Code Quality
```bash
dart format .
flutter analyze
```

## 📦 Deployment

### Firebase App Distribution
Push to `main` branch to automatically deploy to Firebase App Distribution.

### Manual Deployment
Use GitHub Actions manual workflow:
1. Go to Actions tab in GitHub
2. Select "Manual Deployment"
3. Choose platform and environment
4. Add release notes
5. Run workflow

### Production Release
Create a GitHub release to trigger production deployment to app stores.

## 📚 Documentation

- [`CI_CD_SETUP.md`](CI_CD_SETUP.md) - Complete CI/CD setup guide
- [`README.md`](README.md) - CI/CD setup guide (same as CI_CD_SETUP.md)
- [Flutter Documentation](https://docs.flutter.dev/)
- [Firebase Documentation](https://firebase.google.com/docs)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests and linting
5. Create a pull request

## 📄 License

This project is licensed under the MIT License.
