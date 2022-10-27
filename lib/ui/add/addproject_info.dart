import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trackmy_mentor/data/helperdata.dart';
import 'package:trackmy_mentor/ui/add/addstep_four.dart';
import 'package:trackmy_mentor/ui/add/addstep_one.dart';
import 'package:trackmy_mentor/ui/add/addstep_subject.dart';
import 'package:trackmy_mentor/ui/add/addstep_two.dart';
import 'package:trackmy_mentor/ui/common_widgets/bottom_navigation.dart';
import 'package:trackmy_mentor/utils/AppUtils.dart';
import 'package:trackmy_mentor/view_model/project_view_model.dart';

import '../common_widgets/my_stepper/cool_stepper_reloaded.dart';
import '../common_widgets/my_stepper/src/models/cool_step.dart';
import '../common_widgets/my_stepper/src/models/cool_stepper_config.dart';

class AddProjectInfo extends StatefulWidget {
  @override
  _AddProjectInfoState createState() => _AddProjectInfoState();
}

class _AddProjectInfoState extends State<AddProjectInfo>
    with TickerProviderStateMixin {
  late ProjectViewModel projectViewModel;
  bool _passwordVisible = false;
  int selectedIndex = 0;
  HelperData? categoryId;
  HelperData? classId;
  HelperData? subjectId;
  Map? projectInfoMap;
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  late List<CoolStep> setUps;
  bool isCompleted = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUps = [
      CoolStep(
          content: AddStepOne(categoryId, (HelperData data) {
        categoryId = data;
      })),
      CoolStep(
          content: AddStepTwo(classId, (HelperData data) {
        classId = data;
      })),
      CoolStep(
        content: AddStepSubject(subjectId, _formKey2, (HelperData data) {
          this.subjectId = data;
        }),
        validation: () {
          if (!_formKey2.currentState!.validate()) {
            return 'Fill form correctly';
          } else {
            return null;
          }
        },
      ),
      CoolStep(
          content: AddStepFour(
            projectInfoMap,
            _formKey1,
            (data) {
              print("object");
              print(data);
              setState(() {
                projectInfoMap = data;
              });
            },
          ),
          validation: () {
            if (!_formKey1.currentState!.validate()) {
              return 'Fill form correctly';
            } else {
              _formKey1.currentState?.save();
              return null;
            }
//          return null;
          },
          isValid: () async {
            showProgressDialog();
            var status = await projectViewModel.postProjectInfo(
                subjectId!, categoryId!, classId!, projectInfoMap!);
            // Navigator.of(context);
            if (status) {
              var status1 =
                  await projectViewModel.postProjectImage(projectInfoMap!);
              if (status1) {
                isCompleted = true;
                return true;
              } else {
                AppUtils.appToast(projectViewModel.error.toString());
                return false;
              }
            } else {
              AppUtils.appToast(projectViewModel.error.toString());
              return false;
            }
          }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    projectViewModel = context.watch<ProjectViewModel>();

    print("objectobjectobjectobject");
    print(projectInfoMap);
    return SafeArea(
      child: Scaffold(
        body: CoolStepper(
            hasBackButton: true,
            isHeaderEnabled: false,
            hasRoundedCorner: false,
            onCompleted: () {
              AppUtils.appToast("Project Added Successfully");
              Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => BottomNavigation()));
            },
            contentPadding: EdgeInsets.all(10),
            config: CoolStepperConfig(
              backButton: Container(
                padding: EdgeInsets.all(5),
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back,
                          color: Theme.of(context).colorScheme.secondary),
                      SizedBox(width: 5),
                      Text(
                        'Back'.toUpperCase(),
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.titleSmall,
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    alignment: Alignment.center,
                    foregroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              nextButton: Container(
                padding: EdgeInsets.all(5),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        'Next'.toUpperCase(),
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.titleSmall,
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.arrow_forward,
                        color: Theme.of(context).colorScheme.onPrimary,
                      )
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    alignment: Alignment.center,
                  ),
                ),
              ),
              finishButton: Container(
                padding: EdgeInsets.all(5),
                child: ElevatedButton(
                  onPressed: () {
                    print("sdvjsdbvdkjv");
                    Navigator.pushReplacement<void, void>(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                BottomNavigation()));
                  },
                  child: Row(
                    children: [
                      Text(
                        'Submit'.toUpperCase(),
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.titleSmall,
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.send,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    alignment: Alignment.center,
                  ),
                ),
              ),
              stepColor: Theme.of(context).colorScheme.background,
              headerColor:
              Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              stepOfTextStyle: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.labelSmall,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w500,
              ),
              titleTextStyle: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.headlineSmall,
                letterSpacing: 1.5,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
              subtitleTextStyle: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.titleSmall,
                letterSpacing: 1.5,
              ),
            ),
            steps: setUps),
      ),
    );
  }

  void showProgressDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              alignment: Alignment.center,
              child: Container(
                height: 150,
                child: Center(
                  child: Container(
                      height: 70,
                      width: 150,
                      child: Column(
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Please wait...",
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      )),
                ),
              ));
        });
  }
}
