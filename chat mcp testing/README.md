# Flutter Chat Screen

A beautiful chat screen implementation based on a Figma design, featuring RTL (Arabic) support.

## Features

- ✅ RTL (Right-to-Left) layout support for Arabic text
- ✅ Multiple message types:
  - Text messages
  - Voice messages with waveform visualization
  - File attachments (PDF)
  - Date separators
- ✅ Message status indicators (sent, delivered, read)
- ✅ Contact header with profile picture and online status
- ✅ Modern chat input with AI features
- ✅ Voice recording button
- ✅ Attachment support
- ✅ Message reactions
- ✅ Beautiful gradient backgrounds
- ✅ Smooth animations

## Design

This implementation is based on the Figma design: [Chat Screen](https://www.figma.com/design/VNE96QDRM5ak9dfc7dd4cz/sirr-mcp-testing?node-id=3-2987)

## Project Structure

```
lib/
├── main.dart                  # App entry point
├── models/
│   └── message.dart          # Message and Contact models
├── screens/
│   └── chat_screen.dart      # Main chat screen
└── widgets/
    ├── contact_header.dart   # Top contact header
    ├── message_bubble.dart   # Message bubble widgets
    ├── chat_input.dart       # Bottom input field
    └── voice_waveform.dart   # Voice message waveform
```

## Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)

### Installation

1. Clone or download this repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```

### Running the App

```bash
flutter run
```

## Customization

### Colors

The app uses colors from the Figma design:
- Primary color: `#3656A7`
- Background: `#F5F2EB`
- Text primary: `#0A0A0A`
- Text secondary: `rgba(0, 0, 0, 0.5)`

You can modify these in the respective widget files.

### Fonts

The app requires the following font families:
- SF Pro Text (Semibold, Regular)
- Open Sans (Regular, SemiBold)
- Noto Sans Arabic (Regular, SemiBold)

**Note:** Due to licensing, fonts are not included. Please:
1. Download the required fonts
2. Place them in `assets/fonts/`
3. Update `pubspec.yaml` with correct font file names

Alternatively, you can use system fonts by removing the `fontFamily` properties.

### Adding Real Functionality

To add real functionality:

1. **Message Sending**: Update `_sendMessage()` in `chat_screen.dart` to integrate with your backend
2. **Voice Recording**: Implement `onVoicePressed` callback in `chat_input.dart`
3. **File Attachments**: Implement `onAttachmentPressed` callback in `chat_input.dart`
4. **AI Features**: Implement `onAIPressed` callback in `chat_input.dart`
5. **Contact Data**: Load real contact data in `chat_screen.dart`

## Screenshots

The implementation closely matches the Figma design with:
- Accurate spacing and sizing
- Proper RTL text alignment
- Matching color scheme
- Beautiful gradients and shadows

## License

This project is created for demonstration purposes based on a Figma design.

