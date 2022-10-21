import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trackmy_mentor/data/projectdata.dart';

import '../project/project_details.dart';

class GigsItem extends StatefulWidget {
  @override
  _GigsItemState createState() => new _GigsItemState();

  const GigsItem({Key? key, required this.value}) : super(key: key);
  final ProjectData value;
}

class _GigsItemState extends State<GigsItem> {
  

  @override
  Widget build(BuildContext context) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(
              builder: (BuildContext context) =>
                    ProjectDetails(widget.value))
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
                    child: Image.asset('assets/images/bg1.jpg',
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
                      Text(
                      widget.value.title!,
                      overflow: TextOverflow.clip,
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.titleMedium,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                      SizedBox(height: 5),
                      Text('lorem category',
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
                )
              ],
            ),
          ),
        ),
    );
  }
}
