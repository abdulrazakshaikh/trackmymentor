import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../data/helperdata.dart';
import '../../model/services/app_url.dart';
import '../../view_model/helper_view_model.dart';
import '../see_all_project_list.dart';

class HomepageCategories extends StatefulWidget {
  @override
  _HomepageCategoriesState createState() => new _HomepageCategoriesState();
}

class _HomepageCategoriesState extends State<HomepageCategories> {
  List<HelperData> helperDataList = [];
  late HelperViewModel helperViewModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var a = await helperViewModel.getCategory(AppUrl.category);
      if (helperViewModel.listData != null) {
        helperDataList = helperViewModel.listData;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    helperViewModel = context.watch<HelperViewModel>();
    return helperViewModel.isLoading
        ? Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Text(
                        'Categories'.toUpperCase(),
                        style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.titleLarge,
                            letterSpacing: 1.5,
                            fontSize: MediaQuery.of(context).size.width < 321
                                ? 16
                                : 18,
                            fontWeight: FontWeight.w900),
                      )),
                      true
                          ? Container()
                          : Container(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SeeAllProjectList("Cat")));
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      'Show All',
                                      style: GoogleFonts.lato(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                          letterSpacing: 1.2,
                                          fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width <
                                                  321
                                              ? 12
                                              : 14,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.arrow_forward,
                                      size: 16,
                                    ),
                                  ],
                                ),
                                style: TextButton.styleFrom(
                                  shape: StadiumBorder(),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  foregroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  // height: MediaQuery.of(context).size.width < 321 ?  280 : 260,
                  height: 120,
                  child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: PageController(
                        viewportFraction:
                            MediaQuery.of(context).size.width < 321 ? 0.7 : 0.6,
                      ),
                      padEnds: false,
                      pageSnapping: true,
                      itemCount:
                          helperDataList == null ? 0 : helperDataList.length,
                      physics: PageScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        HelperData item = helperDataList[index];
                        return Container(
                          margin: EdgeInsets.only(
                            bottom: 25,
                            left: index == 0 ? 10 : 0,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SeeAllProjectList(
                                            "${item.name}",
                                            category_id: item.id.toString(),
                                          )));
                            },
                            child: Card(
                              elevation: 5,
                              shadowColor: Theme.of(context)
                                  .shadowColor
                                  .withOpacity(0.35),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide(
                                      width: 1,
                                      color: Colors.grey.withOpacity(0.2))),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 64,
                                      // height: 84,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary
                                            .withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          '${item.image}',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                      child: Text(
                                        '${item.name}',
                                        overflow: TextOverflow.clip,
                                        style: GoogleFonts.lato(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
  }
}
