import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trackmy_mentor/data/helperdata.dart';
import 'package:trackmy_mentor/model/services/app_url.dart';
import 'package:trackmy_mentor/ui/common_widgets/helper_single_selection_bottomsheet.dart';

class AddStepSubject extends StatefulWidget {
  HelperData? subjectId;
  var onSave;
  GlobalKey<FormState> formKey;

  AddStepSubject(this.subjectId, this.formKey, this.onSave);

  @override
  _AddStepSubjectState createState() => _AddStepSubjectState();
}

class _AddStepSubjectState extends State<AddStepSubject>
    with TickerProviderStateMixin {
  int selectedIndex = 0;

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.subjectId != null) {
      controller.text = widget.subjectId!.name!;
    }
    return Form(
      key: widget.formKey,
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 15),
              child: Text(
                'Subject Information',
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Select your subject'.toLowerCase(),
                      style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.titleLarge,
                          letterSpacing: 1.5,
                          fontSize:
                              MediaQuery.of(context).size.width < 321 ? 25 : 30,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15, top: 40),
                    child: Column(
                      children: [
                        Container(
                            height: 100,
                            width: 150,
                            child: Image.asset("assets/images/subject.png",
                                width: 90)),
                        SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Subject required";
                            } else {
                              return null;
                            }
                          },
                          controller: controller,
                          readOnly: true,
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              labelText: 'Subject'.toLowerCase(),
                              hintText: "Select Subject",
                              labelStyle: GoogleFonts.lato(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyMedium,
                                  letterSpacing: 1.8,
                                  fontWeight: FontWeight.w300),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.outline),
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
                                    AppUrl.subject, widget.subjectId,
                                    (selectedItem) {
                                  widget.subjectId = selectedItem;
                                  controller.text = widget.subjectId!.name!;
                                  widget.onSave(selectedItem);
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
      ),
    );
  }
}
