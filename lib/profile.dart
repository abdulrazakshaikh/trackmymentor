import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trackmy_mentor/common_widgets/bottom_navigation.dart';

class Profile extends StatefulWidget {
 
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      appBar: AppBar(
        title: Text('Profile'.toUpperCase()),
        actions: [],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Profile'.toUpperCase(),
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ),
      
    );
  }
}
