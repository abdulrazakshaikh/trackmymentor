import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackmy_mentor/data/projectdata.dart';
import 'package:trackmy_mentor/ui/homepage/gigs_item.dart';
import 'package:trackmy_mentor/view_model/project_view_model.dart';

import 'FsListWithSearchWidget.dart';

class SeeAllProjectList extends StatefulWidget {
  String title;
  String type;
  String category_id;

  SeeAllProjectList(this.title,
      {this.type = "category", this.category_id = "0"});

  @override
  State<StatefulWidget> createState() {
    return SeeAllProjectListState();
  }
}

class SeeAllProjectListState extends State<SeeAllProjectList>
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
      await getProjectList(currentPage);
    });
  }

  late Widget widget1;

  Future<void> getProjectList(int page) async {
    currentPage = page;
    if (widget.category_id != "0" && widget.type == "category") {
      await projectViewModel.getProjectListByCategory(
          cat_id: widget.category_id, page: page);
    } else if (widget.category_id != "0" && widget.type == "My Work") {
      await projectViewModel.getProjectListByTeacher(
          teacheremail: widget.category_id, page: page);
    } else {
      await projectViewModel.getProjectList(page: page);
    }
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
        title: Text(widget.title.toUpperCase()),
        actions: [],
      ),
      body: Center(
        child: widget1,
        /*ListView(
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
                  ),*/
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
