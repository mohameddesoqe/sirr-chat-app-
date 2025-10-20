import 'package:flutter/material.dart';
import '../models/message.dart';

class ContactHeader extends StatelessWidget {
  final Contact contact;
  final VoidCallback? onBackPressed;
  final VoidCallback? onCallPressed;
  final VoidCallback? onVideoCallPressed;

  const ContactHeader({
    Key? key,
    required this.contact,
    this.onBackPressed,
    this.onCallPressed,
    this.onVideoCallPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xCCF4F4F4), // rgba(244,244,244,0.8)
        border: Border(
          bottom: BorderSide(
            color: Colors.black.withOpacity(0.1),
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        children: [
          // Call buttons
          Row(
            children: [
              _buildIconButton(
                icon: Icons.phone,
                color: const Color(0xFF535862),
                onPressed: onCallPressed,
              ),
              const SizedBox(width: 4),
              _buildIconButton(
                icon: Icons.videocam,
                color: const Color(0xFF3656A7),
                onPressed: onVideoCallPressed,
              ),
            ],
          ),
          const Spacer(),
          // Contact info
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Name and last seen
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        contact.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'SF Pro Text',
                          color: Color(0xFF0A0A0A),
                          letterSpacing: -0.32,
                        ),
                        textDirection: TextDirection.rtl,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (contact.lastSeen != null)
                        Text(
                          contact.lastSeen!,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Open Sans',
                            color: Colors.black.withOpacity(0.5),
                            letterSpacing: -0.12,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                // Avatar
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF3656A7),
                      width: 2,
                    ),
                  ),
                  child: ClipOval(
                    child: contact.avatarUrl != null
                        ? Image.network(
                            contact.avatarUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                _buildDefaultAvatar(),
                          )
                        : _buildDefaultAvatar(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 4),
          // Menu button
          _buildIconButton(
            icon: Icons.more_vert,
            color: const Color(0xFF535862),
            onPressed: onBackPressed,
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required Color color,
    VoidCallback? onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Icon(
          icon,
          size: 20,
          color: color,
        ),
      ),
    );
  }

  Widget _buildDefaultAvatar() {
    return Container(
      color: const Color(0xFF3656A7),
      child: const Center(
        child: Icon(
          Icons.person,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}

