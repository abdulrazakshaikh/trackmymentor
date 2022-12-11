import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trackmy_mentor/data/helperdata.dart';
import 'package:trackmy_mentor/model/services/app_url.dart';
import 'package:trackmy_mentor/view_model/auth_view_model.dart';

import '../../utils/AppUtils.dart';
import '../../view_model/helper_view_model.dart';

class HelperMultipleSelectionBottomSheet extends StatefulWidget {
  String type;
  List<HelperData> selectedItem;
  var takeSelectedItem;
  bool apiCallRequired = false;

  HelperMultipleSelectionBottomSheet(
      this.type, this.selectedItem, this.takeSelectedItem,
      {this.apiCallRequired = false});

  @override
  _HelperMultipleSelectionBottomSheetState createState() =>
      _HelperMultipleSelectionBottomSheetState();
}

class _HelperMultipleSelectionBottomSheetState
    extends State<HelperMultipleSelectionBottomSheet>
    with TickerProviderStateMixin {
  //bool _value = false;
  List<HelperData> helperDataList = [];
  late HelperViewModel helperViewModel;
  late AuthViewModel authViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var a = await helperViewModel.getCategory(widget.type);
      setValues();
    });
  }

  void setValues({String search = ""}) {
    helperViewModel.isLoadingg = true;
    if (helperViewModel.listData != null) {
      helperDataList = helperViewModel.listData;
      helperDataList.forEach((element) {
        widget.selectedItem.forEach((element1) {
          if (element1.id == element.id) {
            element.isSelected = true;
          }
        });
      });
      helperDataList = helperDataList.where((element) {
        if (search.isEmpty) {
          return true;
        } else {
          return element.name!.toUpperCase().contains(search.toUpperCase());
        }
      }).toList();
      widget.selectedItem = [];
      helperViewModel.isLoadingg = false;
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
                          'Select ${widget.type}',
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
                                    child: CheckboxListTile(
                                      title: Text(
                                        item.name!,
                                        style: GoogleFonts.lato(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                            letterSpacing: 1.5,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      activeColor:
                                          Theme.of(context).colorScheme.primary,
                                      checkColor: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      selected: item.isSelected,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      value: item.isSelected,
                                      onChanged: (value) {
                                        setState(() {
                                          item.isSelected = value!;
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
                            var selectedItem = helperDataList.where((element) {
                              return element.isSelected;
                            }).toList();
                            if (selectedItem.length == 0) {
                              AppUtils.appToast(
                                  "Please select at least one option");
                              return;
                            } else {
                              if (widget.apiCallRequired) {
                                String id = "";
                                selectedItem.forEach((element) {
                                  if (id.isEmpty) {
                                    id = element.id!;
                                  } else {
                                    id += "," + element.id!;
                                  }
                                });
                                bool status = false;
                                if (widget.type == AppUrl.language) {
                                  status = await authViewModel.updateUserInfo(
                                      language: id);
                                } else if (widget.type == AppUrl.courses) {
                                  status = await authViewModel.updateUserInfo(
                                      courses: id);
                                } else if (widget.type == AppUrl.category) {
                                  status = await authViewModel.updateUserInfo(
                                      categoryies: id);
                                } else if (widget.type == AppUrl.classes) {
                                  status = await authViewModel.updateUserInfo(
                                      class2: id);
                                } else if (widget.type == AppUrl.subject) {
                                  status = await authViewModel.updateUserInfo(
                                      subject: id);
                                }
                                if (!status) {
                                  AppUtils.appToast(authViewModel.error ??
                                      "Failed updated,please try again");
                                  return;
                                }
                              }

                              widget.takeSelectedItem(selectedItem);
                            }
                            Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
