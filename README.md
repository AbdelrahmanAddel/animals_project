<div align="center">

# 🐾 Pet Adoption App

[![Flutter](https://img.shields.io/badge/Flutter-3.8.1-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.8.1-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Clean Architecture](https://img.shields.io/badge/Clean-Architecture-blue?style=for-the-badge)](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
[![BLoC](https://img.shields.io/badge/BLoC-Pattern-orange?style=for-the-badge)](https://bloclibrary.dev)

**A beautiful and intuitive pet adoption mobile application built with Flutter & Clean Architecture**

[Features](#-features) • [Screenshots](#-screenshots) • [Getting Started](#-getting-started) • [Architecture](#️-architecture)

</div>

---

## 📱 Screenshots

<div align="center">
<div align="center" style="display: flex; flex-wrap: wrap; justify-content: center; gap: 8px;">
  
  *📸 Add your app screenshots here*
  
<div align="center">
  <img src="https://github.com/user-attachments/assets/337809fd-5984-4223-8a6e-3abb2142f1ef" width="23%" style="margin: 4px;" />
  <img src="https://github.com/user-attachments/assets/5ac588d4-9b20-4a7b-aa75-6a8210f09e9c" width="23%" style="margin: 4px;" />
  <img src="https://github.com/user-attachments/assets/bf264fe6-ab89-4aaf-808f-1256554e86f3" width="23%" style="margin: 4px;" />
  <img src="https://github.com/user-attachments/assets/c21139c4-1e09-4e39-aca0-fe5398a03f18" width="23%" style="margin: 4px;" />
</div>

---

## ✨ Features

<table>
<tr>
<td width="50%">

### 🏠 Core Features
- 🐱 **Browse Pets** - Discover cats with detailed breed information
- ⭐ **Favorites Management** - Save your favorite pets
- 🔍 **Smart Search** - Find pets by name instantly
- 📱 **Responsive Design** - Works on all screen sizes
- 🎨 **Modern UI/UX** - Clean and intuitive interface
- 📊 **Pet Categories** - Browse by different pet types

</td>
<td width="50%">

### 🛠️ Technical Features
- 🔄 **State Management** - BLoC pattern
- 🌐 **REST API** - TheCatAPI integration
- ⚡ **Efficient Networking** - Dio with interceptors
- 🧪 **Testing** - Unit, Widget & Integration tests
- 🎯 **Error Handling** - Graceful error states
- 🏗️ **Clean Architecture** - Scalable codebase

</td>
</tr>
</table>

---

## 🏗️ Architecture

This project follows **Clean Architecture** principles with clear separation of concerns:

<div align="center">

```
┌─────────────────────────────────────────────────────────┐
│                   Presentation Layer                     │
│              (UI, Widgets, State Management)             │
│                    BLoC / Cubit                          │
└───────────────────────┬─────────────────────────────────┘
                        │
┌───────────────────────▼─────────────────────────────────┐
│                    Domain Layer                          │
│            (Entities, Repository Interfaces)             │
└───────────────────────┬─────────────────────────────────┘
                        │
┌───────────────────────▼─────────────────────────────────┐
│                     Data Layer                           │
│        (Models, Data Sources, Repository Impl)           │
└─────────────────────────────────────────────────────────┘
```

</div>

### 📂 Project Structure

```dart
lib/
├── 🎯 core/                          # Core utilities and shared resources
│   ├── common/                       # Shared across features
│   │   ├── data/                     # Common data layer
│   │   ├── domain/                   # Common domain layer
│   │   └── widgets/                  # Reusable widgets
│   ├── constants/                    # App constants
│   ├── error/                        # Error handling
│   ├── networking/                   # Dio configuration
│   └── theme/                        # App theming
│
├── 🎨 features/                      # Feature modules
│   ├── home/                         # Home feature
│   │   ├── data/                     # Data layer
│   │   │   ├── datasources/          # API services
│   │   │   ├── models/               # DTOs
│   │   │   ├── mapper/               # Model to Entity mapping
│   │   │   └── repositories/         # Repository implementations
│   │   ├── domain/                   # Domain layer
│   │   │   ├── entities/             # Business models
│   │   │   └── repositories/         # Repository interfaces
│   │   └── presentation/             # Presentation layer
│   │       ├── cubit/                # State management
│   │       ├── screen/               # Screens
│   │       └── widgets/              # UI components
│   ├── favorites/                    # Favorites feature
│   ├── details/                      # Pet details feature
│   ├── onboarding/                   # Onboarding feature
│   └── main/                         # Main navigation
│
└── main.dart                         # App entry point
```

---

## 🚀 Tech Stack

<div align="center">

| Category | Technologies |
|----------|-------------|
| **Framework** | ![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat-square&logo=flutter&logoColor=white) ![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat-square&logo=dart&logoColor=white) |
| **State Management** | ![BLoC](https://img.shields.io/badge/flutter__bloc-9.1.1-orange?style=flat-square) |
| **Networking** | ![Dio](https://img.shields.io/badge/dio-5.9.0-blue?style=flat-square) ![Retrofit](https://img.shields.io/badge/retrofit-4.7.3-green?style=flat-square) |
| **Dependency Injection** | ![GetIt](https://img.shields.io/badge/get__it-8.2.0-purple?style=flat-square) |
| **Functional Programming** | ![Dartz](https://img.shields.io/badge/dartz-0.10.1-red?style=flat-square) |
| **Code Generation** | ![BuildRunner](https://img.shields.io/badge/build__runner-2.9.0-yellow?style=flat-square) |
| **Testing** | ![Mocktail](https://img.shields.io/badge/mocktail-1.0.4-teal?style=flat-square) |

</div>

### 📦 Key Dependencies

```yaml
dependencies:
  # State Management
  flutter_bloc: ^9.1.1
  equatable: ^2.0.7
  
  # Networking
  dio: ^5.9.0
  retrofit: ^4.7.3
  pretty_dio_logger: ^1.4.0
  
  # Dependency Injection
  get_it: ^8.2.0
  
  # Functional Programming
  dartz: ^0.10.1
  
  # Code Generation
  build_runner: ^2.9.0
  json_serializable: ^6.11.1
  retrofit_generator: ^10.0.6
  
  # UI
  flutter_svg: ^2.2.1
  flutter_native_splash: ^2.4.6
  fluttertoast: ^9.0.0

dev_dependencies:
  # Testing
  flutter_test:
  integration_test:
  mocktail: ^1.0.4
```

---

## 🧪 Testing

<div align="center">

### Comprehensive Test Coverage

| Test Type | Coverage | Location |
|-----------|----------|----------|
| **Unit Tests** | Repository & Business Logic | `test/unit/` |
| **Widget Tests** | UI Components | `test/widget/` |
| **Integration Tests** | End-to-End Flows | `test/integration/` |

</div>

```bash
# Run all tests
flutter test

# Run unit tests only
flutter test test/unit/

# Run widget tests only
flutter test test/widget/

# Run integration tests
flutter test integration_test/

# Run tests with coverage
flutter test --coverage
```

---

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

- ✅ Flutter SDK `3.8.1` or higher
- ✅ Dart SDK `3.8.1` or higher
- ✅ Android Studio / Xcode
- ✅ VS Code or Android Studio (recommended)

### Installation

<details>
<summary>📥 <b>Step-by-Step Installation Guide</b></summary>

<br>

**1️⃣ Clone the repository**

```bash
git clone https://github.com/AbdelrahmanAddel/animals_project.git
cd animals_project
```

**2️⃣ Install dependencies**

```bash
flutter pub get
```

**3️⃣ Generate code**

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

**4️⃣ Run the app**

```bash
# Debug mode
flutter run

# Release mode
flutter run --release

# Specific device
flutter run -d <device_id>
```

</details>

### 🔑 API Configuration

The app uses [TheCatAPI](https://thecatapi.com/). To configure:

1. Get a free API key from [TheCatAPI](https://thecatapi.com/signup)
2. Open `lib/core/networking/dio_factory.dart`
3. Replace the API key:

```dart
dio!.options.headers = {
  'x-api-key': 'YOUR_API_KEY_HERE',
};
```

---

## 🎯 Key Features Explained

### 🏠 Home Screen
- Browse through a curated list of adoptable pets
- Filter by categories (All, Dogs, Cats, Birds, Fish, Other)
- Search functionality with real-time results
- Add pets to favorites with a single tap

### ⭐ Favorites Management
- View all your favorite pets in one place
- Grid layout for easy browsing
- Quick remove from favorites
- Persistent storage across app sessions

### 📊 Pet Details
- Comprehensive breed information
- High-quality pet images
- Key stats: Gender, Life Span, Weight
- Detailed description and temperament
- Wikipedia link for more information
- Direct adoption action

### 🔍 Smart Search
- Real-time search results
- Search by pet name
- Instant filtering
- No results? Get helpful feedback

---

## 🔮 Roadmap

- [ ] **Authentication**
  - [ ] User login/register
  - [ ] Social login (Google, Facebook)
  - [ ] Profile management

- [ ] **Enhanced Features**
  - [ ] More pet categories (Dogs, Birds, Fish)
  - [ ] Advanced filters (Age, Size, Location)
  - [ ] Pet location mapping
  - [ ] Adoption request workflow

- [ ] **Technical Improvements**
  - [ ] Offline caching
  - [ ] Dark mode support
  - [ ] Push notifications
  - [ ] Analytics integration
  - [ ] Multi-language support (i18n)

- [ ] **Social Features**
  - [ ] Share pets on social media
  - [ ] User reviews and ratings
  - [ ] Pet adoption stories

---

## 🤝 Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

<details>
<summary>📝 <b>Contributing Guidelines</b></summary>

<br>

1. **Fork the Project**
2. **Create your Feature Branch**
   ```bash
   git checkout -b feature/AmazingFeature
   ```
3. **Commit your Changes**
   ```bash
   git commit -m 'Add some AmazingFeature'
   ```
4. **Push to the Branch**
   ```bash
   git push origin feature/AmazingFeature
   ```
5. **Open a Pull Request**

</details>

Please make sure to update tests as appropriate and adhere to the existing coding style.

---

## 👨‍💻 Author

<div align="center">

### **Abdelrahman Ezzeldean**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/abdelrahman-ezzeldean/)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/AbdelrahmanAddel)
[![Email](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:abdelrahmanezzeldean@gmail.com)

</div>

---

## 🙏 Acknowledgments

<div align="center">

Special thanks to:

- [TheCatAPI](https://thecatapi.com/) - For providing the amazing pet data API
- [Flutter Team](https://flutter.dev/) - For the incredible framework
- [BLoC Library](https://bloclibrary.dev/) - For the excellent state management solution
- All open-source contributors who inspire this project

</div>

---

## 📊 Project Stats

<div align="center">

![GitHub repo size](https://img.shields.io/github/repo-size/AbdelrahmanAddel/animals_project?style=for-the-badge)
![GitHub code size](https://img.shields.io/github/languages/code-size/AbdelrahmanAddel/animals_project?style=for-the-badge)
![GitHub issues](https://img.shields.io/github/issues/AbdelrahmanAddel/animals_project?style=for-the-badge)
![GitHub pull requests](https://img.shields.io/github/issues-pr/AbdelrahmanAddel/animals_project?style=for-the-badge)

</div>

---

<div align="center">

### ⭐ If you found this project helpful, please give it a star!

**Made with ❤️ using Flutter**

[⬆ Back to Top](#-pet-adoption-app)

</div>
