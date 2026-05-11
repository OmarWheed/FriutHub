# 🍓 FruitHub

> A modern cross-platform Flutter application for browsing and discovering fresh fruits — built with Firebase, BLoC state management, and clean architecture.

---

## 📖 Description

**FruitHub** is a Flutter e-commerce-style mobile application focused on fruits. It provides a smooth, localized shopping experience with Firebase-powered authentication (Email/Password, Google, and Facebook sign-in), real-time Firestore data, and a clean UI with skeleton loading states. The app supports multiple languages via `easy_localization` and follows a layered clean architecture pattern using the BLoC pattern and dependency injection.

---

## 📸 Screenshots

<table>
  <tr>
    <td align="center"><b>Splash 1</b></td>
    <td align="center"><b>Splash 2</b></td>
  </tr>
  <tr>
    <td><img width="375" src="https://github.com/user-attachments/assets/9f58f7f7-cb17-46d1-87a9-70160239de4f" /></td>
    <td><img width="375" src="https://github.com/user-attachments/assets/ef960a72-d183-4b84-9edf-e9820d9a5911" /></td>
  </tr>
  <tr>
    <td align="center"><b>Onboarding 1</b></td>
    <td align="center"><b>Onboarding 2</b></td>
  </tr>
  <tr>
    <td><img width="375" src="https://github.com/user-attachments/assets/18b8bb01-8c94-4ebf-ad78-1d23d45e3cb2" /></td>
    <td><img width="375" src="https://github.com/user-attachments/assets/be7c47ae-aa62-4a69-ad34-52fefb0848e0" /></td>
  </tr>
  <tr>
    <td align="center"><b>Onboarding 3</b></td>
    <td align="center"><b>Onboarding 4</b></td>
  </tr>
  <tr>
    <td><img width="375" src="https://github.com/user-attachments/assets/5c480584-b50a-4278-9bdf-961593807a83" /></td>
    <td><img width="375" src="https://github.com/user-attachments/assets/822fcd0c-c43d-4ec8-81dd-3b934d9a9578" /></td>
  </tr>
  <tr>
    <td align="center"><b>Login - Empty</b></td>
    <td align="center"><b>Login - Filled</b></td>
  </tr>
  <tr>
    <td><img width="375" src="https://github.com/user-attachments/assets/04101769-3eac-4fc0-b446-c91c9de65254" /></td>
    <td><img width="375" src="https://github.com/user-attachments/assets/92dcf79c-c163-42b7-8c73-296c79cb89b4" /></td>
  </tr>
  <tr>
    <td align="center"><b>Sign Up - Empty</b></td>
    <td align="center"><b>Sign Up - Filled</b></td>
  </tr>
  <tr>
    <td><img width="375" src="https://github.com/user-attachments/assets/c0ed6b7a-4bd7-4b9d-b3ae-837ca8dfd0d4" /></td>
    <td><img width="375" src="https://github.com/user-attachments/assets/a4006771-bd68-4088-8e74-02876541556e" /></td>
  </tr>
  <tr>
    <td align="center"><b>Forgot Password</b></td>
    <td align="center"><b>Password Recovery</b></td>
  </tr>
  <tr>
    <td><img width="375" src="https://github.com/user-attachments/assets/9ae3de92-b53d-46e4-ad99-f6422df78abf" /></td>
    <td><img width="375" src="https://github.com/user-attachments/assets/b1350ace-6322-4bd5-9f9d-aa8a7898ee00" /></td>
  </tr>
  <tr>
    <td align="center"><b>Reset Password</b></td>
    <td align="center"><b>Home</b></td>
  </tr>
  <tr>
    <td><img width="375" src="https://github.com/user-attachments/assets/b5ec3df4-e16f-4269-8b30-75779f784d20" /></td>
    <td><img width="375" src="https://github.com/user-attachments/assets/4af67464-d139-41c4-bdb5-0dc17aebcdd4" /></td>
  </tr>
  <tr>
    <td align="center"><b>Products</b></td>
    <td align="center"><b>Products (Alt)</b></td>
  </tr>
  <tr>
    <td><img width="375" src="https://github.com/user-attachments/assets/eb0ea013-5f01-4f8a-8adc-006280ceff55" /></td>
    <td><img width="375" src="https://github.com/user-attachments/assets/542518ea-8bf6-4099-9625-041d10ded292" /></td>
  </tr>
  <tr>
    <td align="center"><b>Item Details</b></td>
    <td align="center"><b>More Popular</b></td>
  </tr>
  <tr>
    <td><img width="375" src="https://github.com/user-attachments/assets/ec57b557-8a1a-49ea-9d7e-8c5af9ca0a80" /></td>
    <td><img width="375" src="https://github.com/user-attachments/assets/89c9d85b-9172-4391-a00b-d922c4cd39fa" /></td>
  </tr>
  <tr>
    <td align="center"><b>Search</b></td>
    <td align="center"><b>Recent Search</b></td>
  </tr>
  <tr>
    <td><img width="375" src="https://github.com/user-attachments/assets/e6c38925-944e-461b-a779-546cc99a2cc6" /></td>
    <td><img width="375" src="https://github.com/user-attachments/assets/e55d84bc-6e67-4fb3-93b9-3c7b4599a990" /></td>
  </tr>
  <tr>
    <td align="center"><b>Search No Result</b></td>
    <td align="center"><b>Filter</b></td>
  </tr>
  <tr>
    <td><img width="375" src="https://github.com/user-attachments/assets/ebf65f26-eb96-42a2-8272-bc838fe13ba8" /></td>
    <td><img width="375" src="https://github.com/user-attachments/assets/0ba3ef6c-1f6e-4919-bdae-5766fb5d0e87" /></td>
  </tr>
  <tr>
    <td align="center"><b>Sort By</b></td>
    <td align="center"><b>Cart</b></td>
  </tr>
  <tr>
    <td><img width="375" src="https://github.com/user-attachments/assets/b47496a1-13bf-41a3-a938-4462d41e826b" /></td>
    <td><img width="375" src="https://github.com/user-attachments/assets/9524e2fb-bf25-439f-ad12-bed253eaf821" /></td>
  </tr>
  <tr>
    <td align="center"><b>Checkout</b></td>
    <td align="center"><b>Checkout (Step 2)</b></td>
  </tr>
  <tr>
    <td><img width="375" src="https://github.com/user-attachments/assets/3524553f-c2a7-4990-a526-8aef5d3ef59a" /></td>
    <td><img width="375" src="https://github.com/user-attachments/assets/2e080b90-0c57-49ab-b810-132ba6ba0a66" /></td>
  </tr>
  <tr>
    <td align="center"><b>Checkout (Step 3)</b></td>
    <td align="center"><b>Track Order</b></td>
  </tr>
  <tr>
    <td><img width="375" src="https://github.com/user-attachments/assets/06df60ea-a389-4474-9889-07304c943a0b" /></td>
    <td><img width="375" src="https://github.com/user-attachments/assets/5b13557d-15c7-4623-925c-f5462dc40ac2" /></td>
  </tr>
  <tr>
    <td align="center"><b>Review</b></td>
    <td align="center"><b>Review (Alt)</b></td>
  </tr>
  <tr>
    <td><img width="375" src="https://github.com/user-attachments/assets/db829e6c-5b3c-4d7b-a179-50f9a12c2040" /></td>
    <td><img width="375" src="https://github.com/user-attachments/assets/31fa4909-d191-41ef-be20-e31528d5daf5" /></td>
  </tr>
  <tr>
    <td align="center"><b>Review & Rating</b></td>
    <td align="center"><b>Notifications</b></td>
  </tr>
  <tr>
    <td><img width="375" src="https://github.com/user-attachments/assets/f20de43d-0ea6-4e73-b127-e29432e7f365" /></td>
    <td><img width="375" src="https://github.com/user-attachments/assets/d51d6cce-8597-4847-979b-81baa36c665d" /></td>
  </tr>
  <tr>
    <td align="center"><b>Favourites</b></td>
    <td align="center"><b>Payments</b></td>
  </tr>
  <tr>
    <td><img width="375" src="https://github.com/user-attachments/assets/ab680558-e701-444b-a89a-f12375f60d07" /></td>
    <td><img width="375" src="https://github.com/user-attachments/assets/a2bf0dbb-8355-4150-ad1b-c6e2327b03e4" /></td>
  </tr>
  <tr>
    <td align="center"><b>Add Payment Method</b></td>
    <td align="center"><b>My Orders</b></td>
  </tr>
  <tr>
    <td><img width="375" src="https://github.com/user-attachments/assets/7f0129b1-2cd7-4238-9291-6ec4639d47cc" /></td>
    <td><img width="375" src="https://github.com/user-attachments/assets/0369f53c-2102-4512-8a8e-03e84c250688" /></td>
  </tr>
  <tr>
    <td align="center"><b>Profile</b></td>
    <td align="center"><b>My Account</b></td>
  </tr>
  <tr>
    <td><img width="375" src="https://github.com/user-attachments/assets/d2a30b62-b8b0-425d-8bbd-0117ede87626" /></td>
    <td><img width="375" src="https://github.com/user-attachments/assets/6ba97b3a-6405-4886-b29c-ccdedc3db45e" /></td>
  </tr>
  <tr>
    <td align="center"><b>Password Changed</b></td>
    <td align="center"><b>Sign Out</b></td>
  </tr>
  <tr>
    <td><img width="375" src="https://github.com/user-attachments/assets/ec211970-c08d-46fa-be85-4ee7e5173c76" /></td>
    <td><img width="375" src="https://github.com/user-attachments/assets/7d2d4601-f1c8-4dfc-9300-2ac3231ae50c" /></td>
  </tr>
  <tr>
    <td align="center"><b>About Us</b></td>
    <td></td>
  </tr>
  <tr>
    <td><img width="375" src="https://github.com/user-attachments/assets/87223dd7-ce57-4b53-a877-eafbb1491d37" /></td>
    <td></td>
  </tr>
</table>

---

## 🗂️ Project Structure

```
FruitHub/
├── android/                  # Android native project files
├── ios/                      # iOS native project files
├── linux/                    # Linux desktop support
├── macos/                    # macOS desktop support
├── windows/                  # Windows desktop support
├── web/                      # Web support
├── assets/
│   ├── images/               # App images & logo
│   │   └── logo/
│   ├── fonts/
│   │   └── cario/            # Cairo font variants (Regular, Medium, SemiBold, Bold)
│   └── translations/         # Localization JSON files (easy_localization)
├── lib/                      # Main Dart source code
│   └── ...                   # Features, core, shared modules
├── test/                     # Unit & widget tests
├── pubspec.yaml              # Project dependencies & asset declarations
├── firebase.json             # Firebase project configuration
├── flutter_launcher_icons.yaml  # App icon generation config
├── analysis_options.yaml     # Dart linting rules
└── devtools_options.yaml     # Flutter DevTools configuration
```

---

## 📦 Packages Used

### 🔥 Firebase & Auth
| Package | Version | Purpose |
|---|---|---|
| `firebase_core` | ^3.12.1 | Firebase initialization |
| `firebase_auth` | ^5.5.1 | Email/Password authentication |
| `cloud_firestore` | ^5.6.6 | Real-time NoSQL database |
| `google_sign_in` | ^6.3.0 | Google OAuth sign-in |
| `flutter_facebook_auth` | ^7.1.1 | Facebook OAuth sign-in |

### 🧠 State Management & Architecture
| Package | Version | Purpose |
|---|---|---|
| `flutter_bloc` | ^9.1.0 | BLoC pattern state management |
| `get_it` | ^8.0.3 | Dependency injection / service locator |
| `dartz` | ^0.10.1 | Functional programming (Either, Option) |
| `equatable` | ^2.0.7 | Value equality for BLoC states/events |

### 🌍 Localization
| Package | Version | Purpose |
|---|---|---|
| `easy_localization` | ^3.0.7+1 | Multi-language support |

### 💾 Local Storage
| Package | Version | Purpose |
|---|---|---|
| `shared_preferences` | ^2.5.2 | Lightweight key-value local storage |

### 🎨 UI & UX
| Package | Version | Purpose |
|---|---|---|
| `flutter_svg` | ^2.0.17 | SVG image rendering |
| `flutter_svg_provider` | ^1.0.7 | SVG as ImageProvider |
| `dots_indicator` | ^4.0.1 | Onboarding/page indicator dots |
| `skeletonizer` | ^2.1.0+1 | Skeleton loading placeholder UI |
| `modal_progress_hud_nsn` | ^0.5.1 | Loading overlay/spinner |
| `cupertino_icons` | ^1.0.8 | iOS-style icons |

### 🛠️ Dev Dependencies
| Package | Version | Purpose |
|---|---|---|
| `flutter_launcher_icons` | ^0.14.3 | Auto-generate app launcher icons |
| `flutter_lints` | ^5.0.0 | Recommended Dart lint rules |

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK `^3.6.0`
- Dart SDK `^3.6.0`
- A Firebase project with Android/iOS apps configured

### Installation

```bash
# Clone the repository
git clone https://github.com/OmarWheed/FriutHub.git
cd FriutHub

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### Firebase Setup
1. Create a Firebase project at [console.firebase.google.com](https://console.firebase.google.com)
2. Add your Android/iOS app and download `google-services.json` / `GoogleService-Info.plist`
3. Place config files in the appropriate native directories
4. Enable **Email/Password**, **Google**, and **Facebook** sign-in methods in Firebase Auth

---

## 🌐 Localization

The app uses `easy_localization`. Translation files are located in `assets/translations/`. To add a new language, create a new JSON file in that directory and register it in the app entry point.

---

## 🧪 Running Tests

```bash
flutter test
```

---

## 📱 Platform Support

| Platform | Supported |
|---|---|
| Android | ✅ |
| iOS | ✅ |
| Web | ✅ |
| Windows | ✅ |
| macOS | ✅ |
| Linux | ✅ |

---

## 🤝 Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

---

## 📄 License

This project is for educational/personal use. No license currently specified.
