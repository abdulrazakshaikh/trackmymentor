import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';


class AddStepOne extends StatefulWidget {
  @override
  _AddStepOneState createState() => _AddStepOneState();
}

class _AddStepOneState extends State<AddStepOne> with TickerProviderStateMixin {
  
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Text(
              'Select Categories',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.headlineSmall,
                letterSpacing: 1.5,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Wrap(
              spacing: 5,
              runSpacing: 5,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 12.5,
                  child: anyItem(0),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 12.5,
                  child: anyItem(1),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 12.5,
                  child: anyItem(2),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 12.5,
                  child: anyItem(3),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 12.5,
                  child: anyItem(4),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 12.5,
                  child: anyItem(5),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  child: anyItem(6),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  child: anyItem(7),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
Widget anyItem(int index) {
    
  return InkWell(
    onTap: () {
      setState(() {
        selectedIndex = index;
      });
    },
    child: Card(
      color:
      selectedIndex == index ? Theme.of(context).colorScheme.primaryContainer :
      Theme.of(context).colorScheme.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(width: 1, 
        color: 
        selectedIndex == index ? Theme.of(context).colorScheme.primary : 
        Theme.of(context).colorScheme.secondary
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 10, right: 10,
            child: Container(
              width: 20, height: 20, 
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1, 
                  color: 
                  selectedIndex == index ?
                  Colors.transparent :
                  Theme.of(context).colorScheme.secondary
                ),
                borderRadius: BorderRadius.circular(12),
                color: 
                selectedIndex == index ?
                Theme.of(context).colorScheme.primary : Colors.transparent,
              ),
              child: Icon(Icons.check, color: Colors.white, size: 12,),
            )
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 42,
                  child: Image.asset(
                  index == 0 ? 'assets/images/tutor.png' :
                  index == 1 ? 'assets/images/project.png' :
                  index == 2 ? 'assets/images/sports.png' :
                  index == 3 ? 'assets/images/coach.png' :
                  index == 4 ? 'assets/images/chart.png' :
                  index == 5 ? 'assets/images/model.png' :
                  index == 6 ? 'assets/images/activity.png' :
                  index == 7 ? 'assets/images/assignment.png' :
                  'null',
                  fit: BoxFit.contain,
                  ),
                ),
                Expanded(
                  child: Text(
                  index == 0 ? 'Tutor'.toUpperCase() : 
                  index == 1 ? 'Project'.toUpperCase() : 
                  index == 2 ? 'Sports'.toUpperCase() : 
                  index == 3 ? 'Coach'.toUpperCase() : 
                  index == 4 ? 'Chart'.toUpperCase() : 
                  index == 5 ? 'Model'.toUpperCase() : 
                  index == 6 ? 'Activity'.toUpperCase() : 
                  index == 7 ? 'Assignments'.toUpperCase() : 
                  '',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.titleLarge,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    letterSpacing: 1.2,
                    color: selectedIndex == index ? Theme.of(context).colorScheme.primary : null,
                  ),
                ),
                )
              ],
            ),
          ),
          
        ],
      )
    ),
  );
}

}
