import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trackmy_mentor/view_model/auth_view_model.dart';

import '../../utils/AppUtils.dart';

class DescriptionBottomSheet extends StatefulWidget {
  var takeSelectedItem;
  var description;

  DescriptionBottomSheet(this.description, this.takeSelectedItem);

  @override
  _DesciptionBottomSheetState createState() => _DesciptionBottomSheetState();
}

class _DesciptionBottomSheetState extends State<DescriptionBottomSheet>
    with TickerProviderStateMixin {
  //bool _value = false;
  TextEditingController controller = TextEditingController();

  late AuthViewModel authViewModel;

  @override
  void initState() {
    print("object");
    print(widget.description);

    controller.text = widget.description ?? "";
  }

  @override
  Widget build(BuildContext context) {
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
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'Describe your experience',
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
            child: Container(
              margin: EdgeInsets.all(15),
              child: TextFormField(
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
                controller: controller,
                maxLines: 5,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  labelText: 'Description'.toLowerCase(),
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
                        color: Theme.of(context).colorScheme.primary, width: 1),
                  ),
                ),
              ),
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
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                color: Theme.of(context).colorScheme.secondary),
                            foregroundColor:
                                Theme.of(context).colorScheme.secondary,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
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
                            if (controller.text.isEmpty) {
                              AppUtils.appToast("Please add description");
                              return;
                            }
                            bool a = await authViewModel.updateUserInfo(
                                description: controller.text);
                            if (a) {
                              widget.takeSelectedItem(controller.text);
                              Navigator.pop(context, true);
                            } else {
                              AppUtils.appToast(authViewModel.error ??
                                  "Failed to update,please try again");
                            }
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
                          child: Text('Update'),
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
