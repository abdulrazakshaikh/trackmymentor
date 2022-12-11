import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trackmy_mentor/model/storage/shared_prefs.dart';
import 'package:trackmy_mentor/ui/common_widgets/description_bottomsheet.dart';
import 'package:trackmy_mentor/ui/profile/userprofile_edit.dart';

import '../../data/helperdata.dart';
import '../../model/services/app_url.dart';
import '../common_widgets/helper_multiple_selection_bottomsheet.dart';
import '../common_widgets/helper_single_selection_bottomsheet.dart';

class UserProfile extends StatefulWidget {
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  List myaccountmenuList = [
    {
      "id": "001",
      "title": "Report",
      "icon": Icons.report_outlined,
    },
    {
      "id": "002",
      "title": "Refer & Earn",
      "icon": Icons.share_outlined,
    },
    {
      "id": "003",
      "title": "Privacy",
      "icon": Icons.privacy_tip_outlined,
    },
    {
      "id": "005",
      "title": "Apply Overseas",
      "icon": Icons.app_registration,
    },
    {
      "id": "004",
      "title": "Logout",
      "icon": Icons.logout,
    },
  ];
  var isStudent = SharedPrefs().userdata!.type == "1";
  List<HelperData>? selectedLa;

  @override
  Widget build(BuildContext context) {
    print(SharedPrefs().userdata!.toJson());
    return Scaffold(
        //bottomNavigationBar: BottomNavigation(),
        // appBar: AppBar(
        //   title: Text('Profile'.toUpperCase()),
        //   actions: [],
        // ),
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )),
          title: Text('Profile'.toUpperCase()),
          titleTextStyle: Theme.of(context)
              .appBarTheme
              .titleTextStyle!
              .merge(TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
          actions: [
            true
                ? Container()
                : Container(
                    padding: EdgeInsets.all(10),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    UserProfileEdit()));
                      },
                      icon: Icon(Icons.mode_edit_outlined),
                      style: IconButton.styleFrom(
                        fixedSize: Size(40, 44),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        // backgroundColor: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  )
          ],
          expandedHeight: 230,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            background: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              padding: EdgeInsets.only(top: 54),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Stack(children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                "${SharedPrefs().userdata!.image ?? "https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg"}"),
                            radius: 54,
                          ),
                          Positioned(
                            right: 4,
                            bottom: 4,
                            child: ClipOval(
                              child: Material(
                                color: Theme.of(context)
                                    .colorScheme
                                    .tertiary, // Button color
                                child: InkWell(
                                  splashColor: Theme.of(context)
                                      .colorScheme
                                      .secondary, // Splash color
                                  onTap: () async {
                                    bool a = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                UserProfileEdit()));
                                    print(a);
                                    if (a != null) {
                                      setState(() {});
                                    }
                                  },
                                  child: SizedBox(
                                      width: 32,
                                      height: 32,
                                      child: Icon(
                                        Icons.edit_outlined,
                                        size: 20,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                            ),
                          )
                        ]),
                        Container(
                          margin: EdgeInsets.only(bottom: 3, top: 10),
                          child: Text(
                            '${SharedPrefs().userdata!.firstname} ${SharedPrefs().userdata!.lastname}',
                            style: GoogleFonts.lato(
                                textStyle: Theme.of(context)
                                    .appBarTheme
                                    .titleTextStyle,
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 18,
                                letterSpacing: 1.5),
                          ),
                        ),
                        Container(
                          child: Text(
                            isStudent
                                ? "Student".toUpperCase()
                                : "Teacher".toUpperCase(),
                            style: GoogleFonts.lato(
                                textStyle: Theme.of(context)
                                    .appBarTheme
                                    .titleTextStyle,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimary
                                    .withOpacity(0.8),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Card(
                elevation: 4,
                shadowColor: Theme.of(context).shadowColor.withOpacity(0.4),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      ListTile(
                        dense: true,
                        leading: Icon(Icons.phone_outlined),
                        horizontalTitleGap: 0,
                        title: Text(
                          '+91 ${SharedPrefs().userdata!.mobile}',
                          style: GoogleFonts.lato(
                              textStyle:
                                  Theme.of(context).textTheme.titleMedium,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Divider(),
                      ListTile(
                        dense: true,
                        leading: Icon(Icons.email_outlined),
                        horizontalTitleGap: 0,
                        title: Text(
                          '${SharedPrefs().userdata!.email}',
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.lato(
                              textStyle:
                                  Theme.of(context).textTheme.titleMedium,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      isStudent
                          ? Container()
                          : Column(
                              children: [
                                Divider(),
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 10),
                                              width: double.infinity,
                                              child: Text(
                                                'Description'.toUpperCase(),
                                                style: GoogleFonts.lato(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall,
                                                  fontWeight: FontWeight.w900,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                child: (SharedPrefs()
                                                                .userdata!
                                                                .description ==
                                                            null ||
                                                        SharedPrefs()
                                                            .userdata!
                                                            .description!
                                                            .isEmpty)
                                                    ? Text(
                                                        "add about you",
                                                        maxLines: 4,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: GoogleFonts.lato(
                                                          textStyle:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary,
                                                        ),
                                                      )
                                                    : Text(
                                                        "${SharedPrefs().userdata!.description}",
                                                        maxLines: 4,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: GoogleFonts.lato(
                                                          textStyle:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                            elevation: 2,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                              ),
                                            ),
                                            context: context,
                                            builder: (BuildContext context) {
                                              return DescriptionBottomSheet(
                                                  SharedPrefs()
                                                      .userdata!
                                                      .description,
                                                  (selectedCat) {
                                                setState(() {
                                                  var user =
                                                      SharedPrefs().userdata!;
                                                  user.description =
                                                      selectedCat;
                                                  SharedPrefs().userdata = user;
                                                  setState(() {});
                                                  // selectedClass = selectedCat;
                                                });
                                              });
                                            },
                                          );
                                        },
                                        child: Icon(
                                          Icons.edit,
                                          size: 25,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Divider(),
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 10),
                                              width: double.infinity,
                                              child: Text(
                                                'Language'.toUpperCase(),
                                                style: GoogleFonts.lato(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall,
                                                  fontWeight: FontWeight.w900,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                child: (SharedPrefs()
                                                                .userdata!
                                                                .language_name ==
                                                            null ||
                                                        SharedPrefs()
                                                            .userdata!
                                                            .language_name!
                                                            .isEmpty)
                                                    ? Text(
                                                        "N/A",
                                                        maxLines: 4,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: GoogleFonts.lato(
                                                          textStyle:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary,
                                                        ),
                                                      )
                                                    : Text(
                                                        "${SharedPrefs().userdata!.language_name}",
                                                        maxLines: 4,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: GoogleFonts.lato(
                                                          textStyle:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          selectedLa = [];
                                          SharedPrefs()
                                              .userdata!
                                              .language!
                                              .split(",")
                                              .toList()
                                              .forEach((element) {
                                            selectedLa!
                                                .add(HelperData(id: element));
                                          });
                                          onTapOfEdit(context, AppUrl.language);
                                        },
                                        child: Icon(
                                          Icons.edit,
                                          size: 25,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Divider(),
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 10),
                                              width: double.infinity,
                                              child: Text(
                                                'Course'.toUpperCase(),
                                                style: GoogleFonts.lato(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall,
                                                  fontWeight: FontWeight.w900,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                child: (SharedPrefs()
                                                                .userdata!
                                                                .course_name ==
                                                            null ||
                                                        SharedPrefs()
                                                            .userdata!
                                                            .course_name!
                                                            .isEmpty)
                                                    ? Text(
                                                        "NA",
                                                        maxLines: 4,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: GoogleFonts.lato(
                                                          textStyle:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary,
                                                        ),
                                                      )
                                                    : Text(
                                                        "${SharedPrefs().userdata!.course_name}",
                                                        maxLines: 4,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: GoogleFonts.lato(
                                                          textStyle:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          selectedLa = [];
                                          SharedPrefs()
                                              .userdata!
                                              .courses!
                                              .split(",")
                                              .toList()
                                              .forEach((element) {
                                            selectedLa!
                                                .add(HelperData(id: element));
                                          });
                                          onTapOfEdit(context, AppUrl.courses);
                                        },
                                        child: Icon(
                                          Icons.edit,
                                          size: 25,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Divider(),
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 10),
                                              width: double.infinity,
                                              child: Text(
                                                'Degree'.toUpperCase(),
                                                style: GoogleFonts.lato(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall,
                                                  fontWeight: FontWeight.w900,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                child: (SharedPrefs()
                                                                .userdata!
                                                                .degree_name ==
                                                            null ||
                                                        SharedPrefs()
                                                            .userdata!
                                                            .degree_name!
                                                            .isEmpty)
                                                    ? Text(
                                                        "NA",
                                                        maxLines: 4,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: GoogleFonts.lato(
                                                          textStyle:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary,
                                                        ),
                                                      )
                                                    : Text(
                                                        "${SharedPrefs().userdata!.degree_name}",
                                                        maxLines: 4,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: GoogleFonts.lato(
                                                          textStyle:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          onTapSingleOfEdit(
                                              context,
                                              AppUrl.degree,
                                              SharedPrefs().userdata!.degree!);
                                        },
                                        child: Icon(
                                          Icons.edit,
                                          size: 25,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Divider(),
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 10),
                                              width: double.infinity,
                                              child: Text(
                                                'Categories'.toUpperCase(),
                                                style: GoogleFonts.lato(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall,
                                                  fontWeight: FontWeight.w900,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                child: (SharedPrefs()
                                                                .userdata!
                                                                .category_name ==
                                                            null ||
                                                        SharedPrefs()
                                                            .userdata!
                                                            .category_name!
                                                            .isEmpty)
                                                    ? Text(
                                                        "NA",
                                                        maxLines: 4,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: GoogleFonts.lato(
                                                          textStyle:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary,
                                                        ),
                                                      )
                                                    : Text(
                                                        "${SharedPrefs().userdata!.category_name}",
                                                        maxLines: 4,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: GoogleFonts.lato(
                                                          textStyle:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          selectedLa = [];
                                          SharedPrefs()
                                              .userdata!
                                              .category!
                                              .split(",")
                                              .toList()
                                              .forEach((element) {
                                            selectedLa!
                                                .add(HelperData(id: element));
                                          });
                                          onTapOfEdit(context, AppUrl.category);
                                        },
                                        child: Icon(
                                          Icons.edit,
                                          size: 25,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Divider(),
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 10),
                                              width: double.infinity,
                                              child: Text(
                                                'Class'.toUpperCase(),
                                                style: GoogleFonts.lato(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall,
                                                  fontWeight: FontWeight.w900,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                child: (SharedPrefs()
                                                                .userdata!
                                                                .class_name ==
                                                            null ||
                                                        SharedPrefs()
                                                            .userdata!
                                                            .class_name!
                                                            .isEmpty)
                                                    ? Text(
                                                        "NA",
                                                        maxLines: 4,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: GoogleFonts.lato(
                                                          textStyle:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary,
                                                        ),
                                                      )
                                                    : Text(
                                                        "${SharedPrefs().userdata!.class_name}",
                                                        maxLines: 4,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: GoogleFonts.lato(
                                                          textStyle:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          selectedLa = [];
                                          SharedPrefs()
                                              .userdata!
                                              .class1!
                                              .split(",")
                                              .toList()
                                              .forEach((element) {
                                            selectedLa!
                                                .add(HelperData(id: element));
                                          });
                                          onTapOfEdit(context, AppUrl.classes);
                                        },
                                        child: Icon(
                                          Icons.edit,
                                          size: 25,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Divider(),
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 10),
                                              width: double.infinity,
                                              child: Text(
                                                'Subject'.toUpperCase(),
                                                style: GoogleFonts.lato(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall,
                                                  fontWeight: FontWeight.w900,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                child: (SharedPrefs()
                                                                .userdata!
                                                                .subject_name ==
                                                            null ||
                                                        SharedPrefs()
                                                            .userdata!
                                                            .subject_name!
                                                            .isEmpty)
                                                    ? Text(
                                                        "NA",
                                                        maxLines: 4,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: GoogleFonts.lato(
                                                          textStyle:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary,
                                                        ),
                                                      )
                                                    : Text(
                                                        "${SharedPrefs().userdata!.subject_name}",
                                                        maxLines: 4,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: GoogleFonts.lato(
                                                          textStyle:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          selectedLa = [];
                                          SharedPrefs()
                                              .userdata!
                                              .subject!
                                              .split(",")
                                              .toList()
                                              .forEach((element) {
                                            selectedLa!
                                                .add(HelperData(id: element));
                                          });
                                          onTapOfEdit(context, AppUrl.subject);
                                        },
                                        child: Icon(
                                          Icons.edit,
                                          size: 25,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Divider(),
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 10),
                                              width: double.infinity,
                                              child: Text(
                                                'Year of Experience'
                                                    .toUpperCase(),
                                                style: GoogleFonts.lato(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall,
                                                  fontWeight: FontWeight.w900,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                child: (SharedPrefs()
                                                                .userdata!
                                                                .noofyears ==
                                                            null ||
                                                        SharedPrefs()
                                                            .userdata!
                                                            .noofyears!
                                                            .isEmpty)
                                                    ? Text(
                                                        "NA",
                                                        maxLines: 4,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: GoogleFonts.lato(
                                                          textStyle:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary,
                                                        ),
                                                      )
                                                    : Text(
                                                        "${SharedPrefs().userdata!.noofyears}",
                                                        maxLines: 4,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: GoogleFonts.lato(
                                                          textStyle:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          onTapSingleOfEdit(
                                              context,
                                              "Experience",
                                              SharedPrefs()
                                                  .userdata!
                                                  .noofyears!);
                                        },
                                        child: Icon(
                                          Icons.edit,
                                          size: 25,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                    ],
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                      child: Text(
                        'Setting'.toUpperCase(),
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.bodySmall,
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).colorScheme.secondary,
                          letterSpacing: 2.5,
                        ),
                      ),
                    ),
                    ListView.separated(
                      primary: false,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: myaccountmenuList == null
                          ? 0
                          : myaccountmenuList.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 5,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        Map item = myaccountmenuList[index];
                        return Card(
                          elevation: 3,
                          shadowColor:
                              Theme.of(context).shadowColor.withOpacity(0.4),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                  width: 1,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .outline
                                      .withOpacity(0.1))),
                          child: ListTile(
                            horizontalTitleGap: 0,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            leading: Icon(item["icon"]),
                            title: Text(
                              '${item["title"]}',
                              style: GoogleFonts.lato(
                                textStyle:
                                    Theme.of(context).textTheme.titleSmall,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                              ),
                            ),
                            trailing: Icon(
                              Icons.chevron_right,
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.6),
                            ),
                            onTap: () {
                              if (item['id'] == "004") {
                                SharedPrefs().logout();
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              // Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
              // Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
              // Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
              // Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
              // Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
              // Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
            ],
          ),
        )),
      ],
    ));
  }

  void onTapOfEdit(BuildContext context, String type) {
    showModalBottomSheet(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return HelperMultipleSelectionBottomSheet(
          type,
          selectedLa!,
          (selectedItem) {
            selectedLa = selectedItem as List<HelperData>;
            String id = "";
            String name = "";
            selectedLa!.forEach((element) {
              if (id.isEmpty) {
                id = element.id!;
                name = element.name!;
              } else {
                id += "," + element.id!;
                name += "," + element.name!;
              }
            });
            var user = SharedPrefs().userdata!;
            if (type == AppUrl.courses) {
              user.courses = id;
              user.course_name = name;
            } else if (type == AppUrl.language) {
              user.language = id;
              user.language_name = name;
            } else if (type == AppUrl.category) {
              user.category = id;
              user.category_name = name;
            } else if (type == AppUrl.classes) {
              user.class1 = id;
              user.class_name = name;
            } else if (type == AppUrl.subject) {
              user.subject = id;
              user.subject_name = name;
            }
            SharedPrefs().userdata = user;
            setState(() {});
          },
          apiCallRequired: true,
        );
      },
    );
  }

  void onTapSingleOfEdit(BuildContext context, String type, String id) {
    showModalBottomSheet(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return HelperSingleSelectionBottomSheet(
          type,
          HelperData(id: id),
          (selectedItem) {
            var user = SharedPrefs().userdata!;
            if (type == AppUrl.degree) {
              user.degree = selectedItem.id;
              user.degree_name = selectedItem.name;
            } else if (type == "Experience") {
              print(selectedItem.id);
              user.noofyears = selectedItem.id;
              user.degree_name = user.degree_name.toString();
              print("scvsdlnvsdjvndsvnsdjv");
            }
            SharedPrefs().userdata = user;
            setState(() {});
          },
          apiCallRequired: true,
        );
      },
    );
  }
}
