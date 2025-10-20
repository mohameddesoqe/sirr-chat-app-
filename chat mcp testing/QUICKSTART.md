# Quick Start Guide

## 🚀 Get Started in 3 Steps

### Step 1: Install Dependencies

```bash
cd "/Users/dessouky/Desktop/chat mcp testing"
flutter pub get
```

### Step 2: Handle Fonts (Choose Option A or B)

#### Option A: Use Without Custom Fonts (Fastest)

Simply comment out or remove the `fonts:` section in `pubspec.yaml`:

```yaml
# Comment out or remove this section:
# fonts:
#   - family: SF Pro Text
#     ...
```

And remove `fontFamily` properties from the code files, or the app will use system defaults automatically.

#### Option B: Add Custom Fonts

1. Download fonts from:
   - [SF Pro Text](https://developer.apple.com/fonts/) 
   - [Open Sans](https://fonts.google.com/specimen/Open+Sans)
   - [Noto Sans Arabic](https://fonts.google.com/noto/specimen/Noto+Sans+Arabic)

2. Place font files in `assets/fonts/` with these exact names:
   - `SFProText-Regular.ttf` & `SFProText-Semibold.ttf`
   - `OpenSans-Regular.ttf` & `OpenSans-SemiBold.ttf`
   - `NotoSansArabic-Regular.ttf` & `NotoSansArabic-SemiBold.ttf`

### Step 3: Run the App

```bash
flutter run
```

Or press **F5** in VS Code / Run in your IDE

## 📱 Features You'll See

- ✅ **RTL Chat Interface** - Full Arabic text support
- ✅ **Multiple Message Types** - Text, voice, and attachments
- ✅ **Voice Messages** - With animated waveform
- ✅ **File Attachments** - PDF preview with metadata
- ✅ **Message Status** - Sent, delivered, read indicators
- ✅ **Reactions** - Emoji reactions on messages
- ✅ **Modern Input** - AI button, attachments, voice recording
- ✅ **Beautiful UI** - Gradients, shadows, smooth animations

## 🎨 Customization

### Change Colors

Edit these color values in the widget files:

- **Primary Color**: `Color(0xFF3656A7)` (Blue)
- **Background**: `Color(0xFFF5F2EB)` (Cream)
- **Text Primary**: `Color(0xFF0A0A0A)` (Black)

### Add Real Data

Replace sample messages in `lib/screens/chat_screen.dart`:

```dart
void _loadSampleMessages() {
  // Replace with your actual message data
  _messages.addAll([...]);
}
```

### Connect to Backend

Implement these callbacks:
- `_sendMessage()` - Send to your API
- `onVoicePressed` - Record voice messages
- `onAttachmentPressed` - Upload files
- `onAIPressed` - AI features

## 🐛 Troubleshooting

### Font Errors?
Remove the `fonts:` section from `pubspec.yaml` to use system fonts.

### Build Errors?
```bash
flutter clean
flutter pub get
flutter run
```

### Layout Issues?
Make sure you're running on a mobile device or emulator (not desktop).

## 📝 File Structure

```
lib/
├── main.dart              # Entry point
├── models/
│   └── message.dart      # Data models
├── screens/
│   └── chat_screen.dart  # Main screen
└── widgets/
    ├── contact_header.dart
    ├── message_bubble.dart
    ├── chat_input.dart
    └── voice_waveform.dart
```

## 💡 Tips

- The chat background has a subtle pattern (currently solid color)
- Voice waveforms are randomly generated for demo
- Avatar images use placeholder service (pravatar.cc)
- All text supports RTL (Arabic) automatically
- The design matches the Figma mockup pixel-perfectly

Enjoy your chat screen! 🎉

