# Sirr Settings Screen

A Flutter implementation of the Settings screen from the Figma design.

## Design Source

This implementation is based on the Figma design:
https://www.figma.com/design/Bi5jUYeob7H8cLeHGJlkPp/settings?node-id=0-1&m=dev

## Features

- ✅ Status bar with time and system icons
- ✅ Header with navigation and title in Arabic
- ✅ Profile section with user info and avatar
- ✅ Multiple settings groups with icons and descriptions
- ✅ Toggle switch for dark mode
- ✅ Bottom navigation with active state
- ✅ RTL (Right-to-Left) support for Arabic text
- ✅ Responsive layout with proper spacing

## Project Structure

```
sirr settings/
├── lib/
│   ├── main.dart                 # App entry point
│   └── settings_screen.dart      # Main settings screen widget
├── assets/
│   └── images/                   # Image assets directory
├── pubspec.yaml                  # Flutter dependencies
├── analysis_options.yaml         # Dart analyzer configuration
├── .gitignore                    # Git ignore rules
└── README.md                     # This file
```

## Getting Started

### Prerequisites

- Flutter SDK (>=2.17.0)
- Dart SDK
- iOS Simulator, Android Emulator, or physical device

### Installation

1. Navigate to the project directory:
```bash
cd "sirr settings"
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Design Details

### Color Palette

- **Primary Blue**: `#3656A7`
- **Background**: `#F7F7F7`
- **Text Primary**: `#0A0A0A`
- **Text Secondary**: `#767779`
- **Success/Green**: `#12B76A`
- **Error/Red**: `#D92D20`
- **Gray**: `#A4A7AE`

### Typography

The design uses **SF Pro Text** font family with the following styles:
- Title: 16.8px - 16px
- Body: 14px
- Caption: 12px - 11px

### Components

1. **Status Bar** - Shows time and system icons
2. **Header** - Navigation with title and subtitle in Arabic
3. **Profile Card** - User information with avatar
4. **Settings Groups** - Two main groups with multiple items
5. **Settings Items** - Icon, title, subtitle, and optional indicators
6. **Toggle Switch** - For dark mode setting
7. **Bottom Navigation** - Three tabs with active state styling
8. **Footer** - Copyright text

## Customization

### Changing User Profile

Edit the profile section in `lib/settings_screen.dart`:

```dart
Text(
  'عبد الله محمد',  // User name
  style: TextStyle(...),
),
Text(
  '+966 56 785 7845',  // Phone number
  style: TextStyle(...),
),
```

### Adding New Settings Items

Use the `_buildSettingsItem` method:

```dart
_buildSettingsItem(
  icon: Icons.your_icon,
  title: 'عنوان الإعداد',
  subtitle: 'وصف الإعداد',
  showSeparator: true,
),
```

### Modifying Colors

Update the color constants in the widget:

```dart
const Color(0xFF3656A7)  // Primary color
const Color(0xFFF7F7F7)  // Background color
```

## RTL Support

The app supports Right-to-Left layout for Arabic text. All text elements are properly aligned to the right, and the layout direction follows RTL conventions.

## Notes

- The design is optimized for iPhone dimensions (375x812)
- Icons from Material Icons are used as placeholders for the custom icons in the Figma design
- Profile image uses a placeholder URL - replace with actual image assets
- The bottom navigation active state includes a gradient background as per the original design

## Future Enhancements

- [ ] Add navigation functionality to settings items
- [ ] Implement dark mode theme switching
- [ ] Add language switching capability
- [ ] Integrate with backend API for user data
- [ ] Add animations and transitions
- [ ] Download and use custom icons from Figma
- [ ] Add SF Pro Text font files

## License

Sirr © 2025. Powered by 3YN Technologies.

