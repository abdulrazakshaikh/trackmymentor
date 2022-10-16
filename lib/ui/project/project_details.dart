import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trackmy_mentor/ui/project/project_quotationlist.dart';
import 'package:trackmy_mentor/ui/project/projectimage_slider.dart';
import 'package:trackmy_mentor/ui/project/quotation_bottomsheet.dart';


class ProjectDetails extends StatefulWidget{
  String title;
  ProjectDetails(this.title);

  @override
  State<StatefulWidget> createState() {
   return ProjectDetailsState();
  }

}
class ProjectDetailsState extends State<ProjectDetails>{

List commentsitemlist = [
    {
      "id": "001",
      "profilepic": "assets/images/default.jpg",
      "name" : "Aleena Nieves",
      "date": "01/08/22",
      "comment" : "lorem ipsum dolor sit amet si a simply dummy text uised lorem ipsum dolor sit amet si a simply dummy text uised lorem ipsum dolor sit amet si a simply dummy text uised",
      "rating": 1.5,
    },
    {
      "id": "002",
      "profilepic": "assets/images/default.jpg",
      "name" : "Benny Wilson",
      "date": "01/08/22",
      "comment" : "lorem ipsum dolor sit amet si a",
      "rating": 2.5,
    },
    {
      "id": "003",
      "profilepic": "assets/images/default.jpg",
      "name" : "Darlene Freeman",
      "date": "01/08/22",
      "comment" : "lorem ipsum dolor",
      "rating": 4.5,
    },
    {
      "id": "004",
      "profilepic": "assets/images/default.jpg",
      "name" : "Bethan Baird",
      "date": "01/08/22",
      "comment" : "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids",
      "rating": 3.0,
    },
    {
      "id": "005",
      "profilepic": "assets/images/default.jpg",
      "name" : "Roxanne Bean",
      "date": "01/08/22",
      "comment" : "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae ",
      "rating": 5.0,
    },
];

bool newState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: 
      Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          boxShadow:[ 
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
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    context: context, builder: (BuildContext context) { 
                      return QuotationBottomSheet();
                    }, 
                    
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  alignment: Alignment.center,
                ),
                child: Text('Add Quotation'),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
        // elevation: 0,
        // scrolledUnderElevation: 0,
        title: Text('Details'),
        automaticallyImplyLeading: true,
        actions: [],
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 5,
                      shadowColor: Theme.of(context).shadowColor.withOpacity(0.35),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(width: 1, color: Colors.grey.withOpacity(0.2))
                      ),
                      child: Container(
                        width: 74,
                        height: 74,
                        padding: EdgeInsets.all(15),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('assets/images/project.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      )
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.title,
                            overflow: TextOverflow.clip,
                            style: GoogleFonts.lato(
                              textStyle: Theme.of(context).textTheme.titleLarge,
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.25
                            ),
                          ),
                          SizedBox(height: 5),
                          Text('Assignments'.toUpperCase(),
                            overflow: TextOverflow.clip,
                            style: GoogleFonts.lato(
                              textStyle: Theme.of(context).textTheme.bodySmall,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.primary,
                              letterSpacing: 1.25
                            ),
                          ),
                          SizedBox(height: 2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                               Text('Lorem Class'.toLowerCase(),
                                style: GoogleFonts.lato(
                                  textStyle: Theme.of(context).textTheme.bodySmall,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.25
                                ),
                               ),
                               Container(width: 20, alignment: Alignment.center, child: Text('|'),),
                               Text('Ipsum Subject'.toLowerCase(),
                                style: GoogleFonts.lato(
                                  textStyle: Theme.of(context).textTheme.bodySmall,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.25
                                ),
                               ),
                            ],
                          ),
                          SizedBox(height: 5),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Last date :',
                                style: GoogleFonts.lato(
                                  textStyle: Theme.of(context).textTheme.labelMedium,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.25
                                ),
                              ),
                              SizedBox(width: 5),
                              Text('24 Dec, 2022'.toUpperCase(),
                                style: GoogleFonts.lato(
                                  textStyle: Theme.of(context).textTheme.bodySmall,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.25
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
          ),
          
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            clipBehavior: Clip.none,
            color: Theme.of(context).colorScheme.surface.withOpacity(0.2),
            height: 180, alignment: Alignment.center,
            child: ProjectImageSlider()
          ),

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
                expansionTileTheme: ExpansionTileThemeData(iconColor: Colors.grey.shade800)
              ), 
              child: ExpansionTile(
                // onExpansionChanged: (val)=>setState(()=>newState=!val),
                onExpansionChanged: (val){
                  setState(() {
                    newState = val;
                  });
                },
                tilePadding: EdgeInsets.symmetric(horizontal: 15, vertical: newState == true ? 0 : 10),
                childrenPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                title: Container(                 
                  child: Text('Project Description'.toUpperCase(),
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.titleSmall,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.secondary,
                      letterSpacing: 1.85,
                    ),
                  ),
                ),
                subtitle: newState == true ? null :
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  maxLines: 2, overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.bodySmall,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                  ),
                ),
                ),
                children: [
                  Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodySmall,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            )
          ),

          Divider(height: 1),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            // margin: EdgeInsets.only(bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                            ),
                            child: Image.asset('assets/images/default.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Jemimah Reese',
                              style: GoogleFonts.lato(
                                textStyle: Theme.of(context).textTheme.titleSmall,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text('Lorem Ipsum Designer',
                              style: GoogleFonts.lato(
                                textStyle: Theme.of(context).textTheme.labelSmall,
                                fontSize: 13,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            SizedBox(height: 7),
                            RatingBarIndicator(
                              rating: 3.5,
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
                      ),
                    ],
                  ),
                )
              ],
            )
          ),

          Divider(height: 1),


          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Quotation Received'.toUpperCase(),
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.titleSmall,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.secondary,
                          letterSpacing: 1.85,
                        ),
                      ),
                      Text('What others have quotated for the project',
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.bodySmall,
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
                      ProjectQuotationList(),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: (){}, 
                              child: Row(
                                children: [
                                  Text('View all'.toLowerCase(),
                                    style: GoogleFonts.lato(
                                      textStyle: Theme.of(context).textTheme.titleSmall,
                                      letterSpacing: 1.2,
                                      fontSize: MediaQuery.of(context).size.width < 321 ? 12 : 14,
                                      color: Theme.of(context).colorScheme.primary,
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
                                foregroundColor: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ),



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
                      Text('Rating & Review'.toUpperCase(),
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.titleSmall,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.secondary,
                          letterSpacing: 1.85,
                        ),
                      ),
                      Text('Tell others what you think',
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.bodySmall,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.85,
                        ),
                      ),
                    ],
                  )
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RatingBar.builder(
                          initialRating: 0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 32,
                          wrapAlignment: WrapAlignment.spaceBetween,

                          itemPadding: EdgeInsets.only(right: 15.0),
                          itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              TextField(
                                style: GoogleFonts.lato(
                                  textStyle: Theme.of(context).textTheme.bodyMedium,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                ),
                                maxLines: 3,
                                maxLength: 300,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(15),
                                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                                  hintText: 'Describe your experience'.toLowerCase(),
                                  hintStyle: GoogleFonts.lato(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.8,
                                    fontWeight: FontWeight.w300),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                                          alignment: Alignment.center,
                                        ),
                                        child: Text('Submit'),
                                      ),
                                    ),
                                  ],
                                )
                              )
                            ],
                          )
                        ),
                        
                      ],
                    )
                ),

                Divider(),

                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: ListView.separated(
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: commentsitemlist == null ? 0 : commentsitemlist.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 10);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    Map item = commentsitemlist[index];
                    return Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)
                      ),
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
                                      child: Image.asset('${item["profilepic"]}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('${item["name"]}',
                                        style: GoogleFonts.lato(
                                          textStyle: Theme.of(context).textTheme.titleSmall,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          RatingBarIndicator(
                                            rating: double.parse(item["rating"].toString()),
                                            itemBuilder: (context, index) => Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                            ),
                                            itemCount: 5,
                                            itemSize: 16,
                                            direction: Axis.horizontal,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 20),
                                            child: Text('${item["date"]}',
                                              style: GoogleFonts.lato(
                                                textStyle: Theme.of(context).textTheme.bodySmall,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 1.2,
                                              ),
                                            ),
                                          ),

                                        ],
                                      )
                                      
                                    ],
                                  )
                                ),
                                
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            alignment: Alignment.topLeft,
                            child: Text('${item["comment"]}', textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: GoogleFonts.lato(
                                textStyle: Theme.of(context).textTheme.titleSmall,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                              ),
                            ),
                          )

                        ],
                      ),
                    ),
                    );
                  }
                ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }

}