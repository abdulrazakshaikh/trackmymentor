import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

enum SelectedOptions { one, two, three, four, five, six, seven, eight, nine, ten }

class DropdownBottomSheetSingle extends StatefulWidget {
  @override
  _DropdownBottomSheetSingleState createState() => _DropdownBottomSheetSingleState();
}



class _DropdownBottomSheetSingleState extends State<DropdownBottomSheetSingle> with TickerProviderStateMixin{

SelectedOptions? _options = SelectedOptions.one;

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
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15)
            ),
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
                            textStyle: Theme.of(context).textTheme.labelMedium,
                            letterSpacing: 1.8,
                            fontWeight: FontWeight.w300),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
                          ),
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text('Select an options',
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
              children: <Widget>[  
                ListTileTheme(    
                  horizontalTitleGap: 0,
                  child: RadioListTile<SelectedOptions>(
                    dense: true,
                    title: Text('One Lorem Ipsum',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600),
                    ),
                    activeColor: Theme.of(context).colorScheme.primary,
                    // checkColor: Theme.of(context).colorScheme.onPrimary,
                    groupValue:  _options,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: SelectedOptions.one,
                    onChanged: (SelectedOptions? value) {
                      setState(() {
                        _options = value;
                      });
                    },
                  ), 
                ),
                ListTileTheme(    
                  horizontalTitleGap: 0,
                  child: RadioListTile<SelectedOptions>(
                    dense: true,
                    title: Text('Two Lorem Ipsum',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600),
                    ),
                    activeColor: Theme.of(context).colorScheme.primary,
                    // checkColor: Theme.of(context).colorScheme.onPrimary,
                    groupValue:  _options,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: SelectedOptions.two,
                    onChanged: (SelectedOptions? value) {
                      setState(() {
                        _options = value;
                      });
                    },
                  ), 
                ),
                ListTileTheme(    
                  horizontalTitleGap: 0,
                  child: RadioListTile<SelectedOptions>(
                    dense: true,
                    
                    title: Text('Three Lorem Ipsum',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600),
                    ),
                    activeColor: Theme.of(context).colorScheme.primary,
                    // checkColor: Theme.of(context).colorScheme.onPrimary,
                    groupValue:  _options,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: SelectedOptions.three,
                    onChanged: (SelectedOptions? value) {
                      setState(() {
                        _options = value;
                      });
                    },
                  ), 
                ),
                ListTileTheme(    
                  horizontalTitleGap: 0,
                  child: RadioListTile<SelectedOptions>(
                    dense: true,
                    
                    title: Text('Four Lorem Ipsum',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600),
                    ),
                    activeColor: Theme.of(context).colorScheme.primary,
                    // checkColor: Theme.of(context).colorScheme.onPrimary,
                    groupValue:  _options,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: SelectedOptions.four,
                    onChanged: (SelectedOptions? value) {
                      setState(() {
                        _options = value;
                      });
                    },
                  ), 
                ),
                ListTileTheme(    
                  horizontalTitleGap: 0,
                  child: RadioListTile<SelectedOptions>(
                    dense: true,
                    
                    title: Text('Five Lorem Ipsum',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600),
                    ),
                    activeColor: Theme.of(context).colorScheme.primary,
                    // checkColor: Theme.of(context).colorScheme.onPrimary,
                    groupValue:  _options,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: SelectedOptions.five,
                    onChanged: (SelectedOptions? value) {
                      setState(() {
                        _options = value;
                      });
                    },
                  ), 
                ),
                ListTileTheme(    
                  horizontalTitleGap: 0,
                  child: RadioListTile<SelectedOptions>(
                    dense: true,
                    
                    title: Text('Six Lorem Ipsum',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600),
                    ),
                    activeColor: Theme.of(context).colorScheme.primary,
                    // checkColor: Theme.of(context).colorScheme.onPrimary,
                    groupValue:  _options,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: SelectedOptions.six,
                    onChanged: (SelectedOptions? value) {
                      setState(() {
                        _options = value;
                      });
                    },
                  ), 
                ),
                ListTileTheme(    
                  horizontalTitleGap: 0,
                  child: RadioListTile<SelectedOptions>(
                    dense: true,
                    
                    title: Text('Seven Lorem Ipsum',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600),
                    ),
                    activeColor: Theme.of(context).colorScheme.primary,
                    // checkColor: Theme.of(context).colorScheme.onPrimary,
                    groupValue:  _options,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: SelectedOptions.seven,
                    onChanged: (SelectedOptions? value) {
                      setState(() {
                        _options = value;
                      });
                    },
                  ), 
                ),
                ListTileTheme(    
                  horizontalTitleGap: 0,
                  child: RadioListTile<SelectedOptions>(
                    dense: true,
                    
                    title: Text('Eight Lorem Ipsum',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600),
                    ),
                    activeColor: Theme.of(context).colorScheme.primary,
                    // checkColor: Theme.of(context).colorScheme.onPrimary,
                    groupValue:  _options,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: SelectedOptions.eight,
                    onChanged: (SelectedOptions? value) {
                      setState(() {
                        _options = value;
                      });
                    },
                  ), 
                ),
                ListTileTheme(    
                  horizontalTitleGap: 0,
                  child: RadioListTile<SelectedOptions>(
                    dense: true,
                    
                    title: Text('Nine Lorem Ipsum',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600),
                    ),
                    activeColor: Theme.of(context).colorScheme.primary,
                    // checkColor: Theme.of(context).colorScheme.onPrimary,
                    groupValue:  _options,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: SelectedOptions.nine,
                    onChanged: (SelectedOptions? value) {
                      setState(() {
                        _options = value;
                      });
                    },
                  ), 
                ),
                ListTileTheme(    
                  horizontalTitleGap: 0,
                  child: RadioListTile<SelectedOptions>(
                    dense: true,
                    
                    title: Text('Ten Lorem Ipsum',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600),
                    ),
                    activeColor: Theme.of(context).colorScheme.primary,
                    // checkColor: Theme.of(context).colorScheme.onPrimary,
                    groupValue:  _options,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: SelectedOptions.ten,
                    onChanged: (SelectedOptions? value) {
                      setState(() {
                        _options = value;
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
