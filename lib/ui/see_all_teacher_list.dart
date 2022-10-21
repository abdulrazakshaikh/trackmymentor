import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trackmy_mentor/data/userdata.dart';
import 'package:trackmy_mentor/ui/profile/teacherprofile.dart';

import '../model/services/app_url.dart';
import '../view_model/teacher_view_model.dart';

class SeeAllTeacherList extends StatefulWidget {
  String title;

  SeeAllTeacherList(this.title);

  @override
  State<StatefulWidget> createState() {
    return SeeAllTeacherListState();
  }
}

class SeeAllTeacherListState extends State<SeeAllTeacherList> {
  List<UserData> teacherItemlist = [];
  late TeacherViewModel teacherViewModel;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await teacherViewModel.getTeachers();
      teacherItemlist = teacherViewModel.listData;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    teacherViewModel = context.watch<TeacherViewModel>();
    return Scaffold(
      //bottomNavigationBar: BottomNavigation(),
      appBar: AppBar(
        title: Text(widget.title.toUpperCase()),
        actions: [],
      ),
      body: Center(
        child: teacherViewModel.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : teacherItemlist.length == 0
                ? Center(
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
                  )
                : ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: ListView.builder(
                            primary: false,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: teacherItemlist == null
                                ? 0
                                : teacherItemlist.length,
                            itemBuilder: (BuildContext context, int index) {
                              UserData item = teacherItemlist[index];
                              return Container(
                                margin: EdgeInsets.only(
                                    bottom: 0, left: 10, right: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TeacherProfile()));
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
                                            color:
                                                Colors.grey.withOpacity(0.2))),
                                    child: Padding(
                                      padding: EdgeInsets.all(0),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            height: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            width: 100,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Image.network(
                                                '${AppUrl.image_baseUrl}${item.image}',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
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
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .titleMedium,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    '${item.degree}',
                                                    overflow: TextOverflow.clip,
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
                                                  ),
                                                  SizedBox(height: 5),
                                                  RichText(
                                                    text: TextSpan(
                                                      style: GoogleFonts.lato(
                                                          textStyle:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodySmall,
                                                          color:
                                                              Theme.of(context)
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
      ),
    );
  }
}
