import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trackmy_mentor/model/services/app_url.dart';

import '../../data/helperdata.dart';
import '../common_widgets/helper_multiple_selection_bottomsheet.dart';
import '../common_widgets/helper_single_selection_bottomsheet.dart';

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

  List<HelperData> selectedCategory = [];
  List<HelperData> selectedClass = [];
  List<HelperData> selectedSubject = [];
  TextEditingController categoryController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController yearExController = TextEditingController();
  HelperData? selectedYearEx;

  @override
  Widget build(BuildContext context) {
    categoryController.text = "";
    classController.text = "";
    subjectController.text = "";
    selectedCategory.forEach((element) {
      categoryController.text += element.name.toString() +
          "${selectedCategory.indexOf(element) == selectedCategory.length - 1 ? "" : ","}";
    });
    selectedClass.forEach((element) {
      classController.text += element.name.toString() +
          "${selectedClass.indexOf(element) == selectedClass.length - 1 ? "" : ","}";
    });
    selectedSubject.forEach((element) {
      subjectController.text += element.name.toString() +
          "${selectedSubject.indexOf(element) == selectedSubject.length - 1 ? "" : ","}";
    });
    yearExController.text = selectedYearEx?.name ?? "";
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
                        child: Text(
                          'No. of Years Experience',
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                            letterSpacing: 1.75,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      TextField(
                        controller: yearExController,
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
                                textStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                                letterSpacing: 1.8,
                                fontWeight: FontWeight.w300),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.outline),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 1),
                            ),
                            suffixIcon: Icon(Icons.arrow_drop_down)),
                        onTap: () {
                          showModalBottomSheet(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return HelperSingleSelectionBottomSheet(
                                  "Experience", selectedYearEx, (selectedItem) {
                                setState(() {
                                  selectedYearEx = selectedItem;
                                });
                              });
                            },
                          );
                        },
                      ),
                      // DropdownButtonFormField(
                      //   style: GoogleFonts.lato(
                      //     textStyle: Theme.of(context).textTheme.bodyMedium,
                      //     fontWeight: FontWeight.w600,
                      //     letterSpacing: 1.2,
                      //   ),
                      //   decoration: InputDecoration(
                      //     contentPadding: EdgeInsets.all(10),
                      //     floatingLabelBehavior: FloatingLabelBehavior.auto,
                      //     hintText: 'Select an Options'.toLowerCase(),
                      //     hintStyle: GoogleFonts.lato(
                      //       textStyle: Theme.of(context).textTheme.bodyMedium,
                      //       letterSpacing: 1.8,
                      //       fontWeight: FontWeight.w300),

                      //     enabledBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                      //     ),
                      //     focusedBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
                      //     ),
                      //   ),
                      //   items: _options.map((String value) {

                      //     return DropdownMenuItem<String>(
                      //       value: value,
                      //       child: Text(value,
                      //       style: GoogleFonts.lato(
                      //         textStyle: Theme.of(context).textTheme.bodyMedium,
                      //         fontWeight: FontWeight.w600,
                      //         letterSpacing: 1.2,
                      //       ),
                      //       ),
                      //     );
                      //   }).toList(),
                      //   focusColor: Colors.white,
                      //   onChanged: (String? newValue){
                      //     setState(() {
                      //       selectOptions = newValue!;
                      //     });
                      //   },
                      // ),
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
                        child: Text(
                          'Select Category',
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                            letterSpacing: 1.75,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      TextField(
                        controller: categoryController,
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
                                textStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                                letterSpacing: 1.8,
                                fontWeight: FontWeight.w300),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.outline),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 1),
                            ),
                            suffixIcon: Icon(Icons.arrow_drop_down)),
                        onTap: () {
                          showModalBottomSheet(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return HelperMultipleSelectionBottomSheet(
                                  AppUrl.category, selectedCategory,
                                  (selectedCat) {
                                setState(() {
                                  selectedCategory = selectedCat;
                                });
                              });
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
                        child: Text(
                          'Choose a Class',
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                            letterSpacing: 1.75,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      TextField(
                        controller: classController,
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
                                textStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                                letterSpacing: 1.8,
                                fontWeight: FontWeight.w300),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.outline),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 1),
                            ),
                            suffixIcon: Icon(Icons.arrow_drop_down)),
                        onTap: () {
                          showModalBottomSheet(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return HelperMultipleSelectionBottomSheet(
                                  AppUrl.classes, selectedClass, (selectedCat) {
                                setState(() {
                                  selectedClass = selectedCat;
                                });
                              });
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
                        child: Text(
                          'Choose Subject',
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                            letterSpacing: 1.75,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      TextField(
                        controller: subjectController,
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
                                textStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                                letterSpacing: 1.8,
                                fontWeight: FontWeight.w300),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.outline),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 1),
                            ),
                            suffixIcon: Icon(Icons.arrow_drop_down)),
                        onTap: () {
                          showModalBottomSheet(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return HelperMultipleSelectionBottomSheet(
                                  AppUrl.subject, selectedSubject,
                                  (selectedCat) {
                                setState(() {
                                  selectedSubject = selectedCat;
                                });
                              });
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
