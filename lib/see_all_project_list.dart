import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trackmy_mentor/project/project_details.dart';

class SeeAllProjectList extends StatefulWidget{
  String title;
  SeeAllProjectList(this.title);

  @override
  State<StatefulWidget> createState() {
   return SeeAllProjectListState();
  }

}
class SeeAllProjectListState extends State<SeeAllProjectList>{
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
    return Scaffold(
      //bottomNavigationBar: BottomNavigation(),
      appBar: AppBar(
        title: Text(widget.title.toUpperCase()),
        actions: [],
      ),
      body: ListView(
          children: [

            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: ListView.builder(
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: carouselitemlist == null ? 0 : carouselitemlist.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map item = carouselitemlist[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 5, left: 10,right: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context, MaterialPageRoute(
                              builder: (BuildContext context) => ProjectDetails('${item["title"]}')
                            )
                          );
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
                                      Text('${item["title"]}',
                                        overflow: TextOverflow.clip,
                                        style: GoogleFonts.lato(
                                          textStyle: Theme.of(context).textTheme.titleMedium,
                                          fontSize: 18,
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