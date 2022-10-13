import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trackmy_mentor/ui/homepage/gigs_item.dart';

import '../see_all_project_list.dart';

class HomepageMyPopularGigs extends StatefulWidget {
  @override
  _HomepageMyPopularGigsState createState() => new _HomepageMyPopularGigsState();
}

class _HomepageMyPopularGigsState extends State<HomepageMyPopularGigs> {

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
                child: Text('My Popular Gigs'.toUpperCase(),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SeeAllProjectList("My Popular Gigs")));
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
                controller: PageController(viewportFraction: 0.85,), 
                padEnds: false,
                pageSnapping: true,
                itemCount: carouselitemlist == null ? 0 : carouselitemlist.length,
                physics: PageScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  Map item = carouselitemlist[index];
                  return Container(
                  margin: EdgeInsets.only(bottom: 25, left: index==0 ? 10 : 0,), 
                  child: GigsItem(value: item),
              );
            }  
          ),  
        ),
         
      ],
    ),
  );
  }



}