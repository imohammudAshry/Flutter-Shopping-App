- Features: 

Authentication Screens

* صفحة ترحيب (Welcome)
* تسجيل حساب (Sign Up)
* تسجيل دخول (Sign In)
* انتقال سلس بين الشاشات باستخدام Animated Navigation

- Home Screen

* AppBar بعنوان Our Products / منتجاتنا
* PageView أفقي لعرض المنتجات المميزة
* GridView (صفين × عمودين) لعرض المنتجات

  * كل منتج يحتوي على:

    * صورة
    * اسم المنتج
    * زر Add to Cart يظهر SnackBar
* قسم Hot Offers

  * باستخدام ListView.builder
  * يعرض 5 عروض، كل عرض يحتوي:

    * صورة
    * نص مختصر

 - Arabic Localization

* دعم كامل للغة العربية باستخدام:

  * ملفات .arb
  * intl

* أمثلة للنصوص:

  * Our Products → منتجاتنا
  * Hot Offers → العروض الساخنة
  * Sign Up → إنشاء حساب


- Project Structure

lib/
│
├── main.dart
│
├── screens/
│   ├── welcome_screen.dart
│   ├── signup_screen.dart
│   ├── signin_screen.dart
│   └── home_screen.dart
│
├── widgets/
│   ├── product_card.dart
│   └── offer_card.dart
│
└── models/
    └── product_model.dart

- Screenshots

/screenshots
  ├── welcome.png
  ├── signup.png
  ├── signin.png
  ├── home.png
  └── offers.png

- Setup Instructions

1-Clone the repository
git clone <repository-url>

2-Install packages
flutter pub get

3-Run the project
flutter run


- Requirements

* Flutter SDK
* Android Studio / VS Code
* Emulator or physical device


- Author

Mohamed Ashry
Project developed as part of sprint training tasks using Flutter.

- Notes

* المشروع جاهز للتوسّع وإضافة:

  * نظام إدارة سلة المشتريات
  * تسجيل بالخادم
  * قواعد بيانات
