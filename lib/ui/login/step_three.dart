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

class StepThree extends StatefulWidget {
  @override
  _StepThreeState createState() => _StepThreeState();
}

class _StepThreeState extends State<StepThree> with TickerProviderStateMixin {
  List<HelperData> selectedLa = [];
  List<HelperData> selectedCourse = [];
  HelperData? selectedDegree;
  TextEditingController laController = TextEditingController();
  TextEditingController coController = TextEditingController();
  TextEditingController degreeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    laController.text = "";
    coController.text = "";
    degreeController.text = "";
    selectedLa.forEach((element) {
      laController.text += element.name.toString() +
          "${selectedLa.indexOf(element) == selectedLa.length - 1 ? "" : ","}";
    });
    selectedCourse.forEach((element) {
      coController.text += element.name.toString() +
          "${selectedCourse.indexOf(element) == selectedCourse.length - 1 ? "" : ","}";
    });
    degreeController.text = selectedDegree?.name ?? "";
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
                        child: Text(
                          'Your Degree',
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                            letterSpacing: 1.75,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      TextField(
                        controller: degreeController,
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
                                  AppUrl.degree, selectedDegree,
                                  (selectedItem) {
                                selectedDegree = selectedItem;
                                setState(() {});
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
                          'Comfortable in Which Language',
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                            letterSpacing: 1.75,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      TextField(
                        controller: laController,
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
                                  AppUrl.language, selectedLa, (selectedItem) {
                                selectedLa = selectedItem as List<HelperData>;
                                setState(() {});
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
                          'Specialize in which Course',
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                            letterSpacing: 1.75,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      TextField(
                        controller: coController,
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
                              //return HelperMultipleSelectionBottomSheet(AppUrl.courses);
                              return HelperMultipleSelectionBottomSheet(
                                  AppUrl.courses, selectedCourse,
                                  (selectedItem) {
                                selectedCourse =
                                    selectedItem as List<HelperData>;
                                setState(() {});
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
