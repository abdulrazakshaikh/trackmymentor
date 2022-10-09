import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trackmy_mentor/login/forgot_password.dart';
import 'package:trackmy_mentor/login/login_success.dart';
import 'package:trackmy_mentor/login/signup.dart';

import '../common_widgets/bottom_navigation.dart';
import '../homepage/homepage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}
enum SingingCharacter { student, teacher }

class _LoginState extends State<Login> with TickerProviderStateMixin {
  bool _passwordVisible = false;

  
  SingingCharacter? _character = SingingCharacter.student;

  int selectedIndex = 0;
  
  

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                ),
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: Column(
                  children: [

                    Container(
                      margin: EdgeInsets.fromLTRB(0,30,0,30),
                      child: Column(
                        children: [
                          Text(
                            'Welcome Back',
                            style: GoogleFonts.lato(
                              textStyle: Theme.of(context).textTheme.headlineLarge,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.2
                            ),
                          ),
                          Text(
                            'enter login details to proceed',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                              textStyle: Theme.of(context).textTheme.titleSmall,
                              letterSpacing: 1.5),
                          ),
                        ],
                      ),
                    ),


                    Container(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 15),
                            child: Text(
                              'Who are you ?',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                textStyle: Theme.of(context).textTheme.headlineSmall,
                                letterSpacing: 1.5
                              ),
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 150,
                                  child: anyItem(0),
                                ),
                                SizedBox(width: 10.0),
                                Container(
                                  width: 150,
                                  child: anyItem(1),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),






                    // Container(
                    //   child: Column(
                    //     children: [
                    //       Container(
                    //         margin: EdgeInsets.only(bottom: 15),
                    //         child: Text(
                    //           'Who are you ?',
                    //           textAlign: TextAlign.center,
                    //           style: GoogleFonts.lato(
                    //             textStyle: Theme.of(context).textTheme.headlineSmall,
                    //             letterSpacing: 1.5
                    //           ),
                    //         ),
                    //       ),
                    //       Row(
                    //         children: [
                    //           Expanded(
                    //             child: Card(
                    //               color:
                    //               _character == SingingCharacter.student ?
                    //               Theme.of(context).colorScheme.primaryContainer :
                    //               Theme.of(context).colorScheme.background,
                    //               shape: RoundedRectangleBorder(
                    //                 borderRadius: BorderRadius.circular(10),
                    //                 side: BorderSide(width: 2,
                    //                   color:
                    //                   _character == SingingCharacter.student ?
                    //                   Theme.of(context).colorScheme.primary :
                    //                   Theme.of(context).colorScheme.outline.withOpacity(0.1)
                    //                 )
                    //               ),
                    //               child: RadioListTile<SingingCharacter>(
                    //                 contentPadding: EdgeInsets.all(15),
                    //                 controlAffinity: ListTileControlAffinity.trailing,
                    //                 title: Column(
                    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                   children: [
                    //                     Container(
                    //                       margin: EdgeInsets.only(bottom: 20),
                    //                       child: Image.asset('images/student.png',
                    //                       fit: BoxFit.contain,
                    //                       width: 48, height: 48,
                    //                       ),
                    //                     ),
                    //                     Text('Student'.toUpperCase(),
                    //                     style: GoogleFonts.lato(
                    //                       textStyle: Theme.of(context).textTheme.titleLarge,
                    //                       fontWeight: FontWeight.w500,
                    //                       fontSize: 16
                    //                     ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //                 selectedTileColor: Theme.of(context).colorScheme.primary,
                    //                 value: SingingCharacter.student,
                    //                 groupValue: _character,
                    //                 activeColor: Theme.of(context).colorScheme.primary,
                    //                 onChanged: (SingingCharacter? value) {
                    //                   setState(() {
                    //                     _character = value;
                    //                   });
                    //                 },
                    //               ),
                    //             ),
                    //           ),
                    //           Expanded(
                    //             child: Card(
                    //               color:
                    //               _character == SingingCharacter.teacher ?
                    //               Theme.of(context).colorScheme.primaryContainer :
                    //               Theme.of(context).colorScheme.background,
                    //               shape: RoundedRectangleBorder(
                    //                 borderRadius: BorderRadius.circular(10),
                    //                 side: BorderSide(width: 2,
                    //                 color:
                    //                 _character == SingingCharacter.teacher ?
                    //                   Theme.of(context).colorScheme.primary :
                    //                   Theme.of(context).colorScheme.outline.withOpacity(0.1)
                    //                 )
                    //               ),
                    //               child: RadioListTile<SingingCharacter>(
                    //                 contentPadding: EdgeInsets.all(15),
                    //                 controlAffinity: ListTileControlAffinity.trailing,
                    //                 title: Column(
                    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                   children: [
                    //                     Container(
                    //                       margin: EdgeInsets.only(bottom: 20),
                    //                       child: Image.asset('images/teacher.png',
                    //                       fit: BoxFit.contain,
                    //                       width: 48, height: 48,
                    //                       ),
                    //                     ),
                    //                     Text('Teacher'.toUpperCase(),
                    //                     style: GoogleFonts.lato(
                    //                       textStyle: Theme.of(context).textTheme.titleLarge,
                    //                       fontWeight: FontWeight.w500,
                    //                       fontSize: 16
                    //                     ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //                 selectedTileColor: Theme.of(context).colorScheme.primary,
                    //                 value: SingingCharacter.teacher,
                    //                 groupValue: _character,
                    //                 activeColor: Theme.of(context).colorScheme.primary,
                    //                 onChanged: (SingingCharacter? value) {
                    //                   setState(() {
                    //                     _character = value;
                    //                   });
                    //                 },
                    //               ),
                    //             )
                    //           ),



                    //         ],
                    //       )
                    //     ],
                    //   ),
                    // ),

                    Container(
                      padding: EdgeInsets.symmetric(vertical: 25),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 15),
                            child: TextField(
                              style: GoogleFonts.lato(
                                textStyle: Theme.of(context).textTheme.bodyMedium,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 15),
                                floatingLabelBehavior: FloatingLabelBehavior.auto,
                                labelText: 'Enter Email/Mobile'.toLowerCase(),
                                labelStyle: GoogleFonts.lato(
                                  textStyle: Theme.of(context).textTheme.bodyMedium,
                                  letterSpacing: 1.8,
                                  fontWeight: FontWeight.w300),
                                prefixIcon: Icon(Icons.login_outlined),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: TextField(
                              style: GoogleFonts.lato(
                                textStyle: Theme.of(context).textTheme.bodyMedium,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                              ),
                              obscureText: !_passwordVisible,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 15),
                                floatingLabelBehavior: FloatingLabelBehavior.auto,
                                labelText: 'Password'.toLowerCase(),
                                labelStyle: GoogleFonts.lato(
                                  textStyle: Theme.of(context).textTheme.bodyMedium,
                                  letterSpacing: 1.8,
                                  fontWeight: FontWeight.w300),
                                prefixIcon: Icon(Icons.lock_outlined),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _passwordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                                    foregroundColor: Theme.of(context).colorScheme.primary,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                      return Dialog(
                                        elevation: 2,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15)
                                        ),
                                        alignment: Alignment.center,
                                        child: ForgotPassword());
                                      });
                                  },
                                  child: Text(
                                    'Forgot Password ?',
                                    style: GoogleFonts.lato(
                                    textStyle: Theme.of(context).textTheme.titleSmall,
                                      color: Theme.of(context).colorScheme.primary,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>BottomNavigation()), (route) => false);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                                      alignment: Alignment.center,
                                    ),
                                    child: Text('Login'),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Not Registered Yet ?'.toLowerCase(),
                                  style: GoogleFonts.lato(
                                      textStyle: Theme.of(context).textTheme.labelLarge,
                                      letterSpacing: 1.2,
                                      fontWeight: FontWeight.w500),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                                    foregroundColor: Theme.of(context).colorScheme.primary,
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacement<void, void>(
                                      context, MaterialPageRoute(
                                        builder: (BuildContext context) => Signup()
                                      )
                                    );
                                  },
                                  child: Text(
                                    'Signup',
                                    style: GoogleFonts.lato(
                                    textStyle: Theme.of(context).textTheme.titleSmall,
                                      color: Theme.of(context).colorScheme.primary,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ],
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
        ),
      ),
    );
  }

Widget anyItem(int index) {
  return InkWell(
    onTap: () {
      setState(() {
        selectedIndex = index;
      });
    },
    child: Card(
      color:
      selectedIndex == index ? Theme.of(context).colorScheme.primaryContainer :
      Theme.of(context).colorScheme.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(width: 1, 
        color: 
        selectedIndex == index ? Theme.of(context).colorScheme.primary : 
        Theme.of(context).colorScheme.secondary
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 10, right: 10,
            child: Container(
              width: 20, height: 20, 
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1, 
                  color: 
                  selectedIndex == index ?
                  Colors.transparent :
                  Theme.of(context).colorScheme.secondary
                ),
                borderRadius: BorderRadius.circular(12),
                color: 
                selectedIndex == index ?
                Theme.of(context).colorScheme.primary : Colors.transparent,
              ),
              child: Icon(Icons.check, color: Colors.white, size: 12,),
            )
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  width: 64,
                  child: Image.asset(
                  index == 0 ? 'assets/images/teacher.png' : 'assets/images/student.png',
                  fit: BoxFit.contain,
                  ),
                ),
                Text(index == 0 ? 'Teacher'.toUpperCase() : 'Student'.toUpperCase(),
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.titleLarge,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1.2,
                    color: selectedIndex == index ? Theme.of(context).colorScheme.primary : null,
                  ),
                ),
              ],
            ),
          ),
          
        ],
      )
    ),
  );
}

}

