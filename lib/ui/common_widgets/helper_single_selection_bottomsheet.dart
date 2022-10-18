import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../data/helperdata.dart';
import '../../view_model/helper_view_model.dart';

class HelperSingleSelectionBottomSheet extends StatefulWidget {
  String type;
  HelperData? selectedItem;
  var takeSelectedItem;

  HelperSingleSelectionBottomSheet(
      this.type, this.selectedItem, this.takeSelectedItem);

  @override
  _HelperSingleSelectionBottomSheetState createState() =>
      _HelperSingleSelectionBottomSheetState();
}

class _HelperSingleSelectionBottomSheetState
    extends State<HelperSingleSelectionBottomSheet>
    with TickerProviderStateMixin {
  List<HelperData> helperDataList = [];
  late HelperViewModel helperViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var a = await helperViewModel.getCategory(widget.type);
      if (helperViewModel.listData != null) {
        helperDataList = helperViewModel.listData;
        if (widget.selectedItem != null)
          helperDataList.forEach((element) {
            if (widget.selectedItem!.name == element.name) {
              widget.selectedItem = element;
            }
          });
        //
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    helperViewModel = context.watch<HelperViewModel>();
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
                : (helperViewModel.error ?? "").isNotEmpty
                    ? Center(
                        child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: Text("${helperViewModel.error}")),
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
                                      groupValue: widget.selectedItem,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      value: item,
                                      onChanged: (HelperData? value) {
                                        setState(() {
                                          widget.selectedItem = value;
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
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          color: Theme.of(context).colorScheme.secondary),
                      foregroundColor: Theme.of(context).colorScheme.secondary,
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
                    onPressed: () {
                      widget.takeSelectedItem(widget.selectedItem);
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
