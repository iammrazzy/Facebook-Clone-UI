import 'package:facebook_clone/views/friend_page.dart';
import 'package:facebook_clone/views/home_page.dart';
import 'package:facebook_clone/views/menu_page.dart';
import 'package:facebook_clone/views/notification_page.dart';
import 'package:facebook_clone/views/profile_page.dart';
import 'package:facebook_clone/views/video_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Default index
  int currentIndex = 0;

  // List all pages
  List pages = [
    const HomePage(),
    const VideoPage(),
    const FriendPage(),
    const ProfilePage(),
    const NotificationPage(),
    const MenuPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 25.0,
        selectedLabelStyle: GoogleFonts.kantumruyPro(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: GoogleFonts.kantumruyPro(
          fontSize: 15.0,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_camera_back_outlined),
            label: 'Video',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_outlined),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          )
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
