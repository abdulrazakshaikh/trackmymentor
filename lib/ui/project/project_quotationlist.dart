import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trackmy_mentor/data/projectdata.dart';
import 'package:trackmy_mentor/ui/project/project_quotation_bottomsheet.dart';
import 'package:trackmy_mentor/ui/project/quotation_list_view.dart';

import '../../data/quotationdata.dart';
import '../../model/storage/shared_prefs.dart';
import '../../view_model/quotation_view_model.dart';

class ProjectQuotationList extends StatefulWidget {
  ProjectData projectData;
  int size = 3;

  ProjectQuotationList(this.projectData, {this.size = 3});

  @override
  State<ProjectQuotationList> createState() => _ProjectQuotationListState();
}

class _ProjectQuotationListState extends State<ProjectQuotationList> {
  late QuotationViewModel quotationViewModel;
  List<QuotationData> quotationList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (SharedPrefs().userdata!.email == widget.projectData.email) {
        await quotationViewModel.getQuotationList(
            project_id: widget.projectData.id.toString());
        quotationList = quotationViewModel.listData!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    quotationViewModel = context.watch<QuotationViewModel>();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: quotationViewModel.isLoading
          ? CircularProgressIndicator()
          : quotationList.length == 0
              ? Container(
                  child: Text("No quotation yet found"),
                )
              : ListView.builder(
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: quotationList == null
                      ? 0
                      : widget.size == 3
                          ? quotationList.length > 3
                              ? 3
                              : quotationList.length
                          : quotationList.length,
                  itemBuilder: (BuildContext context, int index) {
                    QuotationData item = quotationList[index];
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  width: 1,
                                  color: Theme.of(context).dividerColor)),
                          // margin: EdgeInsets.only(bottom: 5, left: 10,right: 10),
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                context: context,
                                builder: (BuildContext context) {
                                  return ProjectQuotationBottomSheet(
                                      widget.projectData.title!, item);
                                },
                              );
                            },
                            child: ListTile(
                              horizontalTitleGap: 5,
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                  ),
                                  child: Image.network(
                                    '${item.image}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              title: Text(
                                '${item.teacher_name}',
                                style: GoogleFonts.lato(
                                  textStyle:
                                      Theme.of(context).textTheme.titleSmall,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              subtitle: Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.comment_outlined),
                                    SizedBox(width: 3),
                                    Expanded(
                                      child: Text(
                                        '${item.comment}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.lato(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              trailing: Text(
                                '₹ ${item.price}',
                                style: GoogleFonts.lato(
                                  textStyle:
                                      Theme.of(context).textTheme.titleSmall,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                        widget.size == 3 &&
                                index == 2 &&
                                quotationList.length > 3
                            ? Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SeeAllProjectQuotationList(
                                                        widget.projectData)));
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            'View all'.toLowerCase(),
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
                                                    .primary,
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
                                        foregroundColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container()
                      ],
                    );
                  }),
    );
  }
}
