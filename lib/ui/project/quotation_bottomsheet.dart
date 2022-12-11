import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:trackmy_mentor/data/projectdata.dart';
import 'package:trackmy_mentor/utils/AppUtils.dart';

import '../../utils/ImagePickerUtil.dart';
import '../../view_model/quotation_view_model.dart';

class QuotationBottomSheet extends StatefulWidget {
  ProjectData projectData;
  var status;

  QuotationBottomSheet(this.projectData, this.status);

  @override
  _QuotationBottomSheetState createState() => _QuotationBottomSheetState();
}

class _QuotationBottomSheetState extends State<QuotationBottomSheet>
    with TickerProviderStateMixin {
  TextEditingController priceTextEditingController = TextEditingController();
  TextEditingController commentTextEditingController = TextEditingController();
  TextEditingController lastDateTextEditingController = TextEditingController();
  String? selectedImage;
  String? selectedDatee;
  DateTime selectedDate = DateTime.now();
  final _formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey1,
      child: SingleChildScrollView(
        child: Container(
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
                child: Text(
                  'Add your Quotation',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: priceTextEditingController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Price Required";
                            } else {
                              return null;
                            }
                          },
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
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: TextFormField(
                          controller: commentTextEditingController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Comment Required";
                            } else {
                              return null;
                            }
                          },
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
                      Container(
                        margin: EdgeInsets.only(bottom: 15, top: 0),
                        child: TextFormField(
                          controller: lastDateTextEditingController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Select last date";
                            } else {
                              return null;
                            }
                          },
                          readOnly: true,
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          onTap: () {
                            _selectDate(context);
                          },
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            labelText: 'Last Date to Submit'.toLowerCase(),
                            labelStyle: GoogleFonts.lato(
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
                      InkWell(
                        onTap: () {
                          ImagePickerUtil.showPicker(context, (File image) {
                            setState(() {
                              selectedImage = image.path;
                              // imagePath = image;
                              /*paphoto_image_g = image;
                                        widget.nominee.GuardProofImage =
                                            photo_image_g.path;*/
                            });
                          });
                        },
                        child: Container(
                            height: 54,
                            padding: EdgeInsets.all(10),
                            width: double.infinity,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.2),
                                borderRadius: BorderRadius.circular(4)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.upload_file,
                                    size: 24,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                                SizedBox(width: 5),
                                Text(
                                  selectedImage == null
                                      ? 'Upload File'
                                      : "Upload Again",
                                  style: GoogleFonts.lato(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              selectedImage == null
                  ? Container()
                  : Container(
                      child: Image.file(
                        File(selectedImage!),
                        width: 100,
                        height: 100,
                      ),
                    ),
              Container(
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        width: 1, color: Theme.of(context).dividerColor),
                  ),
                ),
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          widget.status(false);
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                              color: Theme.of(context).colorScheme.secondary),
                          foregroundColor:
                              Theme.of(context).colorScheme.secondary,
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          alignment: Alignment.center,
                        ),
                        child: Text(
                          'Cancel',
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey1.currentState!.validate()) {
                            if (selectedImage == null) {
                              AppUtils.appToast("Please select image");
                              return;
                            }
                            bool status = await QuotationViewModel()
                                .addQuotation(
                                    project_id: widget.projectData.id!,
                                    price: priceTextEditingController.text,
                                    comment: commentTextEditingController.text,
                                    image: selectedImage!,
                                    last_date: selectedDatee!);
                            if (status) {
                              widget.status(true);
                              Navigator.pop(context);
                            } else {
                              AppUtils.appToast("Failed add quotation");
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          foregroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
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
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    setState(() {
      lastDateTextEditingController.text =
          DateFormat('dd-MM-yyyy').format(picked!);
      selectedDatee = DateFormat('yyyy-MM-dd').format(picked);
      selectedDate = picked;
    });
  }
}
