# poke_swipe

A Flutter application for discovering and managing Pokémon, built with robust architecture and modern development practices.

## Features
- **Pokémon Swipe**: Browse and swipe through Pokémon cards with rich details.
- **Favorites**: Mark and manage your favorite Pokémon locally.
- **Settings**: Customize theme (light/dark/dynamic), font scaling, and more.
- **Offline Support**: Local data persistence for favorites.
- **Error Handling**: User-friendly error and no-network pages.

## Architecture & Patterns
- **Clean Architecture**: Strict separation of data, domain, and presentation layers for maintainability and testability.
- **Modular Feature Structure**: Each feature (e.g., poke_swipe) is self-contained with its own data, domain, and presentation logic.
- **Dependency Injection**: Powered by [GetIt](https://pub.dev/packages/get_it) for scalable and testable service location.
- **State Management**: Bloc pattern (or similar) for predictable, testable state flows (see `features/poke_swipe/presentation/bloc`).
- **Routing**: [GoRouter](https://pub.dev/packages/go_router) for declarative, scalable navigation with guards and deep linking.
- **Theming**: Material 3, dynamic color support, and runtime font scaling for accessibility.
- **Networking**: [Dio](https://pub.dev/packages/dio) for robust, interceptable API requests.
- **Error Handling**: Centralized error handler and global error boundaries for crash resilience.
- **Logging**: Pluggable logger abstraction for analytics and debugging.
- **Environment & Flavors**: `.env` files and build-time flavors for seamless multi-environment support.

## Folder Structure
- `lib/core/` — App-wide base classes, config, error handling, logging, networking, permissions, resources, routing, theming, and utilities.
- `lib/features/` — Modular features (e.g., poke_swipe) with their own data, domain, and presentation layers.
- `lib/features/poke_swipe/di/` — Feature-specific dependency injection setup.
- `lib/features/poke_swipe/data/` — Data sources, models, and repositories for Pokémon data.
- `lib/features/poke_swipe/domain/` — Business logic, entities, and use cases.
- `lib/features/poke_swipe/presentation/` — UI widgets, pages, and Bloc state management.
- `lib/ui/` — Shared UI components (error pages, etc).

## Technical Highlights
- **Bootstrap Process**: Initializes environment, DI, logging, error handling, and runs the app in a safe zone (`core/bootstrap.dart`).
- **App Entry**: `main.dart` ensures all services are ready before launching the app.
- **Dynamic Theming**: Uses `DynamicColorBuilder` for Material You support on compatible devices.
- **Font Scaling**: Runtime font scaling for accessibility.
- **GoRouter**: Centralized, declarative navigation with analytics hooks.
- **Testability**: All business logic is decoupled from UI for easy unit and widget testing.

## Getting Started
1. **Clone the repo**
   ```sh
   git clone <repo-url>
   cd poke_swipe
   ```
2. **Install dependencies**
   ```sh
   flutter pub get
   ```
3. **Set up environment**
   - Copy `.env.dev` or `.env.prod` as needed and configure API keys, etc.
4. **Run the app**
   ```sh
   flutter run
   ```

## Extensibility & Best Practices
- Add new features by creating a new folder in `features/` with its own data/domain/presentation structure.
- All dependencies are injected via DI for easy mocking and testing.
- Follows SOLID principles and Dart/Flutter best practices throughout.
---

This project is a showcase of scalable, maintainable, and production-grade Flutter engineering. Contributions and feedback are welcome!
