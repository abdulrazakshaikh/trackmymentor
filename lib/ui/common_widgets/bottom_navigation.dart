import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trackmy_mentor/ui/add/addproject_info.dart';
import 'package:trackmy_mentor/ui/homepage/homepage.dart';

import '../../model/storage/shared_prefs.dart';
import '../chat/chat_list.dart';
import '../history/project_history.dart';
import '../profile/userprofile.dart';

class BottomNavigation extends StatefulWidget {
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  List<Map<String, Object>> _pages = [];
  var isTeacher = SharedPrefs().userdata?.type == "2";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _onItemTapped(int index) {
    if (!isTeacher && index == 2) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AddProjectInfo()));
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }

}

  @override
  Widget build(BuildContext context) {
    if (isTeacher) {
      _pages = [
        {
          'page': Homepage(),
          'title': "",
        },
        {
          'page': ChatList(),
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
    } else {
      _pages = [
        {
          'page': Homepage(),
          'title': "",
        },
        {
          'page': ChatList(),
          'title': "",
        },
        {
          'page': AddProjectInfo(),
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
    }

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
                items: isTeacher
                    ? [
                        BottomNavigationBarItem(
                            icon: Icon(Icons.home_outlined),
                            activeIcon: Icon(Icons.home_filled),
                            label: '',
                            tooltip: 'Homepage'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.chat_outlined),
                            activeIcon: Icon(Icons.chat),
                            label: '',
                            tooltip: 'Message'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.list_alt_outlined),
                            activeIcon: Icon(Icons.list_alt),
                            label: '',
                            tooltip: 'History'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.account_circle_outlined),
                            activeIcon: Icon(Icons.account_circle),
                            label: '',
                            tooltip: 'Profile'),
                      ]
                    : [
                        BottomNavigationBarItem(
                            icon: Icon(Icons.home_outlined),
                            activeIcon: Icon(Icons.home_filled),
                            label: '',
                            tooltip: 'Homepage'),
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

