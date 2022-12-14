import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../project/project_details.dart';
import '../see_all_project_list.dart';

class TeacherMyWork extends StatefulWidget {
  @override
  _TeacherMyWorkState createState() => new _TeacherMyWorkState();
}

class _TeacherMyWorkState extends State<TeacherMyWork> {
  List carouselitemlist = [
    {
      "id": "001",
    "title" : "Lorem Ipsum",
    "category": "Categrory",
    "img": "assets/images/bg1.jpg",
    "rating": 3.5,
  },
  {
    "id": "002",
    "title" : "Lorem Ipsum",
    "category": "Categrory",
    "img": "assets/images/bg1.jpg",
    "rating": 3.5,
  },
  {
    "id": "003",
    "title" : "Lorem Ipsum",
    "category": "Categrory",
    "img": "assets/images/bg1.jpg",
    "rating": 3.5,
  },
  {
    "id": "004",
    "title" : "Lorem Ipsum",
    "category": "Categrory",
    "img": "assets/images/bg1.jpg",
    "rating": 3.5,
  },
  {
    "id": "005",
    "title" : "Lorem Ipsum",
    "category": "Categrory",
    "img": "assets/images/bg1.jpg",
    "rating": 3.5,
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
                child: Text('My Work',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.titleMedium,
                    letterSpacing: 1.5,
                    fontSize: MediaQuery.of(context).size.width < 321 ? 14 : 16,
                    fontWeight: FontWeight.w900
                  ),
                )
              ),
              Container(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SeeAllProjectList("My Work")));
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
                      Icon(Icons.arrow_forward, size: 14,), 
                    ],
                  ),
                  style: TextButton.styleFrom(
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    foregroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                ),


              )
            ],
          ),
        ),


            Container(
                alignment: Alignment.topLeft,
                height: MediaQuery.of(context).size.width < 321 ?  260 : 260,
                child: PageView.builder(
                scrollDirection: Axis.horizontal,    
                controller: PageController(viewportFraction: 0.85,), 
                padEnds: false,
                pageSnapping: true,
                itemCount: carouselitemlist == null ? 0 : carouselitemlist.length,
                physics: PageScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  Map item = carouselitemlist[index];
                  return Container(
                  margin: EdgeInsets.only(bottom: 25, left: index==0 ? 10 : 0,), 
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ProjectDetails('${item["title"]}')));
                      },
                      child: Card(
                        elevation: 5,
                        shadowColor:
                            Theme.of(context).shadowColor.withOpacity(0.35),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                                width: 1, color: Colors.grey.withOpacity(0.2))),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                          Container(
                            height: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset('${item["img"]}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('${item["title"]}',
                                  overflow: TextOverflow.clip,
                                  style: GoogleFonts.lato(
                                    textStyle: Theme.of(context).textTheme.titleMedium,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text('${item["category"]}',
                                  overflow: TextOverflow.clip,
                                  style: GoogleFonts.lato(
                                    textStyle: Theme.of(context).textTheme.bodySmall,
                                    color: Theme.of(context).colorScheme.secondary,
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.w400
                                  ),
                                ),
                                SizedBox(height: 5),
                                RatingBarIndicator(
                                  rating: item["rating"],
                                  
                                  itemBuilder: (context, index) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 16,
                                  direction: Axis.horizontal,
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
            }  
          ),  
        ),
         
      ],
    ),
  );
  }



}