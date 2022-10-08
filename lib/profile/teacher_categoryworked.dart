import 'dart:ui';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class TeacherCategoryWorked extends StatefulWidget {
  @override
  _TeacherCategoryWorkedState createState() => new _TeacherCategoryWorkedState();
}

class _TeacherCategoryWorkedState extends State<TeacherCategoryWorked> {

List carouselitemlist = [
  {
    "id": "001",
    "title" : "Tutor",
    "img": "assets/images/tutor.png",
  },
  {
    "id": "002",
    "title" : "Projects",
    "img": "assets/images/project.png",
  },
  {
    "id": "003",
    "title" : "Activity",
    "img": "assets/images/activity.png",
  },
  {
    "id": "004",
    "title" : "Coach",
    "img": "assets/images/coach.png",
  },
  {
    "id": "005",
    "title" : "Charts",
    "img": "assets/images/chart.png",
  },
  {
    "id": "006",
    "title" : "Models",
    "img": "assets/images/model.png",
  },
  {
    "id": "007",
    "title" : "Sports",
    "img": "assets/images/sports.png",
  },
  {
    "id": "008",
    "title" : "Assignments",
    "img": "assets/images/assignment.png",
  },
];

  @override
  Widget build(BuildContext context) {
  
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
                child: Text('Worked on Categories',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.titleMedium,
                    letterSpacing: 1.5,
                    fontSize: MediaQuery.of(context).size.width < 321 ? 14 : 16,
                    fontWeight: FontWeight.w900
                  ),
                )
              ),
            ],
          ),
        ),


            Container(
            alignment: Alignment.topLeft,
            height: 120,
            child: PageView.builder(
                scrollDirection: Axis.horizontal,    
                controller: PageController(viewportFraction: MediaQuery.of(context).size.width < 321 ? 0.35 : 0.3,), 
                padEnds: false,
                pageSnapping: true,
                itemCount: carouselitemlist == null ? 0 : carouselitemlist.length,
                physics: PageScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  Map item = carouselitemlist[index];
                  return Container(
                  margin: EdgeInsets.only(bottom: 25, left: index==0 ? 10 : 0,), 
                  child: GestureDetector(
                    onTap: () {},
                      child: Card(
                        elevation: 5,
                        shadowColor: Theme.of(context).shadowColor.withOpacity(0.35),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(width: 1, color: Colors.grey.withOpacity(0.2))
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset('${item["img"]}',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),    
                  );
                }
              
          ),  
        ),
         
      ],
    ),
  );
  }



}