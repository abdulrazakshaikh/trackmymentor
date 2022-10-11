import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trackmy_mentor/homepage/homepage.dart';
import 'package:trackmy_mentor/project/quotation_bottomsheet.dart';

class ProjectDetails extends StatefulWidget{
  String title;
  ProjectDetails(this.title);

  @override
  State<StatefulWidget> createState() {
   return ProjectDetailsState();
  }

}
class ProjectDetailsState extends State<ProjectDetails>{
  
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
            color: Theme.of(context).colorScheme.surface,
            height: 200, alignment: Alignment.center,
            child: Text('Project Photos Slider with Zoom Popup'),
          ),

          Container(
            // decoration: BoxDecoration(
            //   border: Border(
            //     bottom: BorderSide(width: 1, color: Theme.of(context).dividerColor),
            //     top: BorderSide(width: 1, color: Theme.of(context).dividerColor)
            //   )
            // ),
            child: Theme(
              data: ThemeData(
                dividerColor: Colors.transparent,
                expansionTileTheme: ExpansionTileThemeData(iconColor: Colors.grey.shade800)
              ), 
              child: ExpansionTile(
                childrenPadding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                title: Text('Project Description'.toUpperCase(),
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.titleSmall,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.secondary,
                    letterSpacing: 1.85,
                  ),
                ),
                children: [
                  Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
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
                // Padding(
                //   padding: EdgeInsets.symmetric(vertical: 10),
                //   child: Text('Student Information'.toUpperCase(),
                //     style: GoogleFonts.lato(
                //       textStyle: Theme.of(context).textTheme.titleSmall,
                //       fontWeight: FontWeight.w400,
                //       color: Theme.of(context).colorScheme.secondary,
                //       letterSpacing: 1.85,
                //     ),
                //   ),
                // ),
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
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text('Rating & Review'.toUpperCase(),
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.titleSmall,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.secondary,
                      letterSpacing: 1.85,
                    ),
                  ),
                ),
              ],
            ),
          ),





          // Container(
          //   margin: EdgeInsets.only(top: 15),
          //   decoration: BoxDecoration(
          //     border: Border(
          //       bottom: BorderSide(width: 1, color: Theme.of(context).dividerColor),
          //       top: BorderSide(width: 1, color: Theme.of(context).dividerColor)
          //     )
          //   ),
          //   child: Theme(
          //     data: ThemeData(
          //       dividerColor: Colors.transparent,
          //       expansionTileTheme: ExpansionTileThemeData(iconColor: Colors.grey.shade800)
          //     ), 
          //     child: ExpansionTile(
          //       childrenPadding: EdgeInsets.fromLTRB(15, 0, 15, 15),
          //       title: Text('Rating & Review'.toUpperCase(),
          //         style: GoogleFonts.lato(
          //           textStyle: Theme.of(context).textTheme.titleSmall,
          //           fontWeight: FontWeight.w400,
          //           color: Theme.of(context).colorScheme.secondary,
          //           letterSpacing: 1.85,
          //         ),
          //       ),
          //       children: [
          //         Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          //           style: GoogleFonts.lato(
          //             textStyle: Theme.of(context).textTheme.bodyMedium,
          //             fontWeight: FontWeight.w500,
          //             letterSpacing: 1.2,
          //           ),
          //         ),
          //       ],
          //     ),
          //   )
          // ),



        ],
      ),
    );
  }

}