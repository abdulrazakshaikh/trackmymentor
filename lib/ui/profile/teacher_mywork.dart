import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trackmy_mentor/data/projectdata.dart';
import 'package:trackmy_mentor/ui/homepage/gigs_item.dart';
import 'package:trackmy_mentor/view_model/project_view_model.dart';

import '../see_all_project_list.dart';

class TeacherMyWork extends StatefulWidget {
  String email;

  TeacherMyWork(this.email);

  @override
  _TeacherMyWorkState createState() => new _TeacherMyWorkState();
}

class _TeacherMyWorkState extends State<TeacherMyWork> {
  List<ProjectData> projectItemList = [];
  late ProjectViewModel projectViewModel;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await projectViewModel.getProjectListByTeacher(
          teacheremail: widget.email);
      projectItemList = projectViewModel.listData;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    projectViewModel = context.watch<ProjectViewModel>();

    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Text(
                  'My Work',
                  style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.titleMedium,
                      letterSpacing: 1.5,
                      fontSize:
                          MediaQuery.of(context).size.width < 321 ? 14 : 16,
                      fontWeight: FontWeight.w900),
                )),
                projectViewModel.isLoading || projectItemList.length == 0
                    ? Container(
                        width: 100,
                        height: 50,
                      )
                    : projectItemList.length > 10
                        ? Container(
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SeeAllProjectList(
                                              "My Work",
                                              category_id: widget.email,
                                            )));
                              },
                              child: Row(
                                children: [
                                  Text(
                          'Show All',
                          style: GoogleFonts.lato(
                              textStyle: Theme.of(context).textTheme.titleSmall,
                              letterSpacing: 1.2,
                              fontSize: MediaQuery.of(context).size.width < 321
                                  ? 12
                                  : 13,
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.w600),
                        ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 14,
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
                        : Container()
              ],
            ),
          ),
          projectViewModel.isLoading
              ? Container(
                  height: 200,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : projectItemList.length == 0
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
                            viewportFraction: 0.85,
                          ),
                          padEnds: false,
                          pageSnapping: true,
                          itemCount: projectItemList == null
                              ? 0
                              : projectItemList.length,
                          physics: PageScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            ProjectData item = projectItemList[index];
                            return GigsItem(
                              value: item,
                            );
                          }),
          ),

        ],
      ),
    );
  }



}