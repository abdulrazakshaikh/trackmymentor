import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../data/helperdata.dart';
import '../../model/services/app_url.dart';
import '../../utils/AppUtils.dart';
import '../../view_model/auth_view_model.dart';
import '../../view_model/helper_view_model.dart';

class HelperSingleSelectionBottomSheet extends StatefulWidget {
  String type;
  HelperData? selectedItem1;
  String selectedState;
  String selectedCountry;
  var takeSelectedItem;
  bool apiCallRequired = false;

  HelperSingleSelectionBottomSheet(
      this.type, this.selectedItem1, this.takeSelectedItem,
      {this.apiCallRequired = false,
      this.selectedState = "",
      this.selectedCountry = ""});

  @override
  _HelperSingleSelectionBottomSheetState createState() =>
      _HelperSingleSelectionBottomSheetState();
}

class _HelperSingleSelectionBottomSheetState
    extends State<HelperSingleSelectionBottomSheet>
    with TickerProviderStateMixin {
  List<HelperData> helperDataList = [];
  late HelperViewModel helperViewModel;
  late AuthViewModel authViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedItem = widget.selectedItem1;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.type == AppUrl.getcity ||
          widget.type == AppUrl.getstate ||
          widget.type == AppUrl.getcountry) {
        var a = await helperViewModel.getLocationDetails(widget.type,
            country_id: widget.selectedCountry, state_id: widget.selectedState);
      } else
        var a = await helperViewModel.getCategory(widget.type);
      setValues();
    });
  }

  HelperData? selectedItem;

  void setValues({String search = ""}) {
    if (helperViewModel.listData != null) {
      helperDataList = helperViewModel.listData;
      if (selectedItem != null)
        helperDataList.forEach((element) {
          if (selectedItem!.id == element.id) {
            selectedItem = element;
          }
        });
      helperDataList = helperDataList.where((element) {
        if (search.isEmpty) {
          return true;
        } else {
          return element.name!.toUpperCase().contains(search.toUpperCase());
        }
      }).toList();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    helperViewModel = context.watch<HelperViewModel>();
    authViewModel = context.watch<AuthViewModel>();
    return Container(
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
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              // color: Theme.of(context).colorScheme.surface,
            ),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextField(
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                        onChanged: (value) {
                          if (value.isEmpty) {
                            setValues();
                          } else {
                            setValues(search: value);
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          hintText: 'Search for ${widget.type}'.toLowerCase(),
                          hintStyle: GoogleFonts.lato(
                              textStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              letterSpacing: 1.8,
                              fontWeight: FontWeight.w300),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.outline),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1),
                          ),
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'Select an ${widget.type}',
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: helperViewModel.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : helperDataList.length == 0
                    ? Center(
                        child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                                "${helperViewModel.error == null || helperViewModel.error!.isEmpty ? "No search record found" : helperViewModel.error}")),
                      )
                    : ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: ListView.builder(
                                primary: false,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: helperDataList == null
                                    ? 0
                                    : helperDataList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  HelperData item = helperDataList[index];
                                  return ListTileTheme(
                                    horizontalTitleGap: 0,
                                    child: RadioListTile<HelperData>(
                                      dense: true,
                                      title: Text(
                                        "${item.name}",
                                        style: GoogleFonts.lato(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                            letterSpacing: 1.5,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      activeColor:
                                          Theme.of(context).colorScheme.primary,
                                      // checkColor: Theme.of(context).colorScheme.onPrimary,
                                      groupValue: selectedItem,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      value: item,
                                      onChanged: (HelperData? value) {
                                        setState(() {
                                          selectedItem = value;
                                        });
                                      },
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              border: Border(
                top:
                    BorderSide(width: 1, color: Theme.of(context).dividerColor),
              ),
            ),
            padding: EdgeInsets.all(15),
            child: authViewModel.isLoading
                ? CircularProgressIndicator()
                : Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                color: Theme.of(context).colorScheme.secondary),
                            foregroundColor:
                                Theme.of(context).colorScheme.secondary,
                            padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                            if (widget.apiCallRequired) {
                              bool status = false;
                              if (widget.type == AppUrl.degree) {
                                status = await authViewModel.updateUserInfo(
                                    degree: selectedItem!.id!);
                              } else if (widget.type == "Experience") {
                                status = await authViewModel.updateUserInfo(
                                    yearOfEx: selectedItem!.id!);
                              }
                              if (!status) {
                                AppUtils.appToast(authViewModel.error ??
                                    "Failed updated,please try again");
                                return;
                              }
                            }
                            widget.takeSelectedItem(selectedItem);
                            Navigator.pop(context);
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
                          child: Text('Apply'),
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
