import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cool_stepper_reloaded/cool_stepper_reloaded.dart';


class StepFour extends StatefulWidget {
  @override
  _StepFourState createState() => _StepFourState();
}

class _StepFourState extends State<StepFour> with TickerProviderStateMixin {
  
  var _options = [
    "1 Option",
    "2 Option",
    "3 Option",
    "4 Option",
    "5 Option",
    "6 Option",
    "7 Option",
    "8 Option",
    "9 Option",
    "10 Option",
  ];

  var selectOptions = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Text(
              'Experience',
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
            child: Column(
              children: [


                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text('No. of Years',
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          letterSpacing: 1.75,
                          fontWeight: FontWeight.w400,
                        ),
                        ),
                      ),
                      DropdownButtonFormField(
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          hintText: 'Select an Options'.toLowerCase(),
                          hintStyle: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            letterSpacing: 1.8,
                            fontWeight: FontWeight.w300),
                          
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
                          ),
                        ),
                        items: _options.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                            style: GoogleFonts.lato(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                            ),
                          );
                        }).toList(), 
                        focusColor: Colors.white,
                        onChanged: (String? newValue){
                          setState(() {
                            selectOptions = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text('Select Category',
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          letterSpacing: 1.75,
                          fontWeight: FontWeight.w400,
                        ),
                        ),
                      ),
                      DropdownButtonFormField(
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          hintText: 'Select an Options'.toLowerCase(),
                          hintStyle: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            letterSpacing: 1.8,
                            fontWeight: FontWeight.w300),
                          
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
                          ),
                        ),
                        items: _options.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                            style: GoogleFonts.lato(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                            ),
                          );
                        }).toList(), 
                        focusColor: Colors.white,
                        onChanged: (String? newValue){
                          setState(() {
                            selectOptions = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text('Choose a Class',
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          letterSpacing: 1.75,
                          fontWeight: FontWeight.w400,
                        ),
                        ),
                      ),
                      DropdownButtonFormField(
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          hintText: 'Select an Options'.toLowerCase(),
                          hintStyle: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            letterSpacing: 1.8,
                            fontWeight: FontWeight.w300),
                          
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
                          ),
                        ),
                        items: _options.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                            style: GoogleFonts.lato(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                            ),
                          );
                        }).toList(), 
                        focusColor: Colors.white,
                        onChanged: (String? newValue){
                          setState(() {
                            selectOptions = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text('Choose Subject',
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          letterSpacing: 1.75,
                          fontWeight: FontWeight.w400,
                        ),
                        ),
                      ),
                      DropdownButtonFormField(
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          hintText: 'Select an Options'.toLowerCase(),
                          hintStyle: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            letterSpacing: 1.8,
                            fontWeight: FontWeight.w300),
                          
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
                          ),
                        ),
                        items: _options.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                            style: GoogleFonts.lato(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                            ),
                          );
                        }).toList(), 
                        focusColor: Colors.white,
                        onChanged: (String? newValue){
                          setState(() {
                            selectOptions = newValue!;
                          });
                        },
                      ),
                    ],
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
