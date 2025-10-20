# Project Structure

## 📁 Complete File Tree

```
chat mcp testing/
│
├── 📄 pubspec.yaml                 # Flutter project configuration
├── 📄 analysis_options.yaml        # Linter rules
├── 📄 .gitignore                   # Git ignore rules
│
├── 📚 Documentation
│   ├── 📄 README.md               # Main documentation
│   ├── 📄 QUICKSTART.md           # Quick start guide
│   ├── 📄 IMPLEMENTATION.md       # Detailed implementation notes
│   └── 📄 PROJECT_STRUCTURE.md    # This file
│
├── 📂 assets/
│   ├── 📂 fonts/
│   │   └── 📄 README.md           # Font installation guide
│   └── 📂 images/
│       └── 📄 README.md           # Image assets guide
│
└── 📂 lib/
    ├── 📄 main.dart               # App entry point
    │
    ├── 📂 models/
    │   └── 📄 message.dart        # Message & Contact models
    │
    ├── 📂 screens/
    │   └── 📄 chat_screen.dart    # Main chat screen
    │
    └── 📂 widgets/
        ├── 📄 contact_header.dart  # Top header with avatar
        ├── 📄 message_bubble.dart  # Message bubbles (all types)
        ├── 📄 chat_input.dart      # Bottom input field
        └── 📄 voice_waveform.dart  # Voice message waveform
```

## 🔍 File Purposes

### Core Application Files

#### `lib/main.dart` (Entry Point)
```dart
// Initializes the app
// Sets system UI styling
// Defines MaterialApp theme
// Launches ChatScreen
```

#### `lib/models/message.dart` (Data Models)
```dart
// Message model with all properties
// MessageType enum (text, voice, attachment, date)
// MessageStatus enum (sent, delivered, read)
// Contact model
```

#### `lib/screens/chat_screen.dart` (Main Screen)
```dart
// Full chat interface
// Message list with ScrollController
// Sample data loading
// Message sending logic
// Layout composition
```

### Widget Components

#### `lib/widgets/contact_header.dart`
**Purpose**: Top header showing contact info
- Avatar with status ring
- Name and last seen text
- Call/video call buttons
- Menu button
- Blur background effect

#### `lib/widgets/message_bubble.dart`
**Purpose**: All message types
- Text messages (sent & received)
- Voice messages with waveform
- File attachments (PDF)
- Date separators
- Message status indicators
- Reactions support

#### `lib/widgets/chat_input.dart`
**Purpose**: Bottom input field
- Text input with RTL support
- AI features button
- Attachment picker button
- Voice/send button toggle
- Security shield icon
- Gradient background

#### `lib/widgets/voice_waveform.dart`
**Purpose**: Voice message visualization
- Custom painter for waveform
- Animated bars
- Configurable colors and size

## 📊 Component Hierarchy

```
MyApp
└── ChatScreen
    ├── AppBar
    │   ├── StatusBar (iOS style)
    │   └── ContactHeader
    │       ├── BackButton
    │       ├── Avatar
    │       ├── ContactInfo
    │       ├── CallButton
    │       ├── VideoCallButton
    │       └── MenuButton
    │
    ├── Body
    │   └── ListView
    │       └── MessageBubble (repeated)
    │           ├── TextMessage
    │           ├── VoiceMessage
    │           │   ├── PlayButton
    │           │   ├── VoiceWaveform
    │           │   └── Duration
    │           ├── AttachmentMessage
    │           │   ├── FileIcon
    │           │   ├── FileName
    │           │   └── FileInfo
    │           └── DateSeparator
    │
    └── ChatInput
        ├── AIButton
        ├── AttachmentButton
        ├── TextInput
        │   ├── ShieldIcon
        │   └── TextField
        ├── MicButton (or SendButton)
        └── HomeIndicator
```

## 🎯 Widget Responsibilities

### Stateful Widgets
- `ChatScreen` - Manages message list and scroll
- `ChatInput` - Manages text input state

### Stateless Widgets
- `ContactHeader` - Displays contact info
- `MessageBubble` - Displays message content
- `VoiceWaveform` - Renders waveform

## 🔄 Data Flow

```
User Input
    ↓
ChatInput (onSendMessage)
    ↓
ChatScreen (_sendMessage)
    ↓
_messages List (setState)
    ↓
ListView.builder
    ↓
MessageBubble (displays)
```

## 📦 Dependencies Usage

```yaml
flutter: sdk
  ↳ Used for: Core framework

cupertino_icons: ^1.0.6
  ↳ Used for: iOS-style icons

intl: ^0.18.1
  ↳ Used for: Date/time formatting (DateFormat)

flutter_lints: ^3.0.0
  ↳ Used for: Code quality checks
```

## 🎨 Asset Organization

### Fonts (Optional)
```
assets/fonts/
├── SFProText-Regular.ttf
├── SFProText-Semibold.ttf
├── OpenSans-Regular.ttf
├── OpenSans-SemiBold.ttf
├── NotoSansArabic-Regular.ttf
└── NotoSansArabic-SemiBold.ttf
```

### Images (Optional)
```
assets/images/
├── avatar_placeholder.png
├── file_icon_pdf.png
└── background_pattern.png
```

## 🔧 Configuration Files

### `pubspec.yaml`
- Project metadata
- Dependencies
- Asset declarations
- Font configurations

### `analysis_options.yaml`
- Linter rules
- Code style preferences
- Best practices enforcement

### `.gitignore`
- Build artifacts
- IDE files
- Generated files

## 📱 Screen Dimensions

```
Total Screen: 375 x 812 (iPhone X/11/12/13)

├── Status Bar: 375 x 44
├── Contact Header: 375 x 54
├── Messages Area: 375 x 642 (scrollable)
└── Input Area: 375 x 72
    └── Home Indicator: 375 x 15
```

## 🎯 Key Features by File

| File | Key Features |
|------|--------------|
| `contact_header.dart` | Avatar, Name, Last seen, Call buttons |
| `message_bubble.dart` | 4 message types, Status icons, Reactions |
| `voice_waveform.dart` | Custom painting, Animated bars |
| `chat_input.dart` | RTL input, AI button, Mic/Send toggle |
| `chat_screen.dart` | Message list, Auto-scroll, Sample data |
| `message.dart` | Type-safe models, Enums |

## 🚀 To Run This Project

```bash
# Navigate to project
cd "/Users/dessouky/Desktop/chat mcp testing"

# Get dependencies
flutter pub get

# Run on connected device
flutter run

# Or run on specific device
flutter run -d chrome        # Web
flutter run -d ios           # iOS Simulator
flutter run -d android       # Android Emulator
```

## 📈 Future Extensions

Suggested structure for additional features:

```
lib/
├── services/           # API, Firebase, WebSocket
│   ├── api_service.dart
│   ├── auth_service.dart
│   └── messaging_service.dart
│
├── providers/          # State management
│   ├── chat_provider.dart
│   └── user_provider.dart
│
├── utils/             # Helpers and utilities
│   ├── constants.dart
│   ├── theme.dart
│   └── helpers.dart
│
└── l10n/              # Internationalization
    ├── app_en.arb
    └── app_ar.arb
```

---

**Total Files Created**: 16
**Total Lines of Code**: ~1,500+
**Widgets**: 6 custom widgets
**Models**: 2 data models
**Documentation**: 5 markdown files

