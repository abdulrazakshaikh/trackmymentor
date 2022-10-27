import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trackmy_mentor/data/helperdata.dart';
import 'package:trackmy_mentor/view_model/helper_view_model.dart';

import '../../model/services/app_url.dart';

class AddStepTwo extends StatefulWidget {
  HelperData? classId;
  var onSave;

  AddStepTwo(this.classId, this.onSave);

  @override
  _AddStepTwoState createState() => _AddStepTwoState();
}

class _AddStepTwoState extends State<AddStepTwo> with TickerProviderStateMixin {
  List<HelperData> helperDataList = [];
  late HelperViewModel helperViewModel;

  var slider = 1.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var a = await helperViewModel.getCategory(AppUrl.classes);
      if (helperViewModel.listData != null) {
        helperDataList = helperViewModel.listData;
        if (widget.classId != null) {
          helperDataList.forEach((element) {
            if (widget.classId!.id! == element.id) {
              element.isSelected = true;
              slider = helperDataList.indexOf(element) + 1.toDouble();
            }
          });
        } else {
          widget.classId = helperDataList[0];
          widget.onSave(widget.classId);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    helperViewModel = context.watch<HelperViewModel>();
    if (helperDataList.length > 0)
      widget.classId = helperDataList[slider.round() - 1];
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Text(
              'Class Information',
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
                    'Select your class standard'.toLowerCase(),
                    style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.titleLarge,
                        letterSpacing: 1.5,
                        fontSize:
                            MediaQuery.of(context).size.width < 321 ? 30 : 29,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                helperViewModel.isLoading
                    ? Container(
                        margin: EdgeInsets.only(top: 100),
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        margin: EdgeInsets.only(bottom: 15, top: 20),
                        child: Column(
                          children: [
                            Image.asset("assets/images/school.png", width: 150),
                            SizedBox(
                              height: 40,
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context)
                                  .copyWith(trackHeight: 10),
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 15),
                                child: Slider(
                                  min: 10,
                                  max: helperDataList.length * 10,
                                  divisions: helperDataList.length,
                                  value: slider * 10,
                                  onChanged: (value) {
                                    setState(() {
                                      slider = value / 10;
                                      widget.classId =
                                          helperDataList[(slider).round()];
                                      widget.onSave(widget.classId);
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            SizedBox(
                              width: 200,
                              height: 60,
                              child: Container(
                                height: 60.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    widget.classId!.name!.toString() +
                                        " Class ",
                                    style: GoogleFonts.lato(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                        letterSpacing: 1.5,
                                        fontSize:
                                            MediaQuery.of(context).size.width <
                                                    321
                                                ? 16
                                                : 18,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),
                            )
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
