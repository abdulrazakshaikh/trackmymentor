import 'dart:ui';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

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
    "img": "images/default.jpg",
  },
  {
    "id": "002",
    "name" : "Lyndon Merrill",
    "specialization": "Lorem Two",
    "experience": "3yrs",
    "img": "images/default.jpg",
  },
  {
    "id": "003",
    "name" : "Charles Pennington",
    "specialization": "Lorem Two",
    "experience": "3yrs",
    "img": "images/default.jpg",
  },
  {
    "id": "004",
    "name" : "Trevor Wainwright",
    "specialization": "Lorem Two",
    "experience": "3yrs",
    "img": "images/default.jpg",
  },
  {
    "id": "005",
    "name" : "Elisha Wilkins",
    "specialization": "Lorem Two",
    "experience": "3yrs",
    "img": "images/default.jpg",
  },
];

  @override
  Widget build(BuildContext context) {
  
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text('Popular Teacher',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.titleLarge,
                    letterSpacing: 1.2,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                )
              ),
              Container(
                child: TextButton(
                  onPressed: (){},
                  child: Row(
                    children: [
                      Text('Show All',
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.titleSmall,
                          letterSpacing: 1.2,
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_forward, size: 18,), 
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
          height: MediaQuery.of(context).size.width < 321 ?  265 : 255,
          alignment: Alignment.topLeft,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              Map item = carouselitemlist[index];
              return Container(
                
                
              alignment: Alignment.topLeft,
              transform: Transform.translate( offset: Offset(-75, 0), ).transform,
              margin: const EdgeInsets.only( bottom: 25 ), 
              

              // margin: EdgeInsets.only(bottom: 25),
              child: GestureDetector(
                onTap: () {},
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
                                    letterSpacing: 1.2,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
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
            },
            autoplay: false,
            viewportFraction: MediaQuery.of(context).size.width < 321 ?  0.6 : 0.55,
            // viewportFraction: 0.5,
            itemCount: carouselitemlist == null ? 0 : carouselitemlist.length,
            scrollDirection: Axis.horizontal,
            axisDirection: AxisDirection.left,
            loop: false,


            // pagination: SwiperPagination(
            //   alignment: Alignment.bottomCenter,
            //   builder: DotSwiperPaginationBuilder(
            //     size: 6,
            //     activeSize: 10,
            //     color: Colors.grey.withOpacity(0.5), activeColor:  Theme.of(context).colorScheme.primary
            //   ),
            // ),
            control: null,
            // itemCount: 3,
            // pagination: new SwiperPagination(),
            // control: new SwiperControl(),
          ),
        ),
      ],
    ),
  );
  }



}