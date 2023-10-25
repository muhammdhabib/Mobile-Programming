import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicalapp/views/halaman_utama.dart';
import 'package:medicalapp/views/halaman_pesan.dart';
import 'package:medicalapp/views/halaman_jadwal.dart';
import 'package:medicalapp/views/pengaturan.dart';

class NavBarRoots extends StatefulWidget {
  @override
  State<NavBarRoots> createState() => _NavBarRootsState();
}

class _NavBarRootsState extends State<NavBarRoots> {
  int _selectedIndex = 0;
  final _screens = [
    HomeScreen(),
    MessagesScreen(),
    ScheduleScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFF7165D6),
          unselectedItemColor: Colors.black26,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.chat_bubble_text_fill,
                ),
                label: "Pesan"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_outlined), label: "Jadwal"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Pengatuhan"),
          ],
        ),
      ),
    );
  }
}
