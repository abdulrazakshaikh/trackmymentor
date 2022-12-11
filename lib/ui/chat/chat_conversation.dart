import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trackmy_mentor/data/chat_data.dart';
import 'package:trackmy_mentor/model/storage/shared_prefs.dart';
import 'package:trackmy_mentor/utils/AppUtils.dart';
import 'package:trackmy_mentor/view_model/chat_view_model.dart';

import '../../data/contact_data.dart';

// Ref Link : https://www.developerlibs.com/2018/06/flutter-apply-search-box-in-appbar.html

class ChatConversation extends StatefulWidget {
  ContactData chatData;

  ChatConversation(this.chatData);

  @override
  _ChatConversationState createState() => new _ChatConversationState();
}

class _ChatConversationState extends State<ChatConversation> {
  bool isTeacher = SharedPrefs().userdata!.type == "2";
  List<ChatData> chatList = [];
  late ChatViewModel chatViewModel;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      /*if(isTeacher){
        await chatViewModel.teacherChatList( teacheremail: SharedPrefs().userdata!.email!);
      }else {
        await chatViewModel.studentChatList(studentemail: SharedPrefs().userdata!.email!);
      }*/
      await chatViewModel.chatList(
          consersation_id: widget.chatData.conversation_id!);
      chatList = chatViewModel.listData;
    });
  }

  TextEditingController chatMsgCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    chatViewModel = context.watch<ChatViewModel>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1, color: Theme.of(context).dividerColor),
          ),
        ),
        padding: EdgeInsets.all(15),
        child: false
            ? MessageBar(
                onSend: (_) => print(_),
                actions: [
                  InkWell(
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 24,
                    ),
                    onTap: () {},
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: InkWell(
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.green,
                        size: 24,
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Theme.of(context).colorScheme.background,
                      child: TextField(
                        controller: chatMsgCont,
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          hintText: 'Type Message...'.toLowerCase(),
                          hintStyle: GoogleFonts.lato(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              letterSpacing: 1.8,
                              fontWeight: FontWeight.w300),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(4),
                              bottomLeft: Radius.circular(4),
                            ),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.outline),
                          ),
                          focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                              topRight: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(4),
                              bottomLeft: Radius.circular(4),
                            ),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                  ),
                ),
              ),
            ),
            Container(
              width: 48,
              height: 48,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      // border: Border.all(width: 1, color: Theme.of(context).colorScheme.outline),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(4),
                        bottomRight: Radius.circular(4),
                        topLeft: Radius.circular(0),
                        bottomLeft: Radius.circular(0),
                      ),
                    ),
                    child: chatViewModel.isChatAddingLoading
                        ? Container(
                            margin: EdgeInsets.all(10),
                            child: CircularProgressIndicator())
                        : IconButton(
                            icon: Icon(Icons.send),
                            tooltip: 'Send',
                            style: IconButton.styleFrom(
                                foregroundColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(4),
                                    bottomRight: Radius.circular(4),
                                    topLeft: Radius.circular(0),
                                    bottomLeft: Radius.circular(0),
                                  ),
                                )),
                            onPressed: () async {
                              if (chatMsgCont.text.isEmpty) {
                                return;
                              }
                              bool a = await chatViewModel.addChat(
                                  senderemail: SharedPrefs().userdata!.email!,
                                  receiveremail: widget.chatData!.email!,
                                  message: chatMsgCont.text);
                              if (a) {
                                chatList.add(ChatData(
                                    sender_id: SharedPrefs().userdata!.email!,
                                    receiver_id: widget.chatData.email,
                                    message: chatMsgCont.text));
                                chatMsgCont.text = "";
                                setState(() {});
                              } else {
                                AppUtils.appToast("Please try again");
                              }
                            },
                          ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Container(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  widget.chatData.image!,
                  height: 42,
                  width: 42,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(widget.chatData.fullname!),
              ),
            ],
          ),
        ),
        actions: [],
      ),
      body: chatViewModel.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              reverse: true,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: ListView.builder(
                      primary: false,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: chatList == null ? 0 : chatList.length,
                      itemBuilder: (BuildContext context, int index) {
                        ChatData item = chatList[index];
                        return false
                            ? Padding(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: BubbleSpecialOne(
                                  text: '${item.message}',
                                  isSender: true,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .tertiary
                                      .withOpacity(0.2),
                                  tail: true,
                                  textStyle: GoogleFonts.lato(
                                    textStyle:
                                        Theme.of(context).textTheme.titleMedium,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ))
                            : Padding(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: BubbleSpecialOne(
                                  seen: true,
                                  sent: true,
                                  delivered: true,
                                  text: '${item.message}',
                                  isSender: item.sender_id ==
                                      SharedPrefs().userdata!.email!,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(0.1),
                                  tail: true,
                                  textStyle: GoogleFonts.lato(
                                    textStyle:
                                        Theme.of(context).textTheme.titleMedium,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ));
                      }),
                ),
              ],
            ),
    );
  }
}
