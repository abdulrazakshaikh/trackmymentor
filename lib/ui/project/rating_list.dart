import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../data/TeacherRatingData.dart';
import '../../view_model/rating_view_model.dart';

class RatingList extends StatefulWidget {
  String id;
  String ratingFor;

  RatingList(this.id, {this.ratingFor = "project"});

  @override
  State<StatefulWidget> createState() {
    return RatingListState();
  }
}

class RatingListState extends State<RatingList> {
  late RatingViewModel ratingViewModel;
  List<TeacherRatingData> teacherRatingList = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.ratingFor == "project") {
        await ratingViewModel.getRatingList(project_id: widget.id.toString());
      } else {
        await ratingViewModel.getRatingForTeacherList(
            teacherEmail: widget.id.toString());
      }
      teacherRatingList = ratingViewModel.listData;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    ratingViewModel = context.watch<RatingViewModel>();
    return ratingViewModel.isLoading
        ? Container(
            margin: EdgeInsets.only(left: 300),
            child: CircularProgressIndicator())
        : teacherRatingList.length == 0
            ? Container(
                margin: EdgeInsets.only(bottom: 20, top: 5, left: 5),
                child: Text("No review yet added"),
              )
            : Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListView.separated(
                    primary: false,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: teacherRatingList == null
                        ? 0
                        : teacherRatingList.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 10);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      TeacherRatingData item = teacherRatingList[index];
                      return Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Container(
                                        width: 32,
                                        height: 32,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                        ),
                                        child: Image.network(
                                          '${item.image}',
                                          fit: BoxFit.cover,
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
                                          '${item.teacherName}',
                                          style: GoogleFonts.lato(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.2,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            RatingBarIndicator(
                                              rating: double.parse(
                                                  item.rating.toString()),
                                              itemBuilder: (context, index) =>
                                                  Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              itemCount: 5,
                                              itemSize: 16,
                                              direction: Axis.horizontal,
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 20),
                                              child: Text(
                                                '${item.created_date}',
                                                style: GoogleFonts.lato(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 1.2,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '${item.comment}',
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 10,
                                  style: GoogleFonts.lato(
                                    textStyle:
                                        Theme.of(context).textTheme.titleSmall,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              );
  }
}
