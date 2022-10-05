import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trackmy_mentor/chat.dart';
import 'package:trackmy_mentor/dashboard.dart';
import 'package:trackmy_mentor/history.dart';
import 'package:trackmy_mentor/profile.dart';
import 'dart:async';

class BottomNavigation extends StatefulWidget {
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> with TickerProviderStateMixin {
   int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

  // Navigator.push(context, 
  //   MaterialPageRoute(
  //     builder: (context) => 
      
  //   )
  // );
}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
        decoration: BoxDecoration( 
          borderRadius: BorderRadius.circular(30),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.2),
                blurRadius: 5.0,
                offset: Offset(0.0, 0.1)
            )
          ],
        ),
      
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),  
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_filled),
              label: '',
              tooltip: 'Homepage'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_outlined),
              activeIcon: Icon(Icons.chat),
              label: '',
              tooltip: 'Message'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline_outlined),
              activeIcon: Icon(Icons.add_circle),
              label: '',
              tooltip: 'Add'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_outlined),
              activeIcon: Icon(Icons.list_alt),
              label: '',
              tooltip: 'History'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              activeIcon: Icon(Icons.account_circle),
              label: '',
              tooltip: 'Profile'
            ),
          ]
        ),
      ),
    );
  }
}

