import 'package:dentbuy_flutter_app/core/constants/app_assets.dart';
import 'package:dentbuy_flutter_app/core/utils/app_colors.dart';
import 'package:dentbuy_flutter_app/feature/home/page/clinics_screen.dart';
import 'package:dentbuy_flutter_app/feature/home/page/tools_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'chat_screen.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  final Color primaryBlue = const Color(0xFF1E88E5);

  @override
  Widget build(BuildContext context) {
    final chats = [
      {'name': 'Mohamed Atef', 'lastMessage': 'ineed to know', 'time': '09:30 AM'},
      {'name': 'Sara Mohamed', 'lastMessage': 'what is the location?', 'time': 'Yesterday'},
      {'name': 'Mohamed Hassan', 'lastMessage': 'what is the latest price', 'time': 'Mon'},
      {'name': 'Layla Ali', 'lastMessage': 'actually, I was need...', 'time': '08:10 PM'},
      {'name': 'Abdulrahman Khalefa', 'lastMessage': 'ok thank you', 'time': 'Sun'},
      {'name': 'Ahmed Adel', 'lastMessage': 'how many clinics do you have?', 'time': '07:45 AM'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,

          appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.black12,
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
        titleSpacing: 12,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [

            // ── Row 1: Logo + Categories ───────────────
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SvgPicture.asset(
                  AppAssets.logoSvg,
                  width: 36,
                  colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                ),

                SizedBox(width: 40),

                // Clinics
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ClinicsScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary.withOpacity(0.1),
                        ),
                        child: Icon(Icons.maps_home_work, size: 14, color: AppColors.primary),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Clinics',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.primary),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 30),

                // Tools
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ToolsScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary.withOpacity(0.1),
                        ),
                        child: Icon(Icons.handyman, size: 14, color: AppColors.primary),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Tools',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.primary),
                      ),
                    ],
                  ),
                ),

                Spacer(),

                // Notification
               
              ],
            ),

            SizedBox(height: 6),

          ],
        ),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatScreen(
                    name: chat['name']!,
                  ),
                ),
              );
            },

            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),

              child: Row(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: primaryBlue.withOpacity(0.1),
                    child: Icon(
                      Icons.person,
                      color: primaryBlue,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chat['name']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          chat['lastMessage']!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        chat['time']!,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Icon(
                        Icons.chevron_right,
                        color: primaryBlue,
                        size: 18,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}