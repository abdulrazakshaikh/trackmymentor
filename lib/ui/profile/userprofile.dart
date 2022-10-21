import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trackmy_mentor/model/storage/shared_prefs.dart';
import 'package:trackmy_mentor/ui/profile/userprofile_edit.dart';

import '../../model/services/app_url.dart';

class UserProfile extends StatefulWidget {
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  List myaccountmenuList = [
    {
      "id": "001",
      "title" : "Report",
      "icon" : Icons.report_outlined,
    },
    {
      "id": "002",
      "title" : "Refer & Earn",
      "icon" : Icons.share_outlined,
    },
    {
      "id": "003",
      "title" : "Privacy",
      "icon" : Icons.privacy_tip_outlined,
    },
    {
      "id": "004",
      "title" : "Logout",
      "icon" : Icons.logout,
    },
  ];
  @override
  Widget build(BuildContext context) {
    print(SharedPrefs().userdata!.toJson());
    return Scaffold(
        //bottomNavigationBar: BottomNavigation(),
        // appBar: AppBar(
        //   title: Text('Profile'.toUpperCase()),
        //   actions: [],
        // ),
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )
              ),

              title: Text('Profile'.toUpperCase()),
              titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle!.merge(
                  TextStyle(color: Theme.of(context).colorScheme.onPrimary)
              ),
              actions: [
                Container(
                  padding: EdgeInsets.all(10),

                  child: IconButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  UserProfileEdit()));
                    },
                    icon: Icon(Icons.mode_edit_outlined),
                    style: IconButton.styleFrom(
                      fixedSize: Size(40, 44),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      // backgroundColor: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                )
              ],
              expandedHeight: 230,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  padding: EdgeInsets.only(top: 54),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Stack(children: [
                              CircleAvatar(
                            backgroundImage: SharedPrefs().userdata?.image ==
                                    null
                                ? NetworkImage(
                                    'https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg')
                                : NetworkImage(AppUrl.image_baseUrl +
                                    "${SharedPrefs().userdata!.image}"),
                            radius: 54,
                          ),
                              Positioned(
                                right: 4, bottom: 4,
                                child: ClipOval(
                                  child: Material(
                                    color: Theme.of(context).colorScheme.tertiary, // Button color
                                    child: InkWell(
                                      splashColor: Theme.of(context).colorScheme.secondary, // Splash color
                                      onTap: () {},
                                      child: SizedBox(width: 32, height: 32, child: Icon(Icons.edit_outlined, size: 20, color: Colors.white,)),
                                    ),
                                  ),
                                ),

                              )
                            ]),
                            Container(
                              margin: EdgeInsets.only(bottom: 3, top: 10),
                              child: Text(
                            '${SharedPrefs().userdata!.firstname} ${SharedPrefs().userdata!.lastname}',
                            style: GoogleFonts.lato(
                                textStyle: Theme.of(context)
                                    .appBarTheme
                                    .titleTextStyle,
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 18,
                                letterSpacing: 1.5),
                          ),
                            ),
                            Container(
                              child: Text(
                            SharedPrefs().userdata!.type == "1"
                                ? "Student".toUpperCase()
                                : "Teacher".toUpperCase(),
                            style: GoogleFonts.lato(
                                textStyle: Theme.of(context)
                                    .appBarTheme
                                    .titleTextStyle,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimary
                                    .withOpacity(0.8),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [

                      Card(
                        elevation: 4,
                        shadowColor: Theme.of(context).shadowColor.withOpacity(0.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              ListTile(
                                dense: true,
                                leading: Icon(Icons.phone_outlined),
                                horizontalTitleGap: 0,
                                title: Text(
                          '+91 ${SharedPrefs().userdata!.mobile}',
                          style: GoogleFonts.lato(
                              textStyle:
                                  Theme.of(context).textTheme.titleMedium,
                              fontWeight: FontWeight.w600),
                        ),
                              ),
                              Divider(),
                              ListTile(
                                dense: true,
                                leading: Icon(Icons.email_outlined),
                                horizontalTitleGap: 0,
                                title: Text(
                          '${SharedPrefs().userdata!.email}',
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.lato(
                              textStyle:
                                  Theme.of(context).textTheme.titleMedium,
                              fontWeight: FontWeight.w600),
                        ),
                              ),
                              Divider(),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: Column(
                                  children: [
                                    Container(
                              padding: EdgeInsets.only(bottom: 10),
                              width: double.infinity,
                              child: Text(
                                'Description'.toUpperCase(),
                                style: GoogleFonts.lato(
                                  textStyle:
                                      Theme.of(context).textTheme.bodySmall,
                                  fontWeight: FontWeight.w900,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: (SharedPrefs().userdata!.description ==
                                            null ||
                                        SharedPrefs()
                                            .userdata!
                                            .description!
                                            .isEmpty)
                                    ? Text(
                                        "add about you",
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.lato(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                          fontWeight: FontWeight.w300,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                      )
                                    : Text(
                                        "${SharedPrefs().userdata!.description}",
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.lato(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                      ),
                              ),
                            ),
                          ],
                                ),
                              )

                            ],
                          ),
                        ),
                      ),


                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                              child: Text('Setting'.toUpperCase(),
                                style: GoogleFonts.lato(
                                  textStyle: Theme.of(context).textTheme.bodySmall,
                                  fontWeight: FontWeight.w900,
                                  color: Theme.of(context).colorScheme.secondary,
                                  letterSpacing: 2.5,
                                ),
                              ),
                            ),
                            ListView.separated(
                              primary: false,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: myaccountmenuList == null ? 0 : myaccountmenuList.length,
                              separatorBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                  height: 5,
                                );
                              },
                              itemBuilder: (BuildContext context, int index) {
                                Map item = myaccountmenuList[index];
                                return Card(
                                  elevation: 3,
                                  shadowColor: Theme.of(context).shadowColor.withOpacity(0.4),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(width: 1, color: Theme.of(context).colorScheme.outline.withOpacity(0.1))
                                  ),
                                  child: ListTile(
                                    horizontalTitleGap: 0,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                                    leading: Icon(item["icon"]),
                                    title: Text(
                                      '${item["title"]}',
                                      style: GoogleFonts.lato(
                                        textStyle:
                                        Theme.of(context).textTheme.titleSmall,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                    trailing: Icon(
                                      Icons.chevron_right,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary
                                          .withOpacity(0.6),
                                    ),
                                    onTap: () {
                                      if (item['id'] == "004") {
                                        SharedPrefs().logout();
                                      }
                                    },
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),


                      // Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                      // Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                      // Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                      // Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                      // Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                      // Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                    ],
                  ),
                )
            ),
          ],
        )
    );
  }
}
