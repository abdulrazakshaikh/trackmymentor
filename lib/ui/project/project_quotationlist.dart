import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trackmy_mentor/ui/project/project_quotation_bottomsheet.dart';

import '../project/project_details.dart';

class ProjectQuotationList extends StatefulWidget {
 
  @override
  State<ProjectQuotationList> createState() => _ProjectQuotationListState();
}

class _ProjectQuotationListState extends State<ProjectQuotationList> {
  List carouselitemlist = [
    {
      "id": "001",
      "profilepic": "assets/images/default.jpg",
      "name" : "Aleena Nieves",
      "price": "2500",
      "comment" : "lorem ipsum dolor sit amet si a simply dummy text uised lorem ipsum dolor sit amet si a simply dummy text uised lorem ipsum dolor sit amet si a simply dummy text uised",
    },
    {
      "id": "002",
      "profilepic": "assets/images/default.jpg",
      "name" : "Benny Wilson",
      "price": "2500",
      "comment" : "lorem ipsum dolor sit amet si a",
    },
    {
      "id": "003",
      "profilepic": "assets/images/default.jpg",
      "name" : "Darlene Freeman",
      "price": "2500",
      "comment" : "lorem ipsum dolor",
    },
  ];

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: ListView.builder(
          primary: false,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: carouselitemlist == null ? 0 : carouselitemlist.length,
          itemBuilder: (BuildContext context, int index) {
            Map item = carouselitemlist[index];
            return Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  width: 1, color: Theme.of(context).dividerColor
                )
              ),
              // margin: EdgeInsets.only(bottom: 5, left: 10,right: 10),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    context: context, builder: (BuildContext context) {
                      return ProjectQuotationBottomSheet('${item["name"]}', '${item["profilepic"]}', '${item["price"]}', '${item["comment"]}');
                    }, 
                  );
                },
                child: ListTile(
                  horizontalTitleGap: 5,
                  leading: ClipRRect(
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
                  title: Text('${item["name"]}',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.titleSmall,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                  subtitle: Container(
                    child: Row(
                      children: [
                        Icon(Icons.comment_outlined),
                        SizedBox(width: 3),
                        Expanded(
                          child: Text('${item["comment"]}',
                            maxLines: 1, overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.lato(
                              textStyle: Theme.of(context).textTheme.bodySmall,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: Text('₹ ${item["price"]}',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.titleSmall,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
            );
          }
      ),
      
    );
  }
}
