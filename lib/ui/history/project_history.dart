import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trackmy_mentor/data/projectdata.dart';
import 'package:trackmy_mentor/ui/homepage/gigs_item.dart';
import 'package:trackmy_mentor/view_model/project_view_model.dart';

class ProjectHistory extends StatefulWidget {
  @override
  State<ProjectHistory> createState() => _ProjectHistoryState();
}

class _ProjectHistoryState extends State<ProjectHistory> {
  List<ProjectData> projectItemList = [];
  late ProjectViewModel projectViewModel;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await projectViewModel.getProjectList();
      projectItemList = projectViewModel.listData;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    projectViewModel = context.watch<ProjectViewModel>();

    return Scaffold(
      //bottomNavigationBar: BottomNavigation(),
      appBar: AppBar(
        title: Text('History'.toUpperCase()),
        actions: [],
        leading: Container(
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: Center(
        child: projectViewModel.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : projectItemList.length == 0
                ? Center(
                    child: Text(
                      "No search record found",
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.titleMedium,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                : ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: ListView.builder(
                            primary: false,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: projectItemList == null
                                ? 0
                                : projectItemList.length,
                            itemBuilder: (BuildContext context, int index) {
                              ProjectData item = projectItemList[index];
                              return GigsItem(
                                value: item,
                              );
                            }),
                      ),
                    ],
                  ),
      ),

    );
  }
}
