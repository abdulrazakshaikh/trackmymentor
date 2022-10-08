import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trackmy_mentor/chat/chat_conversation.dart';
// Ref Link : https://www.developerlibs.com/2018/06/flutter-apply-search-box-in-appbar.html

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => new _ChatListState();
}

class _ChatListState extends State<ChatList> {
bool _showSearch = false;

List chatList = [
  {
    "photo" : "images/default.jpg",
    "name" : "Gerrard Henderson",
    "date" : "30/09/22",
    "lastmessage" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },
  {
    "photo" : "images/default.jpg",
    "name" : "Josephine Mayo",
    "date" : "30/09/22",
    "lastmessage" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },
  {
    "photo" : "images/default.jpg",
    "name" : "Steffan Harding",
    "date" : "30/09/22",
    "lastmessage" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },
  {
    "photo" : "images/default.jpg",
    "name" : "Nancy Mullen",
    "date" : "30/09/22",
    "lastmessage" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },
  {
    "photo" : "images/default.jpg",
    "name" : "Nancy Mullen",
    "date" : "30/09/22",
    "lastmessage" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },
  {
    "photo" : "images/default.jpg",
    "name" : "Nancy Mullen",
    "date" : "30/09/22",
    "lastmessage" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },
  {
    "photo" : "images/default.jpg",
    "name" : "Nancy Mullen",
    "date" : "30/09/22",
    "lastmessage" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },
  {
    "photo" : "images/default.jpg",
    "name" : "Nancy Mullen",
    "date" : "30/09/22",
    "lastmessage" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },
  {
    "photo" : "images/default.jpg",
    "name" : "Nancy Mullen",
    "date" : "30/09/22",
    "lastmessage" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },
  {
    "photo" : "images/default.jpg",
    "name" : "Nancy Mullen",
    "date" : "30/09/22",
    "lastmessage" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },

  {
    "photo" : "images/default.jpg",
    "name" : "Nancy Mullen",
    "date" : "30/09/22",
    "lastmessage" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },
  {
    "photo" : "images/default.jpg",
    "name" : "Nancy Mullen",
    "date" : "30/09/22",
    "lastmessage" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },
  {
    "photo" : "images/default.jpg",
    "name" : "Nancy Mullen",
    "date" : "30/09/22",
    "lastmessage" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },
];

  @override
  Widget build(BuildContext context) {
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
        leading: 
        _showSearch == false ?
        null :
        IconButton(
          onPressed: (){
            setState(() {
              _showSearch = !_showSearch;
            });
          }, 
          icon: Icon(Icons.arrow_back_outlined),
          style: IconButton.styleFrom(),
        ),
        titleSpacing: 0,
        title: 
        _showSearch == false ?
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('Chat'),    
        )
        :
        Container(
          padding: EdgeInsets.only(right: 5),
          child: TextField(
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.bodyMedium,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
            autofocus: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search by Name'.toLowerCase(),
              hintStyle: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.bodyMedium,
                letterSpacing: 1.8,
                fontWeight: FontWeight.w300
              ),
            ),
          ),
        ),
        actions: [
           _showSearch == false ?
          IconButton(
            tooltip: 'Search',
            onPressed: (){
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
          ) : Container() 
        ],
      ),
      body: ListView(
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
                Map item = chatList[index];
                return ListTile(
                  onTap: (){
                    Navigator.pushReplacement<void, void>(
                      context, MaterialPageRoute(
                        builder: (BuildContext context) => ChatConversation()
                      )
                    );
                  },
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      "${item["photo"]}",
                      height: 42, width: 42, fit: BoxFit.cover,
                    ),
                  ),
                  
                  title: Container(
                    alignment: Alignment.topLeft,
                      child: Text('${item["name"]}',
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.titleMedium,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  subtitle: Container(
                    alignment: Alignment.topLeft,
                      child: Text('${item["lastmessage"]}',
                      maxLines: 1, overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.labelMedium,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),

                  trailing: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('${item["date"]}',
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.labelMedium,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                        SizedBox(height: 5),
                        Icon(Icons.chevron_right_outlined, size: 20,)

                      ],
                    ),
                  ),

                );
              }
            ),
            ),
        
          
        ],
      ),
    );
  }
}
