import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trackmy_mentor/ui/profile/teacherprofile.dart';

import '../see_all_teacher_list.dart';

class HomepagePopularTeacher extends StatefulWidget {
  @override
  _HomepagePopularTeacherState createState() => new _HomepagePopularTeacherState();
}

class _HomepagePopularTeacherState extends State<HomepagePopularTeacher> {

List carouselitemlist = [
  {
    "id": "001",
    "name" : "Levi Solomon",
    "specialization": "Lorem One",
    "experience": "3yrs",
    "img": "assets/images/default.jpg",
  },
  {
    "id": "002",
    "name" : "Lyndon Merrill",
    "specialization": "Lorem Two",
    "experience": "3yrs",
    "img": "assets/images/default.jpg",
  },
  {
    "id": "003",
    "name" : "Charles Pennington",
    "specialization": "Lorem Two",
    "experience": "3yrs",
    "img": "assets/images/default.jpg",
  },
  {
    "id": "004",
    "name" : "Trevor Wainwright",
    "specialization": "Lorem Two",
    "experience": "3yrs",
    "img": "assets/images/default.jpg",
  },
  {
    "id": "005",
    "name" : "Elisha Wilkins",
    "specialization": "Lorem Two",
    "experience": "3yrs",
    "img": "assets/images/default.jpg",
  },
];

  @override
  Widget build(BuildContext context) {
  
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
                child: Text('Popular Teacher'.toUpperCase(),
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.titleLarge,
                    letterSpacing: 1.5,
                    fontSize: MediaQuery.of(context).size.width < 321 ? 16 : 18,
                    fontWeight: FontWeight.w900
                  ),
                )
              ),
              Container(
                child: TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SeeAllTeacherList("Popular Teachers")));
                  },
                  child: Row(
                    children: [
                      Text('Show All',
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.titleSmall,
                          letterSpacing: 1.2,
                          fontSize: MediaQuery.of(context).size.width < 321 ? 12 : 14,
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_forward, size: 16,), 
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
                controller: PageController(viewportFraction: MediaQuery.of(context).size.width < 321 ? 0.6 : 0.5,), 
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> TeacherProfile()));
                  },
                  child: Card(
                    elevation: 5,
                    shadowColor: Theme.of(context).shadowColor.withOpacity(0.35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(width: 1, color: Colors.grey.withOpacity(0.2))
                    ),
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
                                Text('${item["name"]}',
                                  overflow: TextOverflow.clip,
                                  maxLines: 1,
                                  style: GoogleFonts.lato(
                                    textStyle: Theme.of(context).textTheme.titleMedium,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text('${item["specialization"]}',
                                  overflow: TextOverflow.clip,
                                  style: GoogleFonts.lato(
                                    textStyle: Theme.of(context).textTheme.bodySmall,
                                    color: Theme.of(context).colorScheme.secondary,
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.w400
                                  ),
                                ),
                                SizedBox(height: 5),
                                RichText(
                                  text: TextSpan(
                                    style: GoogleFonts.lato(
                                      textStyle: Theme.of(context).textTheme.bodySmall,
                                      color: Theme.of(context).colorScheme.secondary,
                                      letterSpacing: 1.2,
                                      fontWeight: FontWeight.w400
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Experience : ', 
                                        
                                      ),
                                      TextSpan(
                                        text: '${item["experience"]}',
                                        style: TextStyle(fontWeight: FontWeight.bold)
                                      ),
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
            }  
          ),  
        ),

      ],
    ),
  );
  }



}