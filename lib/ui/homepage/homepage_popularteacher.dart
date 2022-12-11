import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trackmy_mentor/data/userdata.dart';
import 'package:trackmy_mentor/ui/profile/teacherprofile.dart';
import 'package:trackmy_mentor/view_model/teacher_view_model.dart';

import '../see_all_teacher_list.dart';

class HomepagePopularTeacher extends StatefulWidget {
  @override
  _HomepagePopularTeacherState createState() =>
      new _HomepagePopularTeacherState();
}

class _HomepagePopularTeacherState extends State<HomepagePopularTeacher> {
  List<UserData> teacherItemlist = [];
  late TeacherViewModel teacherViewModel;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await teacherViewModel.getTeacherList();
      teacherItemlist = teacherViewModel.listData;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    teacherViewModel = context.watch<TeacherViewModel>();
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Text(
                  'Popular Teacher'.toUpperCase(),
                  style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      letterSpacing: 1.5,
                      fontSize:
                          MediaQuery.of(context).size.width < 321 ? 16 : 18,
                      fontWeight: FontWeight.w900),
                )),
                teacherViewModel.isLoading || teacherItemlist.length == 0
                    ? Container(
                        width: 100,
                        height: 50,
                      )
                    : Container(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SeeAllTeacherList("Popular Teachers")));
                          },
                          child: Row(
                            children: [
                              Text(
                                'Show All',
                                style: GoogleFonts.lato(
                                    textStyle:
                                        Theme.of(context).textTheme.titleSmall,
                                    letterSpacing: 1.2,
                                    fontSize:
                                        MediaQuery.of(context).size.width < 321
                                            ? 12
                                            : 14,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.arrow_forward,
                                size: 16,
                              ),
                            ],
                          ),
                          style: TextButton.styleFrom(
                            shape: StadiumBorder(),
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            foregroundColor:
                                Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      )
              ],
            ),
          ),
          teacherViewModel.isLoading
              ? Container(
                  height: 200,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : teacherItemlist.length == 0
                  ? Container(
                      height: 150,
                      child: Center(
                        child: Text(
                          "No search record found",
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.titleMedium,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      alignment: Alignment.topLeft,
                      height:
                          MediaQuery.of(context).size.width < 321 ? 260 : 260,
                      child: PageView.builder(
                          scrollDirection: Axis.horizontal,
                          controller: PageController(
                            viewportFraction:
                                MediaQuery.of(context).size.width < 321
                                    ? 0.6
                                    : 0.5,
                          ),
                          padEnds: false,
                          pageSnapping: true,
                          itemCount: teacherItemlist == null
                              ? 0
                              : teacherItemlist.length,
                          physics: PageScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            UserData item = teacherItemlist[index];
                            return Container(
                              margin: EdgeInsets.only(
                                bottom: 25,
                                left: index == 0 ? 10 : 0,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TeacherProfile(item)));
                                },
                                child: Card(
                                  elevation: 5,
                                  shadowColor: Theme.of(context)
                                      .shadowColor
                                      .withOpacity(0.35),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                          width: 1,
                                          color: Colors.grey.withOpacity(0.2))),
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 130,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          width: double.infinity,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Image.network(
                                              '${item.image}',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 10),
                                          width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Text(
                                                '${item.firstname} ${item.lastname}',
                                                overflow: TextOverflow.clip,
                                                maxLines: 1,
                                                style: GoogleFonts.lato(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                '${item.degree_name}',
                                                overflow: TextOverflow.clip,
                                                style: GoogleFonts.lato(
                                                    textStyle: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
                                                    letterSpacing: 1.2,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              SizedBox(height: 5),
                                              RichText(
                                                text: TextSpan(
                                                  style: GoogleFonts.lato(
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodySmall,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .secondary,
                                                      letterSpacing: 1.2,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: 'Experience : ',
                                                    ),
                                                    TextSpan(
                                                        text:
                                                            '${item.noofyears}years',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
        ],
      ),
    );
  }
}
