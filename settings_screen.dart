import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: Column(
          children: [
            // Status Bar
            _buildStatusBar(),
            // Header
            _buildHeader(),
            // Settings Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Profile Section
                    _buildProfileSection(),
                    const SizedBox(height: 12),
                    // First Settings Group
                    _buildFirstSettingsGroup(),
                    const SizedBox(height: 12),
                    // Second Settings Group
                    _buildSecondSettingsGroup(),
                    const SizedBox(height: 24),
                    // Footer Text
                    _buildFooter(),
                  ],
                ),
              ),
            ),
            // Bottom Navigation
            _buildBottomNav(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBar() {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: const Color(0xFFF7F7F7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '9:41',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.165,
            ),
          ),
          Row(
            children: [
              Icon(Icons.signal_cellular_4_bar, size: 17),
              const SizedBox(width: 4),
              Icon(Icons.wifi, size: 17),
              const SizedBox(width: 4),
              Icon(Icons.battery_full, size: 17),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        color: Color(0xFFF7F7F7),
        border: Border(
          bottom: BorderSide(color: Color(0xFFEDEDED), width: 1),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Color(0xFF3656A7),
            ),
            onPressed: () {},
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'الاعدادات',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0A0A0A),
                  letterSpacing: -0.14,
                ),
              ),
              Text(
                'التحكم في حسابك الشخصي',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF767779),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Color(0xFF535862),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.chevron_left,
              color: Color(0xFF3656A7),
              size: 24,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  'عبد الله محمد',
                  style: TextStyle(
                    fontSize: 16.8,
                    color: Color(0xFF0A0A0A),
                    letterSpacing: -0.336,
                  ),
                ),
                Text(
                  '+966 56 785 7845',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF767779),
                    letterSpacing: -0.14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF0A0A0A).withOpacity(0.1),
                width: 0.248,
              ),
              image: const DecorationImage(
                image: NetworkImage('https://via.placeholder.com/32'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFirstSettingsGroup() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          _buildSettingsItem(
            icon: Icons.person_outline,
            title: 'الملف الشخصي',
            subtitle: 'نبذة تعريفية',
            showSeparator: true,
          ),
          _buildSettingsItem(
            icon: Icons.security_outlined,
            title: 'الحساب',
            subtitle: 'اشعارات الامان , تغيير الرقم',
            showSeparator: true,
          ),
          _buildSettingsItem(
            icon: Icons.share_outlined,
            title: 'مشاركة ملفات التطبيق',
            subtitle: 'ارسل , استقبل ملفات بين الهاتف و الكومبيوتر',
            showSeparator: true,
          ),
          _buildSettingsItem(
            icon: Icons.lock_outline,
            title: 'الخصوصية',
            subtitle: 'حظر جهات الاتصال, الرسائل ذاتية الاختفاء',
            showSeparator: true,
          ),
          _buildSettingsItem(
            icon: Icons.list_alt_outlined,
            title: 'القوائم',
            subtitle: 'ادارة الاشخاص و المجموعات',
            showSeparator: true,
            showDot: false,
          ),
          _buildSettingsItem(
            icon: Icons.devices_outlined,
            title: 'الاجهزة المرتبطة',
            subtitle: 'يمكنك ربط الاجهزة الاخري بهذا الحساب',
            showSeparator: true,
            showDot: true,
          ),
          _buildSettingsItem(
            icon: Icons.chat_bubble_outline,
            title: 'الدردشات',
            subtitle: 'المظهر , خلفيات الشاشة , حجم الخط',
            showSeparator: false,
          ),
        ],
      ),
    );
  }

  Widget _buildSecondSettingsGroup() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          _buildSettingsItem(
            icon: Icons.notifications_outlined,
            title: 'الاشعارات',
            subtitle: 'نغمات الرسالة و المجموعة و المكالمة',
            showSeparator: true,
          ),
          _buildSettingsItem(
            icon: Icons.language_outlined,
            title: 'لغة التطبيق',
            subtitle: 'العربية',
            showSeparator: true,
            showChevron: true,
          ),
          _buildSettingsItemWithToggle(
            icon: Icons.dark_mode_outlined,
            title: 'الوضع الليلي',
            subtitle: 'ايقاف',
            showSeparator: true,
          ),
          _buildSettingsItem(
            icon: Icons.help_outline,
            title: 'المساعدة',
            subtitle: 'دليل تعليمي , اتصل بنا , ساسية الخصوصية',
            showSeparator: true,
          ),
          _buildSettingsItem(
            icon: Icons.system_update_outlined,
            title: 'تحديثات التطبيق',
            showSeparator: true,
          ),
          _buildSettingsItem(
            icon: Icons.delete_outline,
            title: 'حذف بيانات التطبيق',
            showSeparator: false,
            iconColor: const Color(0xFFD92D20),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    String? subtitle,
    bool showSeparator = false,
    bool showDot = false,
    bool showChevron = false,
    Color iconColor = const Color(0xFF3656A7),
  }) {
    return Container(
      decoration: BoxDecoration(
        border: showSeparator
            ? const Border(
                bottom: BorderSide(
                  color: Color(0x33000000),
                  width: 0.3,
                ),
              )
            : null,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
      child: Row(
        children: [
          Icon(
            icon,
            size: 24,
            color: iconColor,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF0A0A0A),
                      letterSpacing: -0.32,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF767779),
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ],
              ),
            ),
          ),
          if (showDot)
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF12B76A),
              ),
            ),
          if (showChevron)
            const Icon(
              Icons.chevron_left,
              size: 24,
              color: Color(0xFFE9EAEB),
            ),
        ],
      ),
    );
  }

  Widget _buildSettingsItemWithToggle({
    required IconData icon,
    required String title,
    String? subtitle,
    bool showSeparator = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: showSeparator
            ? const Border(
                bottom: BorderSide(
                  color: Color(0x33000000),
                  width: 0.3,
                ),
              )
            : null,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          Icon(
            icon,
            size: 24,
            color: const Color(0xFF3656A7),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF0A0A0A),
                      letterSpacing: -0.32,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF767779),
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          _buildToggleSwitch(false),
        ],
      ),
    );
  }

  Widget _buildToggleSwitch(bool value) {
    return Container(
      width: 41,
      height: 25,
      decoration: BoxDecoration(
        color: value ? const Color(0xFF3656A7) : const Color(0xFFE4E4E6),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Align(
        alignment: value ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.all(2),
          width: 23,
          height: 23,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 1,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 8,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return RichText(
      textAlign: TextAlign.right,
      text: const TextSpan(
        style: TextStyle(
          fontSize: 16,
          color: Color(0xFFB3B7C9),
          letterSpacing: -0.32,
          fontWeight: FontWeight.w300,
        ),
        children: [
          TextSpan(text: 'Sirr © 2025. Powered by '),
          TextSpan(
            text: '3YN',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: ' Technologies.'),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xCCF7F7FA),
            blurRadius: 12,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                icon: Icons.settings,
                label: 'الاعدادات',
                isActive: true,
              ),
              _buildNavItem(
                icon: Icons.access_time,
                label: 'التحديثات',
                isActive: false,
              ),
              _buildNavItem(
                icon: Icons.chat_bubble_outline,
                label: 'المحادثات',
                isActive: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isActive,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          gradient: isActive
              ? const RadialGradient(
                  center: Alignment(0.5, 0.5),
                  radius: 1.0,
                  colors: [
                    Color(0xFF3656A7),
                    Color(0xFF2C3D72),
                    Color(0xFF263157),
                    Color(0xFF21243C),
                  ],
                  stops: [0.0, 0.356, 0.534, 0.712],
                )
              : null,
          border: isActive ? Border.all(color: const Color(0xFF3656A7)) : null,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 42,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
              ),
              child: Icon(
                icon,
                size: 24,
                color: isActive ? Colors.white : const Color(0xFFA4A7AE),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: isActive ? const Color(0xFF3656A7) : const Color(0xFFA4A7AE),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

