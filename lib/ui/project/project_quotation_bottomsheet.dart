import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';


class ProjectQuotationBottomSheet extends StatefulWidget {
  String name;
  String profilepic;
  String price;
  String comment;
  

  ProjectQuotationBottomSheet(this.name, this.profilepic, this.price, this.comment );


  @override
  _ProjectQuotationBottomSheetState createState() => _ProjectQuotationBottomSheetState();
}



class _ProjectQuotationBottomSheetState extends State<ProjectQuotationBottomSheet> with TickerProviderStateMixin{

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
          child: Text('Quotation Details',
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.bodyMedium,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: 
          
        
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Image.asset(widget.profilepic,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(widget.name,
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.titleSmall,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                      )

                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Comments',
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.labelMedium,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(widget.comment,
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),


                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Quotation Price',
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.labelMedium,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text('₹'+widget.price,
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.titleMedium,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Attached File',
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.labelMedium,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(height: 3),
                      TextButton(
                        onPressed: (){}, 
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            
                            Icon(Icons.file_download_outlined, size: 16,), 
                            SizedBox(width: 5),
                            Text('Untitledfile.pdf'.toLowerCase(),
                              style: GoogleFonts.lato(
                                textStyle: Theme.of(context).textTheme.titleSmall,
                                letterSpacing: 1.2,
                                fontSize: MediaQuery.of(context).size.width < 321 ? 12 : 14,
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            
                          ],
                        ),
                        style: TextButton.styleFrom(
                          shape: StadiumBorder(),
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          foregroundColor: Theme.of(context).colorScheme.secondary,
                        ),
                        
                      )
                      
                    ],
                  ),
                ),


              ],
            ),
          ),
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
                    side: BorderSide(color: Colors.red),
                    foregroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    alignment: Alignment.center,
                  ),
                  child: Text('Reject',
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                onPressed: (){
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700, 
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  alignment: Alignment.center,
                ),
                child: Text('Accept'),
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
