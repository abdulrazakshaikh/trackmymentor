import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      //bottomNavigationBar: BottomNavigation(),
      appBar: AppBar(
        title: Text('Project Details'),
        actions: [],
      ),
      body: ListView(
        children: [

          Container(
            child: Text('Student Name'),
          ),

          Container(
            child: Text(widget.title.toUpperCase()),
          ),

          Container(
            child: Text('Category'),
          ),

          Container(
            child: Text('Description'),
          ),

          Container(
            child: Text('Subject'),
          ),

          Container(
            child: Text('Class'),
          ),

          Container(
            child: Text('Project Photos Slider with Zoom Popup'),
          ),

          Container(
            child: Text('Student Rating Add Rating & View Comments'),
          ),

          Container(
            child: Text('Apply Button'),
          ),

          


        ],
      ),
    );
  }

}