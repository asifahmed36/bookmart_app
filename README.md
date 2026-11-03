# BookMart — Rokomari-Inspired E-Commerce Bookstore App 📚

A modern, responsive e-commerce bookstore mobile and web application built with **Flutter (Material 3)**, inspired by Bangladesh's premier online bookstore, [Rokomari.com](https://www.rokomari.com).

Featuring a clean multi-tier architecture, phone OTP verification, a signature **"Look Inside" (একটু পড়ে দেখুন)** sample page reader, author-wise catalog filtering, promo coupon redemption, shipping zone calculations, and multi-channel checkout support (bKash, Nagad, Cards, Cash on Delivery).

---

## ✨ Features

- **📱 Mobile OTP & Password Authentication:**
  - Phone number verification with SMS OTP simulation (`Demo Code: 1234`).
  - Account registration, credential login, and one-tap **Guest Mode**.
- **🔍 Catalog & Live Search:**
  - Real-time instant search by book title, author, or publisher.
  - Category filter chips (*Fiction*, *Islamic Books*, *Mystery & Thriller*, *Self-Help*, *Tech & Programming*).
  - Book Fair promotional hero banner.
- **📖 "Look Inside" Sample Page Reader (একটু পড়ে দেখুন):**
  - Rokomari-style preview modal for reading excerpt pages before purchasing.
  - Page-by-page navigation with customizable reading font sizes.
- **✍️ Authors & Publishers Directory:**
  - Dedicated tab to explore popular writers (Humayun Ahmed, Arif Azad, Satyajit Ray, James Clear, Muhammed Zafar Iqbal) and filter books by author.
- **🛒 Shopping Cart & Bangladeshi Checkout Flow:**
  - Real-time cart quantity modification and subtotal calculation.
  - Promo coupon redemption (e.g. `ROKOMARI50` for TK 50 off).
  - Automated shipping fee calculation: **Inside Dhaka (৳50)** vs. **Outside Dhaka (৳90)**.
  - Payment method selector: **bKash**, **Nagad**, **Card / SSLCommerz**, and **Cash on Delivery**.
- **📦 Order Tracking & Wishlist:**
  - Generates custom Order IDs (`#ROK-10042X`) and live order status tracking.
  - Persistent favorite/wishlist management with one-tap cart transfers.

---

## 🏗️ Project Architecture

The app is organized into a clean, modular multi-tier folder structure inside `lib/`:

```text
bookmart_app/
├── pubspec.yaml
└── lib/
    ├── main.dart                          # App entry point, theme & route gate
    ├── models/                            # Data models & JSON serialization
    │   ├── user_profile.dart              # User credentials & profile data
    │   ├── book.dart                      # Book entity with discount logic
    │   ├── cart_item.dart                 # Cart items & item totals
    │   └── order_record.dart              # Placed orders & status
    ├── data/                              # Static initial catalog
    │   └── sample_books.dart              # Book catalog & category constants
    ├── services/                          # API & backend abstraction
    │   └── api_service.dart               # HTTP client & promo verification
    ├── providers/                         # App-wide state management
    │   └── bookstore_controller.dart      # ChangeNotifier controller for cart/wishlist
    ├── widgets/                           # Reusable UI widgets
    │   ├── book_card.dart                 # Catalog grid card with discount badges
    │   └── look_inside_sheet.dart         # Interactive sample reader modal
    └── screens/                           # Top-level screen views
        ├── auth_screen.dart               # Phone OTP login, registration & guest mode
        ├── main_navigation_shell.dart     # Bottom navigation bar & top app bar
        ├── home_screen.dart               # Search, banner, categories & grid
        ├── book_detail_screen.dart        # Full details, specifications & buy action
        ├── authors_screen.dart            # Directory of authors & author catalogs
        ├── cart_screen.dart               # Cart management, coupon & delivery options
        └── orders_wishlist_screen.dart    # Order tracking & saved books list
```

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (v3.19.0 or higher recommended)
- [Dart SDK](https://dart.dev/get-dart)
- [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)
- Google Chrome (for web testing) or an Android device (for mobile testing)

---

### Installation & Run

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/bookmart_app.git
   cd bookmart_app
   ```

2. **Install Flutter dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run on Computer (Google Chrome Web):**
   ```bash
   flutter run -d chrome
   ```

4. **Run on Mobile Phone (Android via USB):**
   - Enable **USB Debugging** on your phone (in *Developer Options*).
   - Plug your phone into your PC via USB cable.
   - Run:
     ```bash
     flutter run
     ```

5. **Build an Installable Android APK:**
   ```bash
   flutter build apk --release
   ```
   The generated APK will be saved at `build/app/outputs/flutter-apk/app-release.apk`.

---

## 🔐 Demo Credentials

When logging in or registering via the **Mobile OTP Verification** screen:
- **Mobile Number:** Enter any 11-digit Bangladeshi number (e.g., `01712345678`).
- **Demo Verification Code:** `1234`
- **Promo Coupon Code:** `ROKOMARI50` (applies TK 50 discount on checkout).

---

## 🛠️ Built With

- **Framework:** [Flutter](https://flutter.dev/)
- **Language:** [Dart](https://dart.dev/)
- **Design System:** Material 3 with custom brand palette (Sky Blue `#009EE2` & Green Accent `#33C24D`)
- **State Management:** `ChangeNotifier` / `ListenableBuilder` (Vanilla Flutter, zero external package lock-in)

---

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](https://www.google.com/search?q=LICENSE) file for details.
