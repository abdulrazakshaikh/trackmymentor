import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
 
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // //bottomNavigationBar: BottomNavigation(),
      // appBar: AppBar(
      //   title: Text('Profile'.toUpperCase()),
      //   actions: [],
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 160,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30), 
                bottomRight: Radius.circular(30),
              )
            ),
            // backgroundColor: Theme.of(context).colorScheme.secondary,
            backgroundColor: Theme.of(context).colorScheme.primary,
            leading: IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.arrow_back),
            ),
            title: Text('Profile'),
            actions: [
              Container(
                padding: EdgeInsets.all(10),
                
                child: IconButton(
                onPressed: (){}, 
                icon: Icon(Icons.mode_edit_outlined),
                style: IconButton.styleFrom(
                  fixedSize: Size(40, 44),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                child: Container(
                margin: EdgeInsets.only(top: 54),
                padding: EdgeInsets.symmetric(horizontal: 15),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  // color: Theme.of(context).colorScheme.secondary,
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: 84,
                        height: 84,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey,
                        ),
                        child: Image.asset('assets/images/default.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Jemimah Reese',
                            style: GoogleFonts.lato(
                              textStyle: Theme.of(context).textTheme.titleLarge,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.2,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                          SizedBox(height: 5),
                          // Row(
                          //   children: [
                          //     Icon(Icons.email_outlined, size: 14, color: Theme.of(context).colorScheme.onPrimary,),
                          //     SizedBox(width: 10),
                          //     Text('jemimah@gmail.com',
                          //       style: GoogleFonts.lato(
                          //         textStyle: Theme.of(context).textTheme.bodySmall,
                          //         fontWeight: FontWeight.w600,
                          //         letterSpacing: 1.2,
                          //         fontSize: 13,
                          //         color: Theme.of(context).colorScheme.onPrimary,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(height: 5),
                          // Row(
                          //   children: [
                          //     Icon(Icons.phone_outlined, size: 14, color: Theme.of(context).colorScheme.onPrimary,),
                          //     SizedBox(width: 10),
                          //     Text('+91 9876543210',
                          //       style: GoogleFonts.lato(
                          //         textStyle: Theme.of(context).textTheme.bodySmall,
                          //         fontWeight: FontWeight.w600,
                          //         letterSpacing: 1.2,
                          //         fontSize: 13,
                          //         color: Theme.of(context).colorScheme.onPrimary,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(height: 10),
                          RatingBarIndicator(
                            rating: 2.5,
                            
                            itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 18,
                            direction: Axis.horizontal,
                          ),
                        ],
                      )
                    )

                  ],
                ),
              ),
              )
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                  Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                  Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                  Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                  Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                  Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                ],
              ),
            )
          ),
        ],
      )
    );
  }
}
