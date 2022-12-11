import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trackmy_mentor/data/projectdata.dart';
import 'package:trackmy_mentor/model/storage/shared_prefs.dart';
import 'package:trackmy_mentor/ui/project/project_quotationlist.dart';
import 'package:trackmy_mentor/ui/project/projectimage_slider.dart';
import 'package:trackmy_mentor/ui/project/quotation_bottomsheet.dart';
import 'package:trackmy_mentor/ui/project/rating_list.dart';
import 'package:trackmy_mentor/utils/AppUtils.dart';
import 'package:trackmy_mentor/view_model/rating_view_model.dart';

import '../../view_model/project_view_model.dart';

class ProjectDetails extends StatefulWidget {
  ProjectData projectData;

  ProjectDetails(this.projectData);

  @override
  State<StatefulWidget> createState() {
    return ProjectDetailsState();
  }
}

class ProjectDetailsState extends State<ProjectDetails> {
  bool newState = false;

  late ProjectViewModel projectViewModel;
  late RatingViewModel ratingViewModel;

  late ProjectData projectData;
  var isTeacher = SharedPrefs().userdata?.type == "2";

  @override
  void initState() {
    projectData = widget.projectData;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getProjectDetails();
    });
  }

  Future<void> getProjectDetails() async {
    if (await await projectViewModel
        .getProjectDetail(widget.projectData.id.toString())) {
      projectData = projectViewModel.projectData!;
      setState(() {});
    }
  }

  double rating = 0.0;
  TextEditingController reviewTextController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    projectViewModel = context.watch<ProjectViewModel>();
    ratingViewModel = context.watch<RatingViewModel>();

    return Scaffold(
      bottomNavigationBar: projectViewModel.isLoading
          ? null
          : isTeacher &&
                  (projectData.quotationData == null ||
                      projectData.quotationData?.price == null)
              ? Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).shadowColor.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(2, 0),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              isDismissible: false,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return QuotationBottomSheet(projectData,
                                    (status) async {
                                  if (status) {
                                    AppUtils.appToast(
                                        "Quotation Added Successfully!");
                                    await getProjectDetails();
                                  }
                                });
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 20),
                            alignment: Alignment.center,
                          ),
                          child: Text('Add Quotation'),
                        ),
                      )
                    ],
                  ),
                )
              : projectData.quotationData != null &&
                      projectData.quotationData?.price != null
                  ? Container(
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Theme.of(context).shadowColor.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(2, 0),
                          ),
                        ],
                      ),
                      child: SizedBox(
                        child: ListTile(
                          horizontalTitleGap: 5,
                          title: Text(
                            "Quotation by you",
                            style: GoogleFonts.lato(
                              textStyle: Theme.of(context).textTheme.titleSmall,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1.2,
                            ),
                          ),
                          subtitle: Text(
                            projectData.quotationData!.comment!,
                            style: GoogleFonts.lato(
                              textStyle: Theme.of(context).textTheme.titleSmall,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                          ),
                          trailing: Text(
                            '₹ ${projectData.quotationData!.price.toString()}',
                            style: GoogleFonts.lato(
                              textStyle: Theme.of(context).textTheme.titleSmall,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                      ),
                    )
                  : null,
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
        // elevation: 0,
        // scrolledUnderElevation: 0,
        title: Text(projectViewModel.isLoading ? "Please wait" : 'Details'),
        automaticallyImplyLeading: true,
        actions: [],
      ),
      body: projectViewModel.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    color:
                        Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                                elevation: 5,
                                shadowColor: Theme.of(context)
                                    .shadowColor
                                    .withOpacity(0.35),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: BorderSide(
                                        width: 1,
                                        color: Colors.grey.withOpacity(0.2))),
                                child: Container(
                                  width: 74,
                                  height: 74,
                                  padding: EdgeInsets.all(15),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/images/project.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                )),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.projectData!.title!,
                                    overflow: TextOverflow.clip,
                                    style: GoogleFonts.lato(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 1.25),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "${projectData.category_name}"
                                        .toUpperCase(),
                                    overflow: TextOverflow.clip,
                                    style: GoogleFonts.lato(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        letterSpacing: 1.25),
                                  ),
                                  SizedBox(height: 2),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${projectData.class_name}'
                                            .toLowerCase(),
                                        style: GoogleFonts.lato(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 1.25),
                                      ),
                                      Container(
                                        width: 20,
                                        alignment: Alignment.center,
                                        child: Text('|'),
                                      ),
                                      Text(
                                        '${projectData.subject_name}'
                                            .toLowerCase(),
                                        style: GoogleFonts.lato(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 1.25),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Last date :',
                                        style: GoogleFonts.lato(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .labelMedium,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.25),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '${projectData.lastdate}'.toUpperCase(),
                                        style: GoogleFonts.lato(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.25),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                widget.projectData.image == null ||
                        widget.projectData.image!.isEmpty
                    ? Container()
                    : Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        clipBehavior: Clip.none,
                        color: Theme.of(context)
                            .colorScheme
                            .surface
                            .withOpacity(0.2),
                        height: 180,
                        alignment: Alignment.center,
                        child: ProjectImageSlider(
                            widget.projectData.image!.split(",").toList())),
                Container(
                    // decoration: BoxDecoration(
                    //   border: Border(
                    //     bottom: BorderSide(width: 1, color: Theme.of(context).dividerColor),
                    //     top: BorderSide(width: 1, color: Theme.of(context).dividerColor)
                    //   )
                    // ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Theme(
                      data: ThemeData(
                          dividerColor: Colors.transparent,
                          expansionTileTheme: ExpansionTileThemeData(
                              iconColor: Colors.grey.shade800)),
                      child: ExpansionTile(
                        // onExpansionChanged: (val)=>setState(()=>newState=!val),
                        onExpansionChanged: (val) {
                          setState(() {
                            newState = val;
                          });
                        },
                        tilePadding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: newState == true ? 0 : 10),
                        childrenPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        title: Container(
                          child: Text(
                            'Project Description'.toUpperCase(),
                            style: GoogleFonts.lato(
                              textStyle: Theme.of(context).textTheme.titleSmall,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.secondary,
                              letterSpacing: 1.85,
                            ),
                          ),
                        ),
                        subtitle: newState == true
                            ? null
                            : Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  "${projectData.description}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(
                                    textStyle:
                                        Theme.of(context).textTheme.bodySmall,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ),
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${projectData.description}",
                              style: GoogleFonts.lato(
                                textStyle:
                                    Theme.of(context).textTheme.bodySmall,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                !isTeacher ? Container() : Divider(height: 1),
                !isTeacher
                    ? Container()
                    : projectData.teacherRatingData == null ||
                            projectData.teacherRatingData?.rating == null
                        ? Container()
                        : Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            // margin: EdgeInsets.only(bottom: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Card(
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Container(
                                            width: 48,
                                            height: 48,
                                            decoration: BoxDecoration(
                                              color: Colors.grey,
                                            ),
                                            child: Image.network(
                                              projectData
                                                  .teacherRatingData!.image!,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              projectData.teacherRatingData!
                                                  .teacherName!,
                                              style: GoogleFonts.lato(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 1.2,
                                              ),
                                            ),
                                            SizedBox(height: 3),
                                            Text(
                                              projectData.teacherRatingData!
                                                      .comment ??
                                                  "",
                                              style: GoogleFonts.lato(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .labelSmall,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(height: 7),
                                            RatingBarIndicator(
                                              rating: double.parse(projectData
                                                      .teacherRatingData!
                                                      .rating ??
                                                  "0.0"),
                                              itemBuilder: (context, index) =>
                                                  Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              itemCount: 5,
                                              itemSize: 16,
                                              direction: Axis.horizontal,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                Divider(height: 1),
                isTeacher
                    ? Container()
                    : projectData.email != SharedPrefs().userdata!.email
                        ? Container()
                        : Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Quotation Received'.toUpperCase(),
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
                                      Text(
                                        'What others have quoted for the project',
                                        style: GoogleFonts.lato(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.85,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(bottom: 15),
                                    child: Column(
                                      children: [
                                        ProjectQuotationList(
                                            widget.projectData),
                                      ],
                                    )),
                              ],
                            ),
                          ),
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
                                  textStyle:
                                      Theme.of(context).textTheme.titleSmall,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  letterSpacing: 1.85,
                                ),
                              ),
                              !isTeacher
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
                      !isTeacher
                          ? Container()
                          : projectData.teacherRatingData != null &&
                                  projectData.teacherRatingData?.rating != null
                              ? Container()
                              : Container(
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
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium,
                                                  fontWeight: FontWeight.w600,
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
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .outline),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Theme.of(context)
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
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  ratingViewModel.isLoading
                                                      ? Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 200),
                                                          child:
                                                              CircularProgressIndicator())
                                                      : Expanded(
                                                          child: ElevatedButton(
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
                                                              bool status = await ratingViewModel.addRating(
                                                                  teacher_id: SharedPrefs()
                                                                      .userdata!
                                                                      .id!
                                                                      .toString(),
                                                                  project_id:
                                                                      projectData
                                                                          .id
                                                                          .toString(),
                                                                  rating: rating
                                                                      .toString(),
                                                                  comment:
                                                                      reviewTextController
                                                                          .text);
                                                              if (status) {
                                                                AppUtils.appToast(
                                                                    "Rating and Review added successfully");
                                                                getProjectDetails();
                                                              } else {
                                                                AppUtils.appToast(
                                                                    "Failed to add rating and review");
                                                              }
                                                            },
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          15,
                                                                      vertical:
                                                                          20),
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                            ),
                                                            child:
                                                                Text('Submit'),
                                                          ),
                                                        ),
                                                ],
                                              ))
                                            ],
                                          )),
                                    ],
                                  )),
                      !isTeacher ? Container() : Divider(),
                      RatingList(projectData.id.toString()),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
