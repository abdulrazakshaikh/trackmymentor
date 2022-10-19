import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trackmy_mentor/ui/login/login.dart';
import 'package:trackmy_mentor/ui/login/step_four.dart';
import 'package:trackmy_mentor/ui/login/step_one.dart';
import 'package:trackmy_mentor/ui/login/step_three.dart';
import 'package:trackmy_mentor/ui/login/step_two.dart';
import 'package:trackmy_mentor/utils/AppUtils.dart';

import '../../view_model/auth_view_model.dart';
import '../common_widgets/my_stepper/cool_stepper_reloaded.dart';
import '../common_widgets/my_stepper/src/models/cool_step.dart';
import '../common_widgets/my_stepper/src/models/cool_stepper_config.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> with TickerProviderStateMixin {
  bool _passwordVisible = false;
  int selectedIndex = 0;
  String selectedType = "teacher";
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  late iCallBack callBackStepOne;

  late List<CoolStep> steps2;
  Map step1data = {};
  Map step2data = {};
  Map step3data = {};
  Map step4data = {};

  @override
  void initState() {
    steps2 = [
      coolStep1(),
      coolStep2(),
      coolStep3(),
      coolStep4(),
    ];
  }

  CoolStep coolStep1() {
    return CoolStep(
      content: callBackStepOne = StepOne(
          (value) {
            setState(() {
              selectedType = value['type'];
              if (selectedType == 'student') {
                steps2.removeAt(2);
                steps2.removeAt(2);
              } else {
                if (steps2.length == 2) {
                  steps2.add(coolStep3());
                  steps2.add(coolStep4());
                }
              }
            });
          },
          _formKey1,
          (value) {
            print(value);
            step1data = value;
          }),
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
        bool status = await authUserDataNotifier.userSignUp(
            step1data['type'] == 'teacher' ? "2" : "1",
            step1data['username'],
            step1data['password']);
        Navigator.pop(context);
        if (status) {
          AppUtils.appToast("Step 1 completed");
          return true;
        } else {
          AppUtils.appToast(authUserDataNotifier.error!);
          return false;
        }
      },
    );
  }

  CoolStep coolStep2() {
    return CoolStep(
      content: StepTwo(_formKey2, (value) {
        step2data = value;
      }),
      isValid: () async {
        showProgressDialog();
        bool status = await authUserDataNotifier.userPersonalInfo(
          step2data['firstname'],
          step2data['lastname'],
          step2data['mobile'],
          step2data['image'],
        );
        Navigator.pop(context);
        if (status) {
          AppUtils.appToast("Step 2 completed");
          return true;
        } else {
          AppUtils.appToast(authUserDataNotifier.error!);
          return false;
        }
      },
      validation: () {
        if (!_formKey2.currentState!.validate()) {
          return 'Fill form correctly';
        } else {
          _formKey2.currentState?.save();
          return null;
        }
//          return null;
      },
    );
  }

  CoolStep coolStep3() {
    return CoolStep(
      content: StepThree(_formKey3, (value) {
        step3data = value;
      }),
      isValid: () async {
        showProgressDialog();
        bool status = await authUserDataNotifier.userQualifications(step3data);
        Navigator.pop(context);
        if (status) {
          AppUtils.appToast("Step 3 completed");
          return true;
        } else {
          AppUtils.appToast(authUserDataNotifier.error!);
          return false;
        }
      },
      validation: () {
        if (!_formKey3.currentState!.validate()) {
          return 'Fill form correctly';
        } else {
          _formKey3.currentState?.save();
          return null;
        }
//          return null;
      },
    );
  }

  CoolStep coolStep4() {
    return CoolStep(
      content: StepFour(_formKey4, (value) {
        step4data = value;
      }),
      isValid: () async {
        showProgressDialog();
        bool status = await authUserDataNotifier.userExperiences(step4data);
        Navigator.pop(context);
        if (status) {
          AppUtils.appToast("Step 4 completed");
          return true;
        } else {
          AppUtils.appToast(authUserDataNotifier.error!);
          return false;
        }
      },
      validation: () {
        if (!_formKey4.currentState!.validate()) {
          return 'Fill form correctly';
        } else {
          _formKey4.currentState?.save();
          return null;
        }
//          return null;
      },
    );
  }

  late AuthViewModel authUserDataNotifier;

  @override
  Widget build(BuildContext context) {
    authUserDataNotifier = context.watch<AuthViewModel>();
    return SafeArea(
      child: Scaffold(
        body: CoolStepper(
            isHeaderEnabled: false,
            hasRoundedCorner: false,
            onCompleted: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Login()));
            },
            contentPadding: EdgeInsets.all(15),
            config: CoolStepperConfig(
              backButton: Container(
                padding: EdgeInsets.all(5),
                child: TextButton(
                  onPressed: () {
                    print("Back");
                  },
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
                  onPressed: () {
                    print("object");
                  },
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
                  onPressed: () {},
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
            steps: steps2),
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
