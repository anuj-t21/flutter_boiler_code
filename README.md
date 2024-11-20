# flutter_boiler_code

A new Flutter project.

## Table of Contents

- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [Clean Architecture](#clean-architecture)
- [Routing System](#routing-system)
- [State Management](#state-management)
- [Network Service](#network-service)
- [Environment Configuration](#environment-configuration)
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

Our project utilizes a robust routing system, implemented with the `auto_route` package, to manage navigation throughout the application. This system allows for the declaration of routes in a centralized manner, enhancing readability and maintainability.

### Key Features

- **Declarative Routing**: Routes are declared using annotations, making it easy to visualize the navigation flow of the application.
- **Auto-generation of Route Definitions**: The `auto_route` package generates code for routing based on the annotations provided, reducing boilerplate and potential human error.
- **Guards**: Route guards are used to control access to certain pages based on conditions such as authentication status.

### Adding New Routes

To add a new route, you should annotate your page with `@AutoRoute` and then run the following command to generate the routing code:

```bash
dart run build_runner build
```

This command compiles the annotations into actual Dart code that implements the routing logic, ensuring that your routes are kept up to date with any changes you make.

### Routing Service Overview

The routing service in our project, located within the `lib/core/router` directory, is structured to provide a comprehensive solution for navigation and route management. Here's a detailed explanation of its components:

- **AppRouter (`lib/core/router/data/app_router.dart`)**: The central point of the routing system, where routes are defined and configured. It includes the setup for auto-generated routes and guards.

- **Guards (`lib/core/router/data/utils/guards`)**: Guards are implemented to control navigation based on certain conditions. For example, `AuthGuard` checks for user authentication, and `SplashGuard` ensures that initialization processes are completed before proceeding.

- **Route Paths (`lib/core/router/data/utils/path/route_path.dart`)**: This file defines constants for route paths, making it easier to refer to specific routes throughout the application.

- **AutoRoute Configurations**: The `@AutoRouterConfig` annotation in `AppRouter` specifies global configurations for the routing system, such as the replacement of 'Page,Route' in route names.

- **Route Observers (`lib/core/router/data/utils/observer.dart`)**: Observers are used to listen to route changes, allowing for actions to be performed on route transitions, such as logging.

### Implementation Details

The routing system is designed to be flexible and extensible, supporting complex navigation scenarios, including nested routes and modal dialogs. By centralizing the route definitions and utilizing route guards, the system provides a secure and maintainable approach to managing navigation within the Flutter application.

This routing system, combined with the `auto_route` package, provides a powerful and efficient way to manage navigation in your Flutter application.

## State Management

We use the `flutter_bloc` package for state management. It allows us to manage the state efficiently and provides a clean way to separate business logic from UI code.

## Network Service

In our project, we have implemented a comprehensive network service layer using the `dio` package to facilitate network requests. This layer is designed to handle various HTTP methods, including GET, POST, PUT, PATCH, and DELETE, through a unified interface. 

Key features of our network service include:

- **Singleton Pattern**: Ensures a single instance of the `NetworkService` class throughout the application, providing a centralized point for network operations.
- **Interceptors**: Utilize `Dio` interceptors for authentication, logging, and error handling to streamline request processing and response handling.
  - **AuthInterceptor**: Manages the injection of authorization tokens into request headers, facilitating secure access to protected endpoints. The implementation is designed to support token refresh mechanisms transparently. For handling authorization tokens, we have provided a template in the form of commented code within the `AuthInterceptor` class. This template can be customized and utilized to meet specific authentication requirements.
  - **Logging**: Captures and logs detailed request and response information, aiding in debugging and monitoring network activity.
  - **Error Handling**: Custom error interceptors categorize network errors into specific exceptions, such as `BadRequestException`, `UnauthorizedException`, and `TimeOutException`, among others, allowing for granular error management.

This architecture not only simplifies the process of making network requests but also enhances maintainability and scalability by segregating concerns and centralizing network-related operations.

## Environment Configuration with `flutter_dotenv`

In our project, we utilize the `flutter_dotenv` package to manage environment variables, which is crucial for handling sensitive information such as secret keys. This package allows us to load environment variables from a `.env` file, ensuring that sensitive data is not hardcoded into the source code, thus enhancing security and flexibility.

### How We Use `flutter_dotenv`

The `flutter_dotenv` package is integrated into our environment management system, specifically within the `app_environment.dart` and `app_environment_keys.dart` files. Here's a brief overview of how it is used:

- **Loading Environment Variables**: In `app_environment.dart`, we use `flutter_dotenv` to load environment variables from different configuration files based on the build mode (development or production). This is done through the `dotenv.load()` method, which reads the specified `.env` file and makes the variables available throughout the application.

- **Accessing Secret Keys**: The loaded environment variables are accessed via the `_AppEnvironmentKeys` class in `app_environment_keys.dart`. This class provides getter methods for various configuration keys, including secret keys like the Supabase URL and anonymous key. By encapsulating these keys within a class, we ensure that they are accessed in a controlled manner, reducing the risk of accidental exposure.

- **Configuration Management**: The `AppEnvironment` class in `app_environment.dart` is responsible for initializing and managing the environment configurations. It loads the appropriate configuration files and merges them with default settings, allowing for a flexible and robust configuration management system.

By using `flutter_dotenv`, we maintain a clean separation between code and configuration, allowing for easy updates to environment-specific settings without modifying the source code. This approach not only secures sensitive information but also simplifies the process of managing different environments (e.g., development, production) in a Flutter application.


## Dependencies

The project uses the following dependencies:

- `auto_route`: For routing.
- `dartz`: For functional programming constructs.
- `flutter_bloc`: For state management.
- `flutter_dotenv`: For loading environment variables from a .env file.
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
