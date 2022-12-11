import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/helperdata.dart';
import '../../model/services/app_url.dart';
import '../../utils/AppUtils.dart';
import '../common_widgets/helper_single_selection_bottomsheet.dart';

abstract class iCallBack {
  void success();
}

class StepOne extends StatefulWidget implements iCallBack {
  var onChange;
  var onSave;
  GlobalKey<FormState> formKey;

  StepOne(this.onChange, this.formKey, this.onSave);

  @override
  _StepOneState createState() => _StepOneState();

  @override
  void success() {}
}

class _StepOneState extends State<StepOne> with TickerProviderStateMixin {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  int selectedIndex = 0;
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Map data = {};

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
                'Login as ?',
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
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email Address is required';
                        }
                        return null;
                      },
                      controller: usernameController,
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelText: 'Email Address'.toLowerCase(),
                        prefixIcon: Icon(Icons.email_outlined),
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
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                      controller: passwordController,
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
                            _passwordVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
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
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Confirm password is required';
                        }
                        print(value);
                        if (value != passwordController.text) {
                          return 'Password and confirm password should be same';
                        }
                        return null;
                      },
                      onSaved: (s) {
                        data = {
                          'type': (selectedIndex == 0 ? "teacher" : "student"),
                          "username": usernameController.text,
                          "password": passwordController.text,
                          "country": selectedCountry!.id!.toString(),
                          "state": selectedState!.id!.toString(),
                          "city": selectedCity!.id!.toString(),
                        };
                        widget.onSave(data);
                      },
                      controller: confirmPasswordController,
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      obscureText: !_confirmPasswordVisible,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelText: 'Confirm Password'.toLowerCase(),
                        labelStyle: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            letterSpacing: 1.8,
                            fontWeight: FontWeight.w300),
                        prefixIcon: Icon(Icons.lock_outlined),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _confirmPasswordVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                          onPressed: () {
                            setState(() {
                              _confirmPasswordVisible =
                                  !_confirmPasswordVisible;
                            });
                          },
                        ),
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
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            'Your Country',
                            style: GoogleFonts.lato(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.75,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Select Country';
                            } else {
                              return null;
                            }
                          },
                          controller: countryController,
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
                                    AppUrl.getcountry, selectedCountry,
                                    (selectedItem) {
                                  selectedCountry = selectedItem;
                                  countryController.text =
                                      selectedCountry!.name!;
                                  stateController.text = "";
                                  cityController.text = "";
                                  selectedCity = null;
                                  selectedState = null;
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
                            'Your State',
                            style: GoogleFonts.lato(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.75,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Select State';
                            } else {
                              return null;
                            }
                          },
                          controller: stateController,
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
                            if (selectedCountry == null) {
                              AppUtils.appToast("Please select country first");
                              return;
                            }
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
                                  AppUrl.getstate,
                                  selectedState,
                                  (selectedItem) {
                                    //selectedCountry = selectedItem;
                                    selectedState = selectedItem;
                                    selectedCity = null;
                                    stateController.text = selectedState!.name!;
                                    cityController.text = "";
                                    setState(() {});
                                  },
                                  selectedCountry:
                                      selectedCountry!.id.toString(),
                                );
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
                            'Your City',
                            style: GoogleFonts.lato(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.75,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Select City';
                            } else {
                              return null;
                            }
                          },
                          controller: cityController,
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
                            if (selectedState == null) {
                              AppUtils.appToast("Please select state first");
                              return;
                            }
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
                                    AppUrl.getcity, selectedCity,
                                    (selectedItem) {
                                  //selectedCountry = selectedItem;
                                  selectedCity = selectedItem;
                                  cityController.text = selectedCity!.name!;
                                  setState(() {});
                                },
                                    selectedCountry:
                                        selectedCountry!.id.toString(),
                                    selectedState:
                                        selectedState!.id.toString());
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

  HelperData? selectedCountry;
  HelperData? selectedState;
  HelperData? selectedCity;

  Widget anyItem(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          data['type'] = index == 0 ? "teacher" : "student";
          widget.onChange(data);
          selectedIndex = index;
        });
      },
      child: Card(
          color: selectedIndex == index
              ? Theme.of(context).colorScheme.primaryContainer
              : Theme.of(context).colorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
                width: 1,
                color: selectedIndex == index
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondary),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: selectedIndex == index
                              ? Colors.transparent
                              : Theme.of(context).colorScheme.secondary),
                      borderRadius: BorderRadius.circular(12),
                      color: selectedIndex == index
                          ? Theme.of(context).colorScheme.primary
                          : Colors.transparent,
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 12,
                    ),
                  )),
              Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      width: 64,
                      child: Image.asset(
                        index == 0
                            ? 'assets/images/teacher.png'
                            : 'assets/images/student.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      index == 0
                          ? 'Teacher'.toUpperCase()
                          : 'Student'.toUpperCase(),
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.titleLarge,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        letterSpacing: 1.2,
                        color: selectedIndex == index
                            ? Theme.of(context).colorScheme.primary
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
