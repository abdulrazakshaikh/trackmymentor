import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trackmy_mentor/data/userdata.dart';
import 'package:trackmy_mentor/ui/profile/teacher_categoryworked.dart';
import 'package:trackmy_mentor/ui/profile/teacher_mywork.dart';

import '../../model/storage/shared_prefs.dart';
import '../../utils/AppUtils.dart';
import '../../view_model/rating_view_model.dart';
import '../../view_model/teacher_view_model.dart';
import '../project/rating_list.dart';

class TeacherProfile extends StatefulWidget {
  UserData userData;

  TeacherProfile(this.userData);

  @override
  State<TeacherProfile> createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {
  late TeacherViewModel teacherViewModel;
  late UserData teacherData;
  late RatingViewModel ratingViewModel;
  double rating = 0.0;
  TextEditingController reviewTextController = new TextEditingController();

  @override
  void initState() {
    teacherData = widget.userData;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getTeacherDetails();
    });
  }

  Future<void> getTeacherDetails() async {
    if (await teacherViewModel
        .getTeacherDetail(widget.userData.email.toString())) {
      teacherData = teacherViewModel.teacherData!;
      print("teacherData.student_ratingto_teacher");
      print(teacherData.student_ratingto_teacher);
      setState(() {});
    }
  }

  var isStudent = SharedPrefs().userdata?.type == "1";

  @override
  Widget build(BuildContext context) {
    ratingViewModel = context.watch<RatingViewModel>();
    teacherViewModel = context.watch<TeacherViewModel>();
    return teacherViewModel.isLoading
        ? Scaffold(
            appBar: AppBar(title: Text("Please wait...")),
            body: Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          )
        : Scaffold(
            body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: false,
                expandedHeight: 190,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )),
                // backgroundColor: Theme.of(context).colorScheme.secondary,
                backgroundColor: Theme.of(context).colorScheme.primary,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(top: 50),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          // color: Theme.of(context).colorScheme.secondary,
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          )),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              width: 84,
                              height: 84,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey,
                              ),
                              child: Image.network(
                                '${widget.userData.image}',
                                fit: BoxFit.cover,
                              ),
                            ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '${widget.userData.firstname} ${widget.userData.lastname}',
                                style: GoogleFonts.lato(
                                  textStyle:
                                      Theme.of(context).textTheme.titleLarge,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1.2,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                child: Text(
                                  "${teacherData.degree_name}",
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
                              SizedBox(height: 10),
                              RatingBarIndicator(
                                rating: teacherData.overallrating == null ||
                                        teacherData.overallrating == "null"
                                    ? 0.0
                                    : double.parse(teacherData.overallrating!),
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 18,
                                direction: Axis.horizontal,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.message),
                                      style: IconButton.styleFrom(
                                          fixedSize: Size(42, 42),
                                          // foregroundColor: Theme.of(context).colorScheme.onTertiary,
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .tertiary),
                                    ),
                                    SizedBox(width: 10),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.phone),
                                      style: IconButton.styleFrom(
                                          fixedSize: Size(42, 42),
                                          // foregroundColor: Theme.of(context).colorScheme.onTertiary,
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .tertiary),
                                    ),
                                    SizedBox(width: 10),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.email),
                                      style: IconButton.styleFrom(
                                          fixedSize: Size(42, 42),
                                          // foregroundColor: Theme.of(context).colorScheme.onTertiary,
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .tertiary),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: [
                    Container(
                      child: TeacherMyWork(teacherData.email.toString()),
                    ),

                    Container(
                      margin: EdgeInsets.only(
                        bottom: 25,
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Text(
                                  'About ${teacherData.firstname} ${teacherData.lastname}',
                                  style: GoogleFonts.lato(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                      letterSpacing: 1.5,
                                      fontSize:
                                          MediaQuery.of(context).size.width <
                                                  321
                                              ? 14
                                              : 16,
                                      fontWeight: FontWeight.w900),
                                )),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                teacherData.description == null ||
                                        teacherData.description!.isEmpty
                                    ? "No description"
                                    : "${teacherData.description}",
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.lato(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyMedium,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                    // Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                    // Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                    // Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                    // Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),

                    Container(child: TeacherCategoryWorked()),
                    Divider(height: 1),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Rating & Review'.toUpperCase(),
                                    style: GoogleFonts.lato(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      letterSpacing: 1.85,
                                    ),
                                  ),
                                  !isStudent
                                      ? Container()
                                      : Text(
                                          'Tell others what you think',
                                          style: GoogleFonts.lato(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.85,
                                          ),
                                        ),
                                ],
                              )),
                          !isStudent
                              ? Container()
                              : teacherData.student_ratingto_teacher == null ||
                                      teacherData.student_ratingto_teacher
                                              .toString()
                                              .trim() ==
                                          "null"
                                  ? Container(
                                      margin: EdgeInsets.only(bottom: 15),
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RatingBar.builder(
                                            initialRating: 0,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: false,
                                            itemCount: 5,
                                            itemSize: 32,
                                            wrapAlignment:
                                                WrapAlignment.spaceBetween,
                                            itemPadding:
                                                EdgeInsets.only(right: 15.0),
                                            itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                color: Colors.amber),
                                            onRatingUpdate: (rating) {
                                              this.rating = rating;
                                              //print(rating);
                                            },
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: Column(
                                                children: [
                                                  TextFormField(
                                                    controller:
                                                        reviewTextController,
                                                    style: GoogleFonts.lato(
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodyMedium,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      letterSpacing: 1.2,
                                                    ),
                                                    maxLines: 3,
                                                    maxLength: 300,
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.all(15),
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .auto,
                                                      hintText:
                                                          'Describe your experience'
                                                              .toLowerCase(),
                                                      hintStyle: GoogleFonts.lato(
                                                          textStyle:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .labelMedium,
                                                          letterSpacing: 1.8,
                                                          fontWeight:
                                                              FontWeight.w300),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .outline),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .primary,
                                                            width: 1),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Container(
                                                      child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      ratingViewModel.isLoading
                                                          ? Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          200),
                                                              child:
                                                                  CircularProgressIndicator())
                                                          : Expanded(
                                                              child:
                                                                  ElevatedButton(
                                                                onPressed:
                                                                    () async {
                                                                  if (rating ==
                                                                      0.0) {
                                                                    AppUtils.appToast(
                                                                        "Please give rating");
                                                                    return;
                                                                  }
                                                                  if (reviewTextController
                                                                      .text
                                                                      .isEmpty) {
                                                                    AppUtils.appToast(
                                                                        "Please give review");
                                                                    return;
                                                                  }
                                                                  bool status = await ratingViewModel.addTeacherRating(
                                                                      student_id: SharedPrefs()
                                                                          .userdata!
                                                                          .email!
                                                                          .toString(),
                                                                      teacher_id: teacherData
                                                                          .email
                                                                          .toString(),
                                                                      rating: rating
                                                                          .toString(),
                                                                      comment:
                                                                          reviewTextController
                                                                              .text);
                                                                  if (status) {
                                                                    AppUtils.appToast(
                                                                        "Rating and Review added successfully");
                                                                    getTeacherDetails();
                                                                  } else {
                                                                    AppUtils.appToast(
                                                                        "Failed to add rating and review");
                                                                  }
                                                                },
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  padding: EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          15,
                                                                      vertical:
                                                                          20),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                ),
                                                                child: Text(
                                                                    'Submit'),
                                                              ),
                                                            ),
                                                    ],
                                                  ))
                                                ],
                                              )),
                                        ],
                                      ))
                                  : Container(),
                          !isStudent ? Container() : Divider(),
                          RatingList("${teacherData.email}",
                              ratingFor: "teacher"),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ));
  }
}
