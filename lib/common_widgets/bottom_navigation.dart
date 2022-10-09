import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trackmy_mentor/chat.dart';
import 'package:trackmy_mentor/history.dart';
import 'package:trackmy_mentor/homepage/homepage.dart';
import 'package:trackmy_mentor/profile.dart';
import 'dart:async';

import '../add/add.dart';
import '../chat/chat_conversation.dart';
import '../chat/chat_list.dart';
import '../history/project_history.dart';
import '../profile/userprofile.dart';

class BottomNavigation extends StatefulWidget {
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> with TickerProviderStateMixin {
   int _selectedIndex = 0;
    List<Map<String, Object>> _pages=[];

  void _onItemTapped(int index) {
    if(index==2){
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) =>
            Add()
          )
      );
    }else {
      setState(() {
        _selectedIndex = index;
      });
    }

}

  @override
  Widget build(BuildContext context) {
    _pages=[
      {
        'page': Homepage(),
        'title': "",
      },
      {
        'page': ChatList(),
        'title': "",
      },
      {
        'page': Add(),
        'title': "",
      },
      {
        'page': ProjectHistory(),
        'title': "",
      },
      {
        'page': UserProfile(),
        'title': "",
      },

    ];
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _pages![_selectedIndex]!['page']! as Widget,
          ],
        ),
        bottomNavigationBar: Container(
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
        ),
      ),
    );
  }
}

