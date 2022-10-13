import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

enum SelectedOptions { one, two, three, four, five, six, seven, eight, nine, ten }

class QuotationBottomSheet extends StatefulWidget {
  @override
  _QuotationBottomSheetState createState() => _QuotationBottomSheetState();
}



class _QuotationBottomSheetState extends State<QuotationBottomSheet> with TickerProviderStateMixin{

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
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          alignment: Alignment.centerLeft,
          child: Text('Add your Quotation',
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.bodyMedium,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [

                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: TextFormField(
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelText: 'Price'.toLowerCase(),
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
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                    maxLines: 4,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelText: 'Comments'.toLowerCase(),
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

                InkWell(
                  onTap: (){},
                  child: Container(
                    height: 54,
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.upload_file, size: 24, color: Theme.of(context).colorScheme.secondary),
                        SizedBox(width: 5),
                        Text('Upload File',
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    )
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
                child: Text('Submit'),
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
