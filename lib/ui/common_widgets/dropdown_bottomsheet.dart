import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';


class DropdownBottomSheet extends StatefulWidget {
  @override
  _DropdownBottomSheetState createState() => _DropdownBottomSheetState();
}


class _DropdownBottomSheetState extends State<DropdownBottomSheet> with TickerProviderStateMixin{

bool _value = false;

@override
Widget build(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.background,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    child: Column(
      children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              // color: Theme.of(context).colorScheme.surface,
            ),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextField(
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          hintText: 'Search for Degree'.toLowerCase(),
                          hintStyle: GoogleFonts.lato(
                              textStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              letterSpacing: 1.8,
                              fontWeight: FontWeight.w300),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.outline),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1),
                          ),
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'Select an options',
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTileTheme(
                  horizontalTitleGap: 0,
                  child: CheckboxListTile(
                    title: Text(
                      'One Lorem Ipsum',
                      style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w600),
                    ),
                    activeColor: Theme.of(context).colorScheme.primary,
                    checkColor: Theme.of(context).colorScheme.onPrimary,
                    selected: _value,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ), 
                ),
                ListTileTheme(    
                  horizontalTitleGap: 0,
                  child: CheckboxListTile(
                    title: Text('One Lorem Ipsum',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600),
                    ),
                    activeColor: Theme.of(context).colorScheme.primary,
                    checkColor: Theme.of(context).colorScheme.onPrimary,
                    selected: _value,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ), 
                ),
                ListTileTheme(    
                  horizontalTitleGap: 0,
                  child: CheckboxListTile(
                    title: Text('One Lorem Ipsum',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600),
                    ),
                    activeColor: Theme.of(context).colorScheme.primary,
                    checkColor: Theme.of(context).colorScheme.onPrimary,
                    selected: _value,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ), 
                ),
                ListTileTheme(    
                  horizontalTitleGap: 0,
                  child: CheckboxListTile(
                    title: Text('One Lorem Ipsum',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600),
                    ),
                    activeColor: Theme.of(context).colorScheme.primary,
                    checkColor: Theme.of(context).colorScheme.onPrimary,
                    selected: _value,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ), 
                ),
                ListTileTheme(    
                  horizontalTitleGap: 0,
                  child: CheckboxListTile(
                    title: Text('One Lorem Ipsum',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600),
                    ),
                    activeColor: Theme.of(context).colorScheme.primary,
                    checkColor: Theme.of(context).colorScheme.onPrimary,
                    selected: _value,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ), 
                ),
                ListTileTheme(    
                  horizontalTitleGap: 0,
                  child: CheckboxListTile(
                    title: Text('One Lorem Ipsum',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600),
                    ),
                    activeColor: Theme.of(context).colorScheme.primary,
                    checkColor: Theme.of(context).colorScheme.onPrimary,
                    selected: _value,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ), 
                ),

                ListTileTheme(    
                  horizontalTitleGap: 0,
                  child: CheckboxListTile(
                    title: Text('One Lorem Ipsum',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600),
                    ),
                    activeColor: Theme.of(context).colorScheme.primary,
                    checkColor: Theme.of(context).colorScheme.onPrimary,
                    selected: _value,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ), 
                ),ListTileTheme(    
                  horizontalTitleGap: 0,
                  child: CheckboxListTile(
                    title: Text('One Lorem Ipsum',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600),
                    ),
                    activeColor: Theme.of(context).colorScheme.primary,
                    checkColor: Theme.of(context).colorScheme.onPrimary,
                    selected: _value,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ), 
                ),
                ListTileTheme(    
                  horizontalTitleGap: 0,
                  child: CheckboxListTile(
                    title: Text('One Lorem Ipsum',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600),
                    ),
                    activeColor: Theme.of(context).colorScheme.primary,
                    checkColor: Theme.of(context).colorScheme.onPrimary,
                    selected: _value,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ), 
                ),
                ListTileTheme(    
                  horizontalTitleGap: 0,
                  child: CheckboxListTile(
                    title: Text('One Lorem Ipsum',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600),
                    ),
                    activeColor: Theme.of(context).colorScheme.primary,
                    checkColor: Theme.of(context).colorScheme.onPrimary,
                    selected: _value,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ), 
                ),
                ListTileTheme(    
                  horizontalTitleGap: 0,
                  child: CheckboxListTile(
                    title: Text('One Lorem Ipsum',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600),
                    ),
                    activeColor: Theme.of(context).colorScheme.primary,
                    checkColor: Theme.of(context).colorScheme.onPrimary,
                    selected: _value,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ), 
                ),
                ListTileTheme(    
                  horizontalTitleGap: 0,
                  child: CheckboxListTile(
                    title: Text('One Lorem Ipsum',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600),
                    ),
                    activeColor: Theme.of(context).colorScheme.primary,
                    checkColor: Theme.of(context).colorScheme.onPrimary,
                    selected: _value,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ), 
                ),
                ListTileTheme(    
                  horizontalTitleGap: 0,
                  child: CheckboxListTile(
                    title: Text('One Lorem Ipsum',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600),
                    ),
                    activeColor: Theme.of(context).colorScheme.primary,
                    checkColor: Theme.of(context).colorScheme.onPrimary,
                    selected: _value,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ), 
                ),
                ListTileTheme(    
                  horizontalTitleGap: 0,
                  child: CheckboxListTile(
                    title: Text('One Lorem Ipsum',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600),
                    ),
                    activeColor: Theme.of(context).colorScheme.primary,
                    checkColor: Theme.of(context).colorScheme.onPrimary,
                    selected: _value,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ), 
                ),
                ListTileTheme(    
                  horizontalTitleGap: 0,
                  child: CheckboxListTile(
                    title: Text('One Lorem Ipsum',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600),
                    ),
                    activeColor: Theme.of(context).colorScheme.primary,
                    checkColor: Theme.of(context).colorScheme.onPrimary,
                    selected: _value,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ), 
                ),
              
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1, color: Theme.of(context).dividerColor),
              ),
            ),
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Theme.of(context).colorScheme.secondary),
                      foregroundColor: Theme.of(context).colorScheme.secondary,
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      alignment: Alignment.center,
                    ),
                    child: Text('Cancel',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                  onPressed: (){
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary, 
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    alignment: Alignment.center,
                  ),
                  child: Text('Apply'),
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
