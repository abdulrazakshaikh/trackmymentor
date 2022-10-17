import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common_widgets/dropdown_bottomsheet_single.dart';

class AddStepTwo extends StatefulWidget {
  @override
  _AddStepTwoState createState() => _AddStepTwoState();
}

class _AddStepTwoState extends State<AddStepTwo> with TickerProviderStateMixin {
  
  int selectedIndex = 0;
  
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
  DateTime selectedDate = DateTime.now();
  late String _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Text(
              'Project Information',
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
                  child: TextField(
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelText: 'Project Title'.toLowerCase(),
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
                  margin: EdgeInsets.only(bottom: 15),
                  child: TextField(
                    readOnly: true,
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          labelText: 'Class'.toLowerCase(),
                          labelStyle: GoogleFonts.lato(
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
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: TextField(
                    readOnly: true,
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          labelText: 'Subject'.toLowerCase(),
                          hintText: "Select Subject",
                          labelStyle: GoogleFonts.lato(
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
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: TextField(
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                    maxLines: 4,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      
                      labelText: 'Project Description'.toLowerCase(),
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
                  margin: EdgeInsets.only(bottom: 15),
                  child: TextFormField(
                    initialValue: '',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                    onTap: (){
                       _selectDate(context);
                    },
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                        _selectedDate = value;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelText: 'Last Date to Submit'.toLowerCase(),
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
            ),
          ),
          
          
        ],
      ),
    );
  }
}
