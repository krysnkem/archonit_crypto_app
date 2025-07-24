# Archonit Crypto App

Cryptocurrency listing application with pagination and dynamic color generation.

## Features

- 📱 Cryptocurrency listing with real-time prices
- 🔄 Pagination (15 items per page, scroll to load more)
- 🎨 Dynamic RGB color generation (16M+ colors)
- 📊 Professional price formatting
- 🔄 Pull-to-refresh functionality
- ⚡ Loading states and error handling

## Architecture - ValueNotifier Pattern

```
UI Layer
  ↓
ValueNotifier (State Management)
  ↓
Repository (Business Logic + Safe Call)
  ↓
API Client (Dio + Retrofit)
  ↓
Interceptor (API Key Injection)
  ↓
CoinCap API
```

### State Management Flow
- **UI Widgets** → Listen to `ValueNotifier` changes
- **ValueNotifier** → Manages state with sealed classes (`CryptoListState`)
- **Repository** → Handles business logic with `Result<T>` pattern
- **Safe Call** → Wraps API calls with try-catch error handling
- **API Client** → Type-safe Retrofit client with Dio
- **Interceptor** → Automatically injects API key to requests

## Tech Stack

- **Flutter**: 3.32.2+
- **State Management**: ValueNotifier
- **HTTP Client**: Dio + Retrofit
- **Data Models**: Freezed (immutable classes)
- **API**: CoinCap REST API
- **Architecture**: Clean Architecture with Repository Pattern

## Quick Start

```bash
# Install dependencies
flutter pub get

# Generate code
flutter packages pub run build_runner build

# Run the app
flutter run

# Run tests
flutter test
```

## State Management Branches

- `main`: **ValueNotifier** implementation (current)
- `feature/bloc-implementation`: BLoC pattern with events/states
- `feature/riverpod-implementation`: Riverpod with code generation

*Each branch implements the same features using different state management approaches.*
