import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';


class AddStepThree extends StatefulWidget {
  @override
  _AddStepThreeState createState() => _AddStepThreeState();
}

class _AddStepThreeState extends State<AddStepThree> with TickerProviderStateMixin {
  
  
  
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
              'Upload Project Image',
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

                InkWell(
                  onTap: (){},
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.upload_file, size: 44, color: Theme.of(context).colorScheme.secondary),
                        SizedBox(height: 5),
                        Text('Upload Project Images',
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
          
          
        ],
      ),
    );
  }
}
