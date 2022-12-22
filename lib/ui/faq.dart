import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trackmy_mentor/ui/project/project_quotationlist.dart';
import 'package:trackmy_mentor/ui/project/projectimage_slider.dart';
import 'package:trackmy_mentor/ui/project/quotation_bottomsheet.dart';


class FAQ extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    return FAQState();
  }

}
class FAQState extends State<FAQ>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9f9f9),
      appBar: AppBar(
        elevation: 0,
        // scrolledUnderElevation: 0,
        title: Text('FAQ'),
        automaticallyImplyLeading: true,
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Container(
                      height: 180,
                      child: Image.asset('assets/images/faq.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text('Kindly Check the FAQ below if you are not very familiar with the Circlenest',
                      style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.titleMedium,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w600
                      ),
                    ),

                  ],
                )
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Wrap(
                runSpacing: 5,
                spacing: 5,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 15,
                    height: 130,
                    child: Card(
                      elevation: 5,
                      shadowColor: Theme.of(context).shadowColor.withOpacity(0.35),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(width: 1, color: Colors.grey.withOpacity(0.2))
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 54,
                              width: 54,
                              child: Image.asset('assets/images/model.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text('Registration',
                              style: GoogleFonts.lato(
                                  textStyle: Theme.of(context).textTheme.titleSmall,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 15,
                    height: 130,
                    child: Card(
                      elevation: 5,
                      shadowColor: Theme.of(context).shadowColor.withOpacity(0.35),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(width: 1, color: Colors.grey.withOpacity(0.2))
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 54,
                              width: 54,
                              child: Image.asset('assets/images/model.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text('Account',
                              style: GoogleFonts.lato(
                                  textStyle: Theme.of(context).textTheme.titleSmall,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 15,
                    height: 130,
                    child: Card(
                      elevation: 5,
                      shadowColor: Theme.of(context).shadowColor.withOpacity(0.35),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(width: 1, color: Colors.grey.withOpacity(0.2))
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 54,
                              width: 54,
                              child: Image.asset('assets/images/model.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text('Order',
                              style: GoogleFonts.lato(
                                  textStyle: Theme.of(context).textTheme.titleSmall,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(

                    width: MediaQuery.of(context).size.width / 2 - 15,
                    height: 130,
                    child: Card(
                      elevation: 5,
                      shadowColor: Theme.of(context).shadowColor.withOpacity(0.35),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(width: 1, color: Colors.grey.withOpacity(0.2))
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 54,
                              width: 54,
                              child: Image.asset('assets/images/model.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text('Customer',
                              style: GoogleFonts.lato(
                                  textStyle: Theme.of(context).textTheme.titleSmall,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),


            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: InkWell(
                        onTap: (){},
                        child: Card(
                          elevation: 5,
                          shadowColor: Theme.of(context).shadowColor.withOpacity(0.35),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(width: 1, color: Colors.grey.withOpacity(0.2))
                          ),
                          child: ListTile(
                            horizontalTitleGap: 0,
                            title: Text("enquiry@trackmytutor.com",
                              style: GoogleFonts.lato(
                                  textStyle: Theme.of(context).textTheme.titleMedium,
                                  letterSpacing: 1,
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w900
                              ),
                            ),
                            leading: Icon(Icons.email, color: Theme.of(context).colorScheme.tertiary),
                            trailing: Icon(Icons.arrow_forward),
                          ),
                        ),
                      )
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: InkWell(
                        onTap: (){},
                        child: Card(
                          elevation: 5,
                          shadowColor: Theme.of(context).shadowColor.withOpacity(0.35),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(width: 1, color: Colors.grey.withOpacity(0.2))
                          ),
                          child: ListTile(
                            horizontalTitleGap: 0,
                            title: Text("1860 123 1000",
                              style: GoogleFonts.lato(
                                  textStyle: Theme.of(context).textTheme.titleMedium,
                                  letterSpacing: 1,
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w900
                              ),
                            ),
                            leading: Icon(Icons.phone, color: Theme.of(context).colorScheme.tertiary),
                            trailing: Icon(Icons.arrow_forward),
                          ),
                        ),
                      )
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

}