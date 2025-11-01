# Quick Start Guide

Get the Sirr Settings screen running in 3 simple steps!

## 🚀 Quick Setup

### Step 1: Install Dependencies
```bash
cd "sirr settings"
flutter pub get
```

### Step 2: Run the App
```bash
flutter run
```

That's it! The app will launch on your connected device or simulator.

## 📱 Running on Specific Platforms

### iOS Simulator
```bash
open -a Simulator
flutter run
```

### Android Emulator
```bash
# Start your Android emulator first, then:
flutter run
```

### Chrome (Web)
```bash
flutter run -d chrome
```

## 🔧 Troubleshooting

### If you get "No devices found"
- **iOS**: Open Xcode and ensure iOS Simulator is installed
- **Android**: Open Android Studio and start an emulator
- **Web**: Run `flutter config --enable-web`

### If dependencies fail to install
```bash
flutter clean
flutter pub get
```

### If you see font warnings
The app uses "SF Pro Text" font which is iOS native. On other platforms, it will fall back to the system font automatically.

## 📖 Next Steps

- Read the full [README.md](README.md) for detailed information
- Customize the user profile in `lib/settings_screen.dart`
- Add your own images to `assets/images/`
- Modify colors and styling to match your brand

## 💡 Tips

- Hot reload: Press `r` in the terminal while the app is running to see changes instantly
- Hot restart: Press `R` for a full restart
- Quit: Press `q` to stop the app

## 🎨 Design Reference

View the original Figma design:
[Sirr Settings - Figma](https://www.figma.com/design/Bi5jUYeob7H8cLeHGJlkPp/settings?node-id=0-1&m=dev)

---

**Need help?** Check out [flutter.dev](https://flutter.dev) for Flutter documentation.

