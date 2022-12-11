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
                    Container(
                      height: 100,
                      margin: EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: Image.network(
                            "https://www.creatopy.com/blog/wp-content/uploads/2016/06/images-for-banner-ads-1024x527.png",
                            fit: BoxFit.cover,
                            width: 1000.0),
                      ),
                    )
                    //SliderWidget(),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    SliderWidget(),
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
