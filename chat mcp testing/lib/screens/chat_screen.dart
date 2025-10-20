import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/message.dart';
import '../widgets/contact_header.dart';
import '../widgets/message_bubble.dart';
import '../widgets/chat_input.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> _messages = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadSampleMessages();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadSampleMessages() {
    // Sample messages based on the Figma design
    _messages.addAll([
      Message(
        id: '1',
        content: 'أمس',
        type: MessageType.date,
        isSent: false,
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
      ),
      Message(
        id: '2',
        content: '',
        type: MessageType.voice,
        isSent: false,
        timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
        voiceDuration: const Duration(seconds: 25),
        status: MessageStatus.read,
        reaction: '👍',
      ),
      Message(
        id: '3',
        content: 'اليوم',
        type: MessageType.date,
        isSent: false,
        timestamp: DateTime.now().subtract(const Duration(hours: 5)),
      ),
      Message(
        id: '4',
        content: 'نا، يا، دكتور، أين أنت؟',
        type: MessageType.text,
        isSent: true,
        timestamp: DateTime.now().subtract(const Duration(hours: 4)),
        status: MessageStatus.read,
      ),
      Message(
        id: '5',
        content: 'استمتع، هل يمكنك أن تتليفوني',
        type: MessageType.text,
        isSent: false,
        timestamp: DateTime.now().subtract(const Duration(hours: 3)),
      ),
      Message(
        id: '6',
        content: 'محمد كيفك أنت؟',
        type: MessageType.text,
        isSent: false,
        timestamp: DateTime.now().subtract(const Duration(hours: 3)),
      ),
      Message(
        id: '7',
        content: 'انتظر دقيقة، انتظر دقيقة. الساعة 1:15 صباحاً؟',
        type: MessageType.text,
        isSent: true,
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        status: MessageStatus.read,
      ),
      Message(
        id: '8',
        content: 'مرتبات الموظفين الشهرية',
        type: MessageType.attachment,
        isSent: false,
        timestamp: DateTime.now().subtract(const Duration(hours: 1)),
        attachmentName: 'مرتبات الموظفين الشهرية',
        attachmentSize: '66 KB',
        attachmentPages: '2 pages',
      ),
    ]);
  }

  void _sendMessage(String text) {
    setState(() {
      _messages.add(
        Message(
          id: DateTime.now().toString(),
          content: text,
          type: MessageType.text,
          isSent: true,
          timestamp: DateTime.now(),
          status: MessageStatus.sending,
        ),
      );
    });

    // Scroll to bottom
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });

    // Simulate message sent
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        final lastMessage = _messages.last;
        final index = _messages.indexOf(lastMessage);
        _messages[index] = Message(
          id: lastMessage.id,
          content: lastMessage.content,
          type: lastMessage.type,
          isSent: lastMessage.isSent,
          timestamp: lastMessage.timestamp,
          status: MessageStatus.sent,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F2EB), // Color Chat background
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(98), // 44 status bar + 54 header
        child: Column(
          children: [
            // Status bar
            Container(
              height: 44,
              color: Colors.transparent,
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '9:41',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: const [
                          Icon(Icons.signal_cellular_4_bar, size: 16),
                          SizedBox(width: 4),
                          Icon(Icons.wifi, size: 16),
                          SizedBox(width: 4),
                          Icon(Icons.battery_full, size: 20),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Contact header
            ContactHeader(
              contact: Contact(
                name: 'محمد عبدالله',
                lastSeen: 'آخر ظهور اليوم الساعة 10:05 م',
                avatarUrl: 'https://i.pravatar.cc/150?img=12',
              ),
              onBackPressed: () {},
              onCallPressed: () {},
              onVideoCallPressed: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Messages list
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF5F2EB),
                // Add subtle pattern background if needed
              ),
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return MessageBubble(message: _messages[index]);
                },
              ),
            ),
          ),
          // Input field
          ChatInput(
            onSendMessage: _sendMessage,
            onAttachmentPressed: () {
              // Handle attachment
            },
            onVoicePressed: () {
              // Handle voice recording
            },
            onAIPressed: () {
              // Handle AI features
            },
          ),
        ],
      ),
    );
  }
}

