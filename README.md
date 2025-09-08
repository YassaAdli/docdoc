# 🏥 Docdoc - Healthcare Appointment Booking App

<div align="center">
  <img src="assets/images/logo/logo.png" alt="Docdoc Logo" width="200"/>

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
[![BLoC](https://img.shields.io/badge/BLoC-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://bloclibrary.dev/)
[![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)](https://developer.android.com/)
[![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white)](https://developer.apple.com/ios/)
</div>

## 📱 Overview

Docdoc is a modern, cross-platform healthcare application that connects patients with doctors, enabling seamless appointment booking and healthcare management. Built with Flutter, the app provides an intuitive interface for users to find, book, and manage medical appointments.

## ✨ Key Features

### 🔐 Authentication & Onboarding
- **Secure Login/Registration** with JWT token authentication
- **Onboarding Flow** for first-time users
- **Remember Me** functionality with secure credential storage
- **Splash Screen** with automatic navigation logic

### 🏠 Home Dashboard
- **Doctor Specialties** browsing with visual categories
- **Recommended Doctors** based on user preferences
- **Quick Search** functionality
- **Appointment Overview** and management

### 👨‍⚕️ Doctor Management
- **Doctor Search** by name and specialization
- **Detailed Doctor Profiles** with ratings and reviews
- **Specialization Filtering** for targeted searches
- **Doctor Recommendations** algorithm

### 📅 Appointment Booking
- **Multi-step Booking Process** with date/time selection
- **Appointment Types** (consultation, follow-up, etc.)
- **Payment Integration** for booking fees
- **Booking Confirmation** and summary
- **Appointment History** tracking

### 💬 Communication
- **In-app Messaging** system
- **Appointment Notifications**
- **Real-time Updates** for booking status

### 👤 User Profile
- **Personal Information** management
- **Appointment History** and tracking
- **Settings** and preferences
- **Profile Customization**

## 🏗️ Architecture

### Clean Architecture Implementation
```
lib/
├── core/                    # Core utilities and shared components
│   ├── error/              # Error handling
│   ├── network/            # API service and networking
│   ├── utils/              # Utility functions and services
│   └── widget/             # Reusable widgets
├── feature/                # Feature-based modules
│   ├── authentication/     # Login, register, onboarding
│   └── home/              # Main app features
└── main.dart              # App entry point
```

### State Management
- **BLoC Pattern** for predictable state management
- **Cubit** for simpler state logic
- **Repository Pattern** for data abstraction
- **Dependency Injection** with GetIt

### Key Technologies
- **Flutter 3.8.1+** - Cross-platform UI framework
- **BLoC/Cubit** - State management
- **Go Router** - Navigation and routing
- **Dio** - HTTP client for API calls
- **GetIt** - Dependency injection
- **Shared Preferences** - Local data storage
- **Flutter Secure Storage** - Secure token storage
- **Cached Network Image** - Image caching and optimization

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.8.1 or higher)
- Dart SDK
- Android Studio / VS Code
- Android SDK (for Android development)
- Xcode (for iOS development)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/docdoc.git
   cd docdoc
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Build for Production

**Android APK:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

## 📱 Screenshots

<div align="center">
  <img src="assets/images/screenshots/home.png" alt="Home Screen" width="200"/>
  <img src="assets/images/screenshots/doctors.png" alt="Doctors List" width="200"/>
  <img src="assets/images/screenshots/booking.png" alt="Booking Screen" width="200"/>
  <img src="assets/images/screenshots/profile.png" alt="Profile Screen" width="200"/>
</div>

## 🔧 Configuration

### API Configuration
Update the API base URL in `lib/core/network/api_service.dart`:
```dart
class ApiService {
  static const String baseUrl = 'YOUR_API_BASE_URL';
  // ... rest of the implementation
}
```

### Environment Variables
Create a `.env` file in the root directory:
```
API_BASE_URL=https://your-api-url.com
API_KEY=your-api-key
```

## 🧪 Testing

Run tests with:
```bash
flutter test
```

## 📦 Dependencies

### Main Dependencies
- `flutter_bloc: ^9.1.1` - State management
- `go_router: ^16.1.0` - Navigation
- `dio: ^5.9.0` - HTTP client
- `get_it: ^8.2.0` - Dependency injection
- `shared_preferences: ^2.5.3` - Local storage
- `flutter_secure_storage: ^9.2.4` - Secure storage
- `cached_network_image: ^3.4.1` - Image caching

### Dev Dependencies
- `flutter_test` - Testing framework
- `flutter_lints: ^6.0.0` - Code linting

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Team

- **Developer**: [Your Name]
- **Design**: [Designer Name]
- **Backend**: [Backend Developer Name]

## 📞 Support

For support, email support@docdoc.com or join our Slack channel.

## 🔮 Future Enhancements

- [ ] Video consultation integration
- [ ] Prescription management
- [ ] Health records storage
- [ ] Multi-language support
- [ ] Dark mode theme
- [ ] Push notifications
- [ ] Offline mode support

---

<div align="center">
  
</div>


