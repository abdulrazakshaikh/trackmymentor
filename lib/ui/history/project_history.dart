import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackmy_mentor/data/projectdata.dart';
import 'package:trackmy_mentor/model/storage/shared_prefs.dart';
import 'package:trackmy_mentor/ui/homepage/gigs_item.dart';
import 'package:trackmy_mentor/view_model/project_view_model.dart';

import '../FsListWithSearchWidget.dart';

class ProjectHistory extends StatefulWidget {
  @override
  State<ProjectHistory> createState() => _ProjectHistoryState();
}

class _ProjectHistoryState extends State<ProjectHistory>
    implements PageLoadSearchListener {
  List<ProjectData> projectItemList = [];
  late ProjectViewModel projectViewModel;
  int currentPage = 1;
  late FsListWithSearchState listListner;

  @override
  void initState() {
    widget1 = FsListWithSearchWidget(
      pageLoadListner: this,
      title: false,
      message: null,
      itemBuilder: (BuildContext context, int index, var item) {
        return GigsItem(value: item as ProjectData);
      },
      afterView: (FsListWithSearchState v) {
        listListner = v;
      },
      showError: false,
      // errorWidget: errorWidget(),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      /*bool isTeacher=SharedPrefs().userdata!.type=="2";
      isTeacher?await projectViewModel.getProjectListByTeacher(teacheremail:SharedPrefs().userdata!.email!)
          : await projectViewModel.getProjectListByStudent(studentemail:SharedPrefs().userdata!.email!);
      projectItemList = projectViewModel.listData;
      setState(() {});*/
      getProjectList(currentPage);
    });
  }

  late Widget widget1;

  Future<void> getProjectList(int page) async {
    currentPage = page;
    bool isTeacher = SharedPrefs().userdata!.type == "2";
    isTeacher
        ? await projectViewModel.getProjectListByTeacher(
            teacheremail: SharedPrefs().userdata!.email!, page: page)
        : await projectViewModel.getProjectListByStudent(
            studentemail: SharedPrefs().userdata!.email!, page: page);
    projectItemList = [];
    if (projectViewModel.listData.length == 0) {
      listListner.addListList({
        "current_page": currentPage,
        "last_page": currentPage,
      }, projectItemList);
      setState(() {});
    } else {
      projectItemList.addAll(projectViewModel.listData);
      listListner.addListList({
        "current_page": currentPage,
        "last_page": 1000,
      }, projectItemList);
      setState(() {});
    }
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
        child: widget1,
      ),
    );
  }

  @override
  lastPage(int page) {}

  @override
  loadNextPage(String page) {
    getProjectList(currentPage + 1);
  }
}
