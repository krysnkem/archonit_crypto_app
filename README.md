# 🚀 Archonit Crypto App

A production-ready Flutter cryptocurrency listing application with advanced features including pagination, dynamic color generation, and clean architecture.

## ✨ Features

### Core Functionality
- 📱 **Cryptocurrency Listing**: Real-time data from CoinCap API
- 🔄 **Pagination**: Scroll-based loading with 15 items per page
- 🎨 **Dynamic Colors**: RGB color generation (16M+ colors) for each asset container
- 📊 **Price Formatting**: Professional currency display with comma separators
- 🔄 **Pull-to-Refresh**: Intuitive data refresh functionality
- ⚡ **Loading States**: Smooth loading indicators and error handling

### Technical Excellence
- 🏗️ **Clean Architecture**: Repository pattern with proper separation of concerns
- 🔒 **Type Safety**: Freezed models for immutable data structures
- 🧪 **Test Coverage**: Comprehensive unit tests for API and business logic
- 📱 **Responsive Design**: Figma-compliant UI with SF Pro Display font
- 🚀 **Performance**: Efficient pagination and state management

## 🏗️ Architecture

### Layer Structure
```
lib/
├── core/                 # Core utilities and configuration
│   ├── routing/         # App routing logic
│   ├── secrets/         # API keys and sensitive data
│   └── util/           # Utilities (colors, text styles, etc.)
├── data/                # Data layer
│   ├── api/            # API client and models
│   ├── interceptors/   # HTTP interceptors
│   └── repository/     # Repository implementations
├── logic/               # Business logic layer
│   ├── models/         # Domain models
│   ├── notifiers/      # State management
│   └── states/         # State definitions
└── ui/                  # Presentation layer
    └── widget/         # Reusable UI components
```

### State Management
- **ValueNotifier**: Lightweight reactive state management
- **Sealed Classes**: Type-safe state representations
- **Result Pattern**: Proper error handling with Success/Failure types

## 🛠️ Tech Stack

### Core Dependencies
- **Flutter**: 3.32.2+ (Stable channel)
- **Dio**: HTTP client for API calls
- **Retrofit**: Type-safe API client generation
- **Freezed**: Immutable data classes and unions
- **Equatable**: Value equality for objects

### Development Tools
- **Build Runner**: Code generation
- **Flutter Lints**: Code quality rules
- **Mocktail**: Testing framework

## 🚀 Quick Start

### Prerequisites
- Flutter SDK 3.32.2 or later
- Dart SDK 3.8.1 or later
- Android Studio / VS Code
- iOS Simulator / Android Emulator

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/your-username/archonit_crypto_app.git
cd archonit_crypto_app
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Generate code**
```bash
flutter packages pub run build_runner build
```

4. **Run the app**
```bash
flutter run
```

### Testing

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Analyze code
flutter analyze
```

## 📱 API Integration

### CoinCap API
- **Base URL**: `https://rest.coincap.io`
- **Endpoint**: `/v2/assets`
- **Documentation**: [CoinCap API Docs](https://docs.coincap.io/)

### Pagination Parameters
- **limit**: 15 (items per page)
- **offset**: Dynamic based on current page

## 🎨 Design System

### Typography
- **Font Family**: SF Pro Display
- **Primary Text**: 17px, Weight 700
- **Color**: #000000 (Text Black)

### Color Generation
- **Algorithm**: RGB color space (0-255 per channel)
- **Total Colors**: 16,777,216+ combinations
- **Alpha**: Semi-transparent (180/255) for readability

### Spacing Constants
```dart
class UIConstants {
  static const double assetIconSize = 60.0;
  static const double assetIconBorderRadius = 18.0;
  static const double assetItemSpacing = 16.0;
  static const double assetItemPadding = 14.0;
  static const double pageHorizontalPadding = 20.0;
}
```

## 🔧 Configuration

### API Key Setup
Create `lib/core/secrets/api_key.dart`:
```dart
const String COINCAP_API_KEY = 'your-api-key-here';
```

### Build Configuration
```yaml
# pubspec.yaml
environment:
  sdk: ^3.8.1
  
dependencies:
  dio: ^5.8.0+1
  retrofit: ^4.6.0
  # ... other dependencies
```

## 🧪 Testing Strategy

### Test Coverage
- ✅ API integration tests
- ✅ State management tests  
- ✅ Repository pattern tests
- ✅ Color generation tests
- ✅ Pagination logic tests

### Test Structure
```dart
void main() {
  group('API Layer Tests', () {
    test('Repository can fetch assets', () async {
      // Test implementation
    });
    
    test('ValueNotifier loads assets correctly', () async {
      // Test implementation
    });
  });
}
```

## 📦 Build & Deployment

### Android
```bash
flutter build apk --release
# or
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## 🐛 Troubleshooting

### Common Issues

1. **Build Runner Issues**
```bash
flutter packages pub run build_runner clean
flutter packages pub run build_runner build --delete-conflicting-outputs
```

2. **API Connection Issues**
- Check internet connection
- Verify API key configuration
- Check CoinCap API status

3. **Font Issues**
- Ensure font files are in `assets/fonts/`
- Verify `pubspec.yaml` font configuration

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 👨‍💻 Author

**Archonit Development Team**
- Email: contact@archonit.com
- GitHub: [@archonit](https://github.com/archonit)

---

*Built with ❤️ using Flutter and Clean Architecture principles*
