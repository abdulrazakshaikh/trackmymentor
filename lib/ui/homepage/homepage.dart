import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trackmy_mentor/model/storage/shared_prefs.dart';
import 'package:trackmy_mentor/ui/homepage/homepage_categories.dart';
import 'package:trackmy_mentor/ui/homepage/homepage_mypopulargigs.dart';
import 'package:trackmy_mentor/ui/homepage/homepage_populargigs.dart';
import 'package:trackmy_mentor/ui/homepage/homepage_popularteacher.dart';
import 'package:trackmy_mentor/ui/homepage/homepage_topgigs.dart';
import 'package:trackmy_mentor/ui/homepage/slider_widget.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isTeacher = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isTeacher = SharedPrefs().userdata?.type == "2";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //bottomNavigationBar: BottomNavigation(),
        appBar: AppBar(
          title: Text('Dashboard'.toUpperCase()),
          actions: [],
          leading: Container(
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: isTeacher
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    SliderWidget(),
                    Container(
                      child: HomepageTopGigs(),
                    ),
                    Container(
                      child: HomepageCategories(),
                    ),
                    SliderWidget(size: 1),
                  ],
                )
              : Column(
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
                      child: HomepagePopularGigs(),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
