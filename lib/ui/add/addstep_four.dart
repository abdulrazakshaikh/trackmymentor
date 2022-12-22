import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:trackmy_mentor/utils/AppUtils.dart';
import 'package:trackmy_mentor/utils/ImagePickerUtil.dart';

import '../../model/storage/shared_prefs.dart';

class AddStepFour extends StatefulWidget {
  Map? projectInfoMap;
  GlobalKey<FormState> formKey;
  var onSave;

  AddStepFour(this.projectInfoMap, this.formKey, this.onSave);

  @override
  _AddStepFourState createState() => _AddStepFourState();
}

class _AddStepFourState extends State<AddStepFour>
    with TickerProviderStateMixin {
  TextEditingController projectTitleController = TextEditingController();
  TextEditingController projectDescriptionController = TextEditingController();
  TextEditingController lastDatController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  late String _selectedDate;
  List<File> imageList = [];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        lastDatController.text = DateFormat('dd-MM-yyyy').format(picked);
        _selectedDate = DateFormat('yyyy-MM-dd').format(picked);
        selectedDate = picked;
        widget.onSave({
          "title": projectTitleController.text,
          "description": projectDescriptionController.text,
          "lastdate": _selectedDate,
          "imagelist": imageList
        });
        print({
          "title": projectTitleController.text,
          "description": projectDescriptionController.text,
          "lastdate": _selectedDate,
          "imagelist": imageList
        });
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.projectInfoMap);
    if (widget.projectInfoMap != null) {
      if (widget.projectInfoMap!['title'] != null)
        projectTitleController.text = widget.projectInfoMap!["title"];
      if (widget.projectInfoMap!['description'] != null)
        projectDescriptionController.text =
        widget.projectInfoMap!["description"];
      if (widget.projectInfoMap!['lastdate'] != null)
        lastDatController.text = widget.projectInfoMap!["lastdate"];
      if (widget.projectInfoMap!['imagelist'] != null)
        imageList = widget.projectInfoMap!['imagelist'];
    }
    print(projectTitleController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 15),
              child: Text(
                'Project Information',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: Theme
                      .of(context)
                      .textTheme
                      .headlineSmall,
                  letterSpacing: 1.5,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: TextFormField(
                        onChanged: (value) {
                          widget.onSave({
                            "title": value,
                            "description": projectDescriptionController.text,
                            "lastdate": _selectedDate,
                            "imagelist": imageList
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "project title required";
                          } else {
                            return null;
                          }
                        },
                        controller: projectTitleController,
                        style: GoogleFonts.lato(
                          textStyle: Theme
                              .of(context)
                              .textTheme
                              .bodyMedium,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          labelText: 'Project Title'.toLowerCase(),
                          labelStyle: GoogleFonts.lato(
                              textStyle: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyMedium,
                              letterSpacing: 1.8,
                              fontWeight: FontWeight.w300),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .outline),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .primary,
                                width: 1),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .primary,
                                width: 1),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .primary,
                                width: 1),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: TextFormField(
                        onChanged: (value) {
                          print(projectTitleController.text);
                          print(value);
                          widget.onSave({
                            "title": projectTitleController.text,
                            "description": value,
                            "lastdate": _selectedDate,
                            "imagelist": imageList
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "project description required";
                          } else {
                            return null;
                          }
                        },
                        controller: projectDescriptionController,
                        style: GoogleFonts.lato(
                          textStyle: Theme
                              .of(context)
                              .textTheme
                              .bodyMedium,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                        maxLines: 4,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          labelText: 'Project Description'.toLowerCase(),
                          labelStyle: GoogleFonts.lato(
                              textStyle: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyMedium,
                              letterSpacing: 1.8,
                              fontWeight: FontWeight.w300),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .outline),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .primary,
                                width: 1),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .primary,
                                width: 1),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .primary,
                                width: 1),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "project last date required";
                          } else {
                            if (imageList.length == 0) {
                              AppUtils.appToast("Please project image ");
                              return " ";
                            } else {
                              return null;
                            }
                          }
                        },
                        onSaved: (value) {
                          widget.onSave({
                            "title": projectTitleController.text,
                            "description": projectDescriptionController.text,
                            "lastdate": _selectedDate,
                            "imagelist": imageList
                          });
                        },
                        controller: lastDatController,
                        readOnly: true,
                        style: GoogleFonts.lato(
                          textStyle: Theme
                              .of(context)
                              .textTheme
                              .bodyMedium,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                        onTap: () {
                          _selectDate(context);
                        },
                        onChanged: (value) {
                          widget.onSave({
                            "title": projectTitleController.text,
                            "description": projectDescriptionController.text,
                            "lastdate": _selectedDate,
                            "imagelist": imageList
                          });
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          labelText: 'Last Date to Submit'.toLowerCase(),
                          labelStyle: GoogleFonts.lato(
                              textStyle: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyMedium,
                              letterSpacing: 1.8,
                              fontWeight: FontWeight.w300),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .outline),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .primary,
                                width: 1),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .primary,
                                width: 1),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .primary,
                                width: 1),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        ImagePickerUtil.showPicker(context, (File image) {
                          setState(() {
                            imageList.add(image);
                            // imagePath = image;
                            /*paphoto_image_g = image;
                                        widget.nominee.GuardProofImage =
                                            photo_image_g.path;*/
                          });
                        });
                      },
                      child: Container(
                          height: 100,
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.2),
                              borderRadius: BorderRadius.circular(4)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.upload_file,
                                  size: 44,
                                  color:
                                  Theme
                                      .of(context)
                                      .colorScheme
                                      .secondary),
                              SizedBox(height: 5),
                              Text(
                                'Upload Project Images',
                                style: GoogleFonts.lato(
                                    textStyle:
                                    Theme
                                        .of(context)
                                        .textTheme
                                        .labelLarge,
                                    letterSpacing: 1.5,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          // childAspectRatio: (1 / .4),
                          crossAxisSpacing: 4.0,
                          children: List.generate(imageList.length, (index) {
                            return Stack(children: [
                              Container(
                            decoration: BoxDecoration(
                            border: Border.all(),
                            ),
                                child: ClipRRect(
                                  child: Image.file(imageList[index],width: 160,height: 150,fit: BoxFit.cover),
                                ),
                              ),
                              Positioned(
                                right: 10,
                                bottom: 153,
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.red, // Button color
                                    child: InkWell(
                                      splashColor: Theme.of(context)
                                          .colorScheme
                                          .secondary, // Splash color
                                      onTap: () async {
                                        imageList.removeAt(index);
                                        setState(() {

                                        });
                                      },
                                      child: SizedBox(
                                          width: 32,
                                          height: 32,
                                          child: Icon(
                                            Icons.delete,
                                            size: 20,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                ),
                              )
                            ]);
                          })),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
