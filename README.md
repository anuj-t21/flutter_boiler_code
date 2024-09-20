# flutter_boiler_code

A new Flutter project.

## Table of Contents

- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [Clean Architecture](#clean-architecture)
- [Routing System](#routing-system)
- [State Management](#state-management)
- [Dependencies](#dependencies)
- [Contributing](#contributing)
- [License](#license)

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Initial Reference

To help you get started quickly, we have included the following:

- **Authentication Page**: This page allows users to sign in and sign up. It includes complete data and domain layer functionalities, such as user authentication and session management.
- **Home Page**: This page serves as the main landing page after a user successfully logs in.

These initial pages provide a foundation for building out the rest of your application, demonstrating how to structure your code and implement core features.

## Project Structure

The project follows a modular structure to ensure scalability and maintainability:

```bash
lib/
├── core/
│ ├── constants/
│ ├── error/
│ ├── router/
│ │ ├── data/
│ │ └── domain/
│ ├── services/
│ ├── theme/
│ └── utils/
├── features/
│ ├── auth/
│ │ ├── data/
│ │ ├── domain/
│ │ └── presentation/
│ ├── home/
│ │ ├── domain/
│ │ └── presentation/
│ └── splash/
│ └── presentation/
├── shared/
│ ├── domain/
│ └── presentation/
└── main.dart
```


## Clean Architecture

The project is structured following the principles of Clean Architecture, which separates the code into different layers:

- **Data Layer**: Responsible for data retrieval from various sources (e.g., APIs, local databases).
- **Domain Layer**: Contains business logic and entities. This layer is independent of any external libraries.
- **Presentation Layer**: Manages the UI and user interaction. It includes widgets, state management, and routing.

### Data Layer

- **Repositories**: Interfaces that define the data operations.
- **Data Sources**: Implementations of the repositories, fetching data from APIs or local storage.

### Domain Layer

- **Entities**: Core classes that represent the business models.
- **Use Cases**: Classes that contain the business logic and interact with repositories.

### Presentation Layer

- **Widgets**: UI components.
- **State Management**: Manages the state of the application.
- **Routing**: Manages navigation between screens.

## Routing System

The routing system is implemented using the `auto_route` package. We use named routes for better readability and maintainability.

## State Management

We use the `flutter_bloc` package for state management. It allows us to manage the state efficiently and provides a clean way to separate business logic from UI code.


## Dependencies

The project uses the following dependencies:

- `auto_route`: For routing.
- `dartz`: For functional programming constructs.
- `flutter_bloc`: For state management.
- `freezed`: For immutable data classes and union types.
- `get_it`: For dependency injection.
- `json_serializable`: For JSON serialization.
- `supabase_flutter`: For backend services.


## Contributing

Contributions are welcome! Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature`).
3. Commit your changes (`git commit -am 'Add some feature'`).
4. Push to the branch (`git push origin feature/your-feature`).
5. Create a new Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
