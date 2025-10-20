import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/message.dart';
import 'voice_waveform.dart';

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (message.type == MessageType.date) {
      return _buildDateSeparator();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        mainAxisAlignment:
            message.isSent ? MainAxisAlignment.start : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (message.isSent) const SizedBox(width: 50),
          Flexible(
            child: Column(
              crossAxisAlignment: message.isSent
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
              children: [
                _buildMessageContent(),
                if (message.reaction != null) _buildReaction(),
              ],
            ),
          ),
          if (!message.isSent) const SizedBox(width: 50),
        ],
      ),
    );
  }

  Widget _buildMessageContent() {
    switch (message.type) {
      case MessageType.text:
        return _buildTextMessage();
      case MessageType.voice:
        return _buildVoiceMessage();
      case MessageType.attachment:
        return _buildAttachmentMessage();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildTextMessage() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: message.isSent
            ? const Color(0xFFDCE8F8)
            : const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            message.content,
            style: const TextStyle(
              fontSize: 15,
              fontFamily: 'Noto Sans Arabic',
              color: Color(0xFF0A0A0A),
              height: 1.4,
            ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (message.isSent) _buildMessageStatus(),
              const SizedBox(width: 4),
              Text(
                _formatTime(message.timestamp),
                style: TextStyle(
                  fontSize: 11,
                  fontFamily: 'Open Sans',
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVoiceMessage() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: message.isSent
            ? const Color(0xFFDCE8F8)
            : const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Play button
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: Color(0xFF3656A7),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 8),
          // Waveform
          VoiceWaveform(
            color: const Color(0xFF3656A7),
            width: 120,
            height: 30,
          ),
          const SizedBox(width: 8),
          // Duration
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                message.voiceDuration != null
                    ? _formatDuration(message.voiceDuration!)
                    : '0:00',
                style: TextStyle(
                  fontSize: 11,
                  fontFamily: 'Open Sans',
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              const SizedBox(height: 2),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (message.isSent) _buildMessageStatus(),
                  const SizedBox(width: 4),
                  Text(
                    _formatTime(message.timestamp),
                    style: TextStyle(
                      fontSize: 11,
                      fontFamily: 'Open Sans',
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAttachmentMessage() {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: message.isSent
            ? const Color(0xFFDCE8F8)
            : const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Download icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.download,
              color: Colors.grey,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          // File info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'pdf',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        message.attachmentName ?? 'Document',
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Noto Sans Arabic',
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0A0A0A),
                        ),
                        textDirection: TextDirection.rtl,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '${message.attachmentSize} • ${message.attachmentPages}',
                  style: TextStyle(
                    fontSize: 11,
                    fontFamily: 'Open Sans',
                    color: Colors.black.withOpacity(0.5),
                  ),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (message.isSent) _buildMessageStatus(),
                    const SizedBox(width: 4),
                    Text(
                      _formatTime(message.timestamp),
                      style: TextStyle(
                        fontSize: 11,
                        fontFamily: 'Open Sans',
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateSeparator() {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          message.content,
          style: const TextStyle(
            fontSize: 13,
            fontFamily: 'Noto Sans Arabic',
            fontWeight: FontWeight.w600,
            color: Color(0xFF0A0A0A),
          ),
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }

  Widget _buildReaction() {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        message.reaction!,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildMessageStatus() {
    IconData icon;
    Color color = const Color(0xFF3656A7);

    switch (message.status) {
      case MessageStatus.sent:
        icon = Icons.check;
        break;
      case MessageStatus.delivered:
      case MessageStatus.read:
        icon = Icons.done_all;
        break;
      default:
        icon = Icons.access_time;
        color = Colors.grey;
    }

    return Icon(
      icon,
      size: 14,
      color: color,
    );
  }

  String _formatTime(DateTime time) {
    return DateFormat('HH:mm').format(time);
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}

