import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trackmy_mentor/common_widgets/bottom_navigation.dart';
import 'package:trackmy_mentor/homepage/homepage_categories.dart';
import 'package:trackmy_mentor/homepage/homepage_mypopulargigs.dart';
import 'package:trackmy_mentor/homepage/homepage_populargigs.dart';
import 'package:trackmy_mentor/homepage/homepage_popularteacher.dart';
import 'package:trackmy_mentor/homepage/homepage_topgigs.dart';

class Homepage extends StatefulWidget {
 
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      appBar: AppBar(
        title: Text('Dashboard'.toUpperCase()),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            // HomepageAdsslider()
            Container(
              child: HomepageMyPopularGigs(),
            ),
            
            Container(
              child: HomepageCategories(),
            ),

            Container(
              child: HomepagePopularGigs(),
            ),

            Container(
              child: HomepageTopGigs(),
            ),

            Container(
              child: HomepagePopularTeacher(),
            ),


            

          ],
        ),
      ),
      
    );
  }
}
