import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cool_stepper_reloaded/cool_stepper_reloaded.dart';


class StepOne extends StatefulWidget {
  @override
  _StepOneState createState() => _StepOneState();
}

class _StepOneState extends State<StepOne> with TickerProviderStateMixin {
  
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Text(
              'Who are you ?',
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoCondensed(
                textStyle: Theme.of(context).textTheme.headlineSmall,
                letterSpacing: 1.5,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  child: anyItem(0),
                ),
                SizedBox(width: 10.0),
                Container(
                  width: 150,
                  child: anyItem(1),
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
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  width: 64,
                  child: Image.asset(
                  index == 0 ? 'images/teacher.png' : 'images/student.png',
                  fit: BoxFit.contain,
                  ),
                ),
                Text(index == 0 ? 'Teacher'.toUpperCase() : 'Student'.toUpperCase(),
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.titleLarge,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    letterSpacing: 1.2,
                    color: selectedIndex == index ? Theme.of(context).colorScheme.primary : null,
                  ),
                ),
              ],
            ),
          ),
          
        ],
      )
    ),
  );
}

}
