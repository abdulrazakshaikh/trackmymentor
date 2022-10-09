import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:trackmy_mentor/chat/chat_list.dart';

// Ref Link : https://www.developerlibs.com/2018/06/flutter-apply-search-box-in-appbar.html

class ChatConversation extends StatefulWidget {
  @override
  _ChatConversationState createState() => new _ChatConversationState();
}

class _ChatConversationState extends State<ChatConversation> {

List chatList = [
  {
    "name" : "Gerrard Henderson",
    "date" : "30/09/22",
    "issender" : false,
    "message" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },
  {
    "photo" : "assets/images/default.jpg",
    "name" : "Josephine Mayo",
    "date" : "30/09/22",
    "issender" : true,
    "message" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },
  {
    "photo" : "assets/images/default.jpg",
    "name" : "Steffan Harding",
    "date" : "30/09/22",
    "issender" : false,
    "message" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },
  {
    "photo" : "assets/images/default.jpg",
    "name" : "Nancy Mullen",
    "date" : "30/09/22",
    "issender" : true,
    "message" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },
  {
    "photo" : "assets/images/default.jpg",
    "name" : "Nancy Mullen",
    "date" : "30/09/22",
    "issender" : false,
    "message" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },
  {
    "photo" : "assets/images/default.jpg",
    "name" : "Nancy Mullen",
    "date" : "30/09/22",
    "issender" : true,
    "message" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },
  {
    "photo" : "assets/images/default.jpg",
    "name" : "Nancy Mullen",
    "date" : "30/09/22",
    "issender" : false,
    "message" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },
  {
    "photo" : "assets/images/default.jpg",
    "name" : "Nancy Mullen",
    "date" : "30/09/22",
    "issender" : true,
    "message" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },
  {
    "photo" : "assets/images/default.jpg",
    "name" : "Nancy Mullen",
    "date" : "30/09/22",
    "issender" : true,
    "message" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },
  {
    "photo" : "assets/images/default.jpg",
    "name" : "Nancy Mullen",
    "date" : "30/09/22",
    "issender" : false,
    "message" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1, color: Theme.of(context).dividerColor),
          ),
        ),
        padding: EdgeInsets.all(15),
        child: Row(
          children: [

            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.background,
                child: TextField(
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: 'Type Message...'.toLowerCase(),
                    hintStyle: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      letterSpacing: 1.8,
                      fontWeight: FontWeight.w300
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(4),
                        bottomLeft: Radius.circular(4),
                      ),
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(4),
                        bottomLeft: Radius.circular(4),
                      ),
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
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
              child: IconButton(
                icon: Icon(Icons.send),
                tooltip: 'Send',
                style: IconButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                      topLeft: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                    ),
                  )
                ),
                onPressed: (){}, 
              ),
            ),
            
          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: Icon(Icons.arrow_back),
        ),
        title: Container(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  "assets/images/default.jpg",
                  height: 42, width: 42, fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text('Gerrard Henderson'),
              ),
            ],
          ),
        ),
        actions: [],
      ),
      body: ListView(
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
                Map item = chatList[index];
                return 
                item["issender"] == true ?
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: BubbleSpecialOne(
                    text: '${item["message"]}',
                    isSender: true,
                    color: Theme.of(context).colorScheme.tertiary.withOpacity(0.2),
                    tail: true,
                    textStyle: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.titleMedium,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ) 
                )
                : 
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: BubbleSpecialOne(
                    seen: true,
                    sent: true,
                    delivered: true,
                    text: '${item["message"]}',
                    isSender: false,
                    color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                    tail: true,
                    textStyle: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.titleMedium,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ) 
                )
                ;
                
              }
            ),
          ),
        
          

        ],
      ),
    );
  }
}
