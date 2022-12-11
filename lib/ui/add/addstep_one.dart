import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trackmy_mentor/model/services/app_url.dart';
import 'package:trackmy_mentor/view_model/helper_view_model.dart';

import '../../data/helperdata.dart';

class AddStepOne extends StatefulWidget {
  HelperData? categoryId;
  var onSave;

  AddStepOne(this.categoryId, this.onSave);

  @override
  _AddStepOneState createState() => _AddStepOneState();
}

class _AddStepOneState extends State<AddStepOne> with TickerProviderStateMixin {
  List<HelperData> helperDataList = [];
  late HelperViewModel helperViewModel;
  int index = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var a = await helperViewModel.getCategory(AppUrl.category);
      if (helperViewModel.listData != null) {
        helperDataList = helperViewModel.listData;
        if (widget.categoryId != null)
          helperDataList.forEach((element) {
            if (widget.categoryId!.id! == element.id) {
              print(element.name);
              element.isSelected = true;
              index = helperDataList.indexOf(element);
            }
          });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    helperViewModel = context.watch<HelperViewModel>();
    if (widget.categoryId == null && helperDataList.length > 0) {
      helperDataList[0].isSelected = true;
      widget.onSave(helperDataList[0]);
      index = 0;
    }
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Text(
              'Select Categories',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.headlineSmall,
                letterSpacing: 1.5,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          helperViewModel.isLoading
              ? Center(
                  child: Container(
                      margin: EdgeInsets.only(top: 300),
                      child: CircularProgressIndicator()),
                )
              : SingleChildScrollView(
                  child: GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      childAspectRatio: (1 / .4),
                      crossAxisSpacing: 4.0,
                      children: List.generate(helperDataList.length, (index) {
                        return Center(
                          child: anyItem(index, helperDataList[index]),
                        );
                      })),
                )
          /* Container(
            margin: EdgeInsets.only(top: 20),
            child: Wrap(
              spacing: 5,
              runSpacing: 5,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 12.5,
                  child: anyItem(0),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 12.5,
                  child: anyItem(1),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 12.5,
                  child: anyItem(2),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 12.5,
                  child: anyItem(3),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 12.5,
                  child: anyItem(4),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 12.5,
                  child: anyItem(5),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  child: anyItem(6),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  child: anyItem(7),
                ),
              ],
            ),
          ),*/
        ],
      ),
    );
  }

  Widget anyItem(int i, HelperData data) {
    return InkWell(
      onTap: () {
        setState(() {
          print(i);
          print(index);
          //selectedIndex = index;
          helperDataList[index].isSelected = false;
          index = i;
          data.isSelected = true;
          widget.onSave(data);
          widget.categoryId = data;
        });
      },
      child: Card(
          color: data.isSelected
              ? Theme.of(context).colorScheme.primaryContainer
              : Theme.of(context).colorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
                width: 1,
                color: data.isSelected
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
                          color: data.isSelected
                              ? Colors.transparent
                              : Theme.of(context).colorScheme.secondary),
                      borderRadius: BorderRadius.circular(12),
                      color: data.isSelected
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
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      width: 42,
                      child: Image.network(
                        '${data.image}',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        data.name.toString(),
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.titleLarge,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          letterSpacing: 1.2,
                          color: data.isSelected
                              ? Theme.of(context).colorScheme.primary
                              : null,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
