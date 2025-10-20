import 'package:flutter/material.dart';

class ChatInput extends StatefulWidget {
  final Function(String) onSendMessage;
  final VoidCallback? onAttachmentPressed;
  final VoidCallback? onVoicePressed;
  final VoidCallback? onAIPressed;

  const ChatInput({
    Key? key,
    required this.onSendMessage,
    this.onAttachmentPressed,
    this.onVoicePressed,
    this.onAIPressed,
  }) : super(key: key);

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final TextEditingController _controller = TextEditingController();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _hasText = _controller.text.trim().isNotEmpty;
    });
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      widget.onSendMessage(text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFF6F6F6),
            Color(0xFFF0F0F0),
          ],
        ),
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Input bar
          Container(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // AI and attachment buttons
                Row(
                  children: [
                    _buildIconButton(
                      onPressed: widget.onAIPressed,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF3656A7),
                              Color(0xFFFFD700),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Icon(
                          Icons.auto_awesome,
                          size: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    _buildIconButton(
                      onPressed: widget.onAttachmentPressed,
                      child: const Icon(
                        Icons.attach_file,
                        size: 20,
                        color: Color(0xFFA4A7AE),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                // Message input
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(36),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.shield_outlined,
                          size: 20,
                          color: Color(0xFF9DA3A7),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            maxLines: null,
                            style: const TextStyle(
                              fontSize: 15.8,
                              fontFamily: 'Noto Sans Arabic',
                              color: Color(0xFF0A0A0A),
                              letterSpacing: -0.2054,
                            ),
                            decoration: const InputDecoration(
                              hintText: 'نص الرسالة ..',
                              hintStyle: TextStyle(
                                fontSize: 15.8,
                                fontFamily: 'Noto Sans Arabic',
                                color: Color(0xFFBDBDBD),
                                letterSpacing: -0.2054,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                              isDense: true,
                            ),
                            onSubmitted: (_) => _sendMessage(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Voice/Send button
                GestureDetector(
                  onTap: _hasText ? _sendMessage : widget.onVoicePressed,
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      gradient: const RadialGradient(
                        center: Alignment(0.5, 0.5),
                        radius: 0.5,
                        colors: [
                          Color(0xFF3656A7),
                          Color(0xFF2C3D72),
                          Color(0xFF263157),
                          Color(0xFF21243C),
                        ],
                        stops: [0.0, 0.356, 0.534, 0.712],
                      ),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Icon(
                      _hasText ? Icons.send : Icons.mic,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Home indicator (Android Chrome style)
          Container(
            height: 15,
            color: const Color(0xFFF0F0F0),
            child: Center(
              child: Container(
                width: 66,
                height: 2,
                decoration: BoxDecoration(
                  color: const Color(0xFFD0D5DD),
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton({
    required VoidCallback? onPressed,
    required Widget child,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(56),
      child: Container(
        padding: const EdgeInsets.all(4),
        child: child,
      ),
    );
  }
}

