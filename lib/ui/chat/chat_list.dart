import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Ref Link : https://www.developerlibs.com/2018/06/flutter-apply-search-box-in-appbar.html
import 'package:provider/provider.dart';
import 'package:trackmy_mentor/data/contact_data.dart';
import 'package:trackmy_mentor/ui/chat/chat_conversation.dart';

import '../../model/storage/shared_prefs.dart';
import '../../view_model/chat_view_model.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => new _ChatListState();
}

class _ChatListState extends State<ChatList> {
  bool _showSearch = false;

  bool isTeacher = SharedPrefs().userdata!.type == "2";
  List<ContactData> chatList = [];
  late ChatViewModel chatViewModel;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await chatViewModel.contactList(email: SharedPrefs().userdata!.email!);
      setValues();
    });
  }

  void setValues({String search = ""}) {
    chatList = chatViewModel.listContactDataData;
    if (search.isEmpty) {
      setState(() {
        // chatList=chatList;
      });
    } else {
      chatList = chatViewModel.listContactDataData
          .where((item) =>
              (item.fullname!.toUpperCase()).contains(search.toUpperCase()))
          .toList();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    chatViewModel = context.watch<ChatViewModel>();

    return Scaffold(
      appBar: AppBar(
        // title: Text('Chat'.toUpperCase()),
        // actions: [
        //   Container(
        //       padding: EdgeInsets.all(10),
        //       child: IconButton(
        //       onPressed: (){},
        //       icon: Icon(Icons.search),
        //       style: IconButton.styleFrom(
        //         fixedSize: Size(40, 44),
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(10)
        //         ),
        //       ),
        //     ),
        //   )
        // ],
        leading: _showSearch == false
            ? Container(
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                ),
              )
            : IconButton(
                onPressed: () {
                  setState(() {
                    _showSearch = !_showSearch;
                  });
                },
                icon: Icon(Icons.arrow_back_outlined),
                style: IconButton.styleFrom(),
              ),
        titleSpacing: 0,
        title: _showSearch == false
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text('Chat'.toUpperCase()),
              )
            : Container(
                padding: EdgeInsets.only(right: 5),
                child: TextField(
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                  onChanged: (value) {
                    setValues(search: value);
                  },
                  autofocus: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search by Name'.toLowerCase(),
                    hintStyle: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        letterSpacing: 1.8,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
        actions: [
          _showSearch == false
              ? IconButton(
                  tooltip: 'Search',
                  onPressed: () {
                    setState(() {
                      _showSearch = !_showSearch;
                    });
                  },
                  icon: Icon(Icons.search_outlined),
                  style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(),
                    // backgroundColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
                    // foregroundColor: Theme.of(context).colorScheme.primary,
                    minimumSize: Size(54, 54),
                    fixedSize: Size(54, 54),
                  ),
                )
              : Container()
        ],
      ),
      body: chatViewModel.isLoading
          ? Center(
              child: Container(
              child: CircularProgressIndicator(),
            ))
          : chatList.length == 0
              ? Center(child: Text("No record found"))
              : ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: ListView.separated(
                          primary: false,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: chatList == null ? 0 : chatList.length,
                          separatorBuilder: (BuildContext context, int index) {
                            // return SizedBox(height: 5);
                            return Divider();
                          },
                          itemBuilder: (BuildContext context, int index) {
                            ContactData item = chatList[index];
                            return ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ChatConversation(item)));
                              },
                              leading: SizedBox(
                                height: 42,
                                width: 42,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.network(
                                    "${item.image}",
                                    height: 42,
                                    width: 42,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              title: Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '${item.fullname}',
                                  style: GoogleFonts.lato(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              subtitle: Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '${item.lastmsg ?? ""}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              trailing: true
                                  ? null
                                  : Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            '${item.id}',
                                            style: GoogleFonts.lato(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          SizedBox(height: 5),
                                          Icon(
                                            Icons.chevron_right_outlined,
                                            size: 20,
                                          )
                                        ],
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
