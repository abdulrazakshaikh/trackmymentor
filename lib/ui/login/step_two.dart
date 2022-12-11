import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trackmy_mentor/data/helperdata.dart';
import 'package:trackmy_mentor/utils/AppUtils.dart';

import '../../utils/ImagePickerUtil.dart';

class StepTwo extends StatefulWidget {
  var onSave;
  GlobalKey<FormState> formKey;

  StepTwo(this.formKey, this.onSave);

  @override
  _StepTwoState createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> with TickerProviderStateMixin {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  int selectedIndex = 0;
  File? imagePath;

  HelperData? selectedCountry;
  HelperData? selectedState;
  HelperData? selectedCity;

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
                'Personal Information',
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
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Upload Profile Picture',
                            style: GoogleFonts.lato(
                                textStyle:
                                    Theme.of(context).textTheme.labelLarge,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Stack(children: [
                          InkWell(
                            onTap: () {
                              ImagePickerUtil.showPicker(context, (File image) {
                                setState(() {
                                  imagePath = image;
                                  /*paphoto_image_g = image;
                                      widget.nominee.GuardProofImage =
                                          photo_image_g.path;*/
                                });
                              });
                            },
                            child: imagePath == null
                                ? CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/images/default.jpg'),
                                    radius: 54,
                                  )
                                : CircleAvatar(
                                    backgroundImage: FileImage(imagePath!),
                                    radius: 54,
                                  ),
                          ),
                          Positioned(
                            right: 4,
                            bottom: 4,
                            child: ClipOval(
                              child: Material(
                                color: Theme.of(context)
                                    .colorScheme
                                    .tertiary, // Button color
                                child: InkWell(
                                  splashColor: Theme.of(context)
                                      .colorScheme
                                      .secondary, // Splash color
                                  onTap: () {
                                    ImagePickerUtil.showPicker(context,
                                        (File image) {
                                      setState(() {
                                        imagePath = image;
                                        /*paphoto_image_g = image;
                                      widget.nominee.GuardProofImage =
                                          photo_image_g.path;*/
                                      });
                                    });
                                  },
                                  child: SizedBox(
                                      width: 32,
                                      height: 32,
                                      child: Icon(
                                        Icons.edit_outlined,
                                        size: 20,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                            ),
                          )
                        ]),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: firstNameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Firstname is required';
                                } else {
                                  if (imagePath == null) {
                                    AppUtils.appToast("Please select image");
                                    return " ";
                                  }
                                  return null;
                                }
                              },
                              style: GoogleFonts.lato(
                                textStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(15),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                labelText: 'First Name'.toLowerCase(),
                                labelStyle: GoogleFonts.lato(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyMedium,
                                    letterSpacing: 1.8,
                                    fontWeight: FontWeight.w300),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .outline),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 1),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 1),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 1),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              controller: lastNameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Lastname is required';
                                } else {
                                  return null;
                                }
                              },
                              style: GoogleFonts.lato(
                                textStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(15),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                labelText: 'Last Name'.toLowerCase(),
                                labelStyle: GoogleFonts.lato(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyMedium,
                                    letterSpacing: 1.8,
                                    fontWeight: FontWeight.w300),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .outline),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 1),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 1),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      controller: mobileNumberController,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Mobile number is required';
                        }
                        if (value.length < 10) {
                          return 'Please enter valid mobile number ';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        widget.onSave({
                          "firstname": firstNameController.text,
                          "lastname": lastNameController.text,
                          "mobile": mobileNumberController.text,
                          "image": imagePath!.path,
                        });
                      },
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelText: 'Mobile Number'.toLowerCase(),
                        labelStyle: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
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
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              width: 1),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              width: 1),
                        ),
                      ),
                    ),
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
