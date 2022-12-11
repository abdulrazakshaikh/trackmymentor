import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trackmy_mentor/data/projectdata.dart';
import 'package:trackmy_mentor/ui/project/project_quotationlist.dart';

class SeeAllProjectQuotationList extends StatefulWidget {
  ProjectData projectData;

  SeeAllProjectQuotationList(this.projectData);

  @override
  State<StatefulWidget> createState() {
    return SeeAllProjectQuotationListState();
  }
}

class SeeAllProjectQuotationListState
    extends State<SeeAllProjectQuotationList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: BottomNavigation(),
      appBar: AppBar(
        title: Text("Quotation List"),
        actions: [],
      ),
      body: ProjectQuotationList(
        widget.projectData,
        size: 10,
      ),
    );
  }
}
