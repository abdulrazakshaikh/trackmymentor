import 'package:cool_stepper_reloaded/cool_stepper_reloaded.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trackmy_mentor/ui/login/login.dart';
import 'package:trackmy_mentor/ui/login/step_four.dart';
import 'package:trackmy_mentor/ui/login/step_one.dart';
import 'package:trackmy_mentor/ui/login/step_three.dart';
import 'package:trackmy_mentor/ui/login/step_two.dart';


class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> with TickerProviderStateMixin {
  bool _passwordVisible = false;
  int selectedIndex = 0;
  String selectedType="teacher";
  @override
  Widget build(BuildContext context) {
    var steps2 = [
            CoolStep(
              content: StepOne((value){
                setState(() {
                    selectedType=value;
                });
              })
            ),
            CoolStep(
              content: StepTwo()
            ),
            CoolStep(
              content: StepThree()
            ),
            CoolStep(
              content: StepFour()
            ),
            /*CoolStep(
              content: StepFive()
            ),*/
          ];
    if(selectedType=='student'){
      steps2.removeAt(2);
      steps2.removeAt(2);
    }
    return SafeArea(
      child: Scaffold(
        body: CoolStepper(
          isHeaderEnabled: false,
          hasRoundedCorner: false,
          onCompleted: (){
            Navigator.push(
              context, MaterialPageRoute(
                builder: (BuildContext context) => Login()
              )
            );
          },
          contentPadding: EdgeInsets.all(15),
          config: CoolStepperConfig(
            backButton: Container(
              padding: EdgeInsets.all(5),
              child: TextButton(
                onPressed: (){},
                child: Row(
                  children: [
                    Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.secondary),
                    SizedBox(width: 5),
                    Text('Back'.toUpperCase(),
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
                onPressed: (){},
                child: Row(
                  children: [
                    Text('Next'.toUpperCase(),
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.titleSmall,
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_forward, color: Theme.of(context).colorScheme.onPrimary,)
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
                onPressed: (){},
                child: Row(
                  children: [
                    Text('Submit'.toUpperCase(),
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.titleSmall,
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.send, color: Theme.of(context).colorScheme.onPrimary,),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  alignment: Alignment.center,
                ),
              ),
            ),
            stepColor: Theme.of(context).colorScheme.background,
            headerColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
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
          steps: steps2
        ),
      ),
    );
  }

}
