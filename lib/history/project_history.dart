import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trackmy_mentor/common_widgets/bottom_navigation.dart';
import 'package:trackmy_mentor/homepage/homepage_categories.dart';
import 'package:trackmy_mentor/homepage/homepage_mypopulargigs.dart';
import 'package:trackmy_mentor/homepage/homepage_populargigs.dart';
import 'package:trackmy_mentor/homepage/homepage_popularteacher.dart';
import 'package:trackmy_mentor/homepage/homepage_topgigs.dart';

class ProjectHistory extends StatefulWidget {
 
  @override
  State<ProjectHistory> createState() => _ProjectHistoryState();
}

class _ProjectHistoryState extends State<ProjectHistory> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //bottomNavigationBar: BottomNavigation(),
      appBar: AppBar(
        title: Text('History'.toUpperCase()),
        actions: [],
        leading:  Container(
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Container(
              child: HomepageMyPopularGigs(),
            ),

          ],
        ),
      ),
      
    );
  }
}
