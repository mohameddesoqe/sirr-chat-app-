enum MessageType {
  text,
  voice,
  attachment,
  date,
}

enum MessageStatus {
  sending,
  sent,
  delivered,
  read,
}

class Message {
  final String id;
  final String content;
  final MessageType type;
  final bool isSent;
  final DateTime timestamp;
  final MessageStatus? status;
  final String? attachmentUrl;
  final String? attachmentName;
  final String? attachmentSize;
  final String? attachmentPages;
  final Duration? voiceDuration;
  final String? reaction;

  Message({
    required this.id,
    required this.content,
    required this.type,
    required this.isSent,
    required this.timestamp,
    this.status,
    this.attachmentUrl,
    this.attachmentName,
    this.attachmentSize,
    this.attachmentPages,
    this.voiceDuration,
    this.reaction,
  });
}

class Contact {
  final String name;
  final String? lastSeen;
  final String? avatarUrl;
  final bool isOnline;

  Contact({
    required this.name,
    this.lastSeen,
    this.avatarUrl,
    this.isOnline = false,
  });
}

