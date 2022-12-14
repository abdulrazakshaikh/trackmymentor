import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trackmy_mentor/ui/common_widgets/bottom_navigation.dart';
import 'package:trackmy_mentor/ui/homepage/homepage_categories.dart';
import 'package:trackmy_mentor/ui/homepage/homepage_mypopulargigs.dart';
import 'package:trackmy_mentor/ui/homepage/homepage_populargigs.dart';
import 'package:trackmy_mentor/ui/homepage/homepage_popularteacher.dart';
import 'package:trackmy_mentor/ui/homepage/homepage_topgigs.dart';

class Homepage extends StatefulWidget {
 
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        // bottomNavigationBar: BottomNavigation(),
        appBar: AppBar(
          title: Text('Dashboard'.toUpperCase()),
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
                child: HomepagePopularTeacher(),
              ),
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






            ],
          ),
        ),

      ),
    );
  }
}
