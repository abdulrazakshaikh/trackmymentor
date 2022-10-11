import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cool_stepper_reloaded/cool_stepper_reloaded.dart';
import 'package:trackmy_mentor/login/dropdown_bottomsheet.dart';

import 'dropdown_bottomsheet_single.dart';


class StepThree extends StatefulWidget {
  @override
  _StepThreeState createState() => _StepThreeState();
}

class _StepThreeState extends State<StepThree> with TickerProviderStateMixin {
  
  
  
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
              'Qualification',
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
                        child: Text('Your Degree',
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          letterSpacing: 1.75,
                          fontWeight: FontWeight.w400,
                        ),
                        ),
                      ),
                      TextField(
                        readOnly: true,
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
                            fontWeight: FontWeight.w300
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
                          ),
                          suffixIcon: Icon(Icons.arrow_drop_down)
                        ),
                        onTap: (){
                          showModalBottomSheet(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            context: context, builder: (BuildContext context) { 
                              return DropdownBottomSheetSingle();
                            }, 
                          );
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
                        child: Text('Confortable in Which Languages',
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          letterSpacing: 1.75,
                          fontWeight: FontWeight.w400,
                        ),
                        ),
                      ),
                      TextField(
                        readOnly: true,
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
                            fontWeight: FontWeight.w300
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
                          ),
                          suffixIcon: Icon(Icons.arrow_drop_down)
                        ),
                        onTap: (){
                          showModalBottomSheet(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            context: context, builder: (BuildContext context) { 
                              return DropdownBottomSheetSingle();
                            }, 
                          );
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
                        child: Text('Specialize in which Course',
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          letterSpacing: 1.75,
                          fontWeight: FontWeight.w400,
                        ),
                        ),
                      ),
                      TextField(
                        readOnly: true,
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
                            fontWeight: FontWeight.w300
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
                          ),
                          suffixIcon: Icon(Icons.arrow_drop_down)
                        ),
                        onTap: (){
                          showModalBottomSheet(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            context: context, builder: (BuildContext context) { 
                              return DropdownBottomSheetSingle();
                            }, 
                          );
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
