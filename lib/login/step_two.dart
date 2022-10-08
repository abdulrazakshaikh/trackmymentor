import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cool_stepper_reloaded/cool_stepper_reloaded.dart';


class StepTwo extends StatefulWidget {
  @override
  _StepTwoState createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> with TickerProviderStateMixin {
  
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Text(
              'Personal Information',
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
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            labelText: 'First Name'.toLowerCase(),
                            labelStyle: GoogleFonts.lato(
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
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            labelText: 'Last Name'.toLowerCase(),
                            labelStyle: GoogleFonts.lato(
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
                        ),
                      ),
                    ],
                  )
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: TextField(
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelText: 'Mobile Number'.toLowerCase(),
                      labelStyle: GoogleFonts.lato(
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
                  ),
                ),

                Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text('Upload Profile Picture',
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w600
                        ),
                        ),
                      ),
                      InkWell(
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/default.jpg'),
                          radius: 54,
                        ),
                      ),

                    ],
                  ),
                )

              ],
            ),
          ),
          
          
        ],
      ),
    );
  }
}
