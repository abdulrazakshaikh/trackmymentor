import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfileEdit extends StatefulWidget {

  @override
  State<UserProfileEdit> createState() => _UserProfileEditState();
}

class _UserProfileEditState extends State<UserProfileEdit> {
// TextEditingController emailController = new TextEditingController();
  // TextEditingController _controller;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = new TextEditingController(text: '');
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: 
      Container(
        margin: EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                 Navigator.pop(context);
                  },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  alignment: Alignment.center,
                ),
                child: Text('Save & Update'),
              ),
            )
          ],
        ),
      ),
      // appBar: AppBar(
      //   title: Text('Profile'.toUpperCase()),
      //   actions: [],
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: 
              Container(
                padding: EdgeInsets.all(10),
                  child: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                  style: IconButton.styleFrom(
                    fixedSize: Size(40, 44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            automaticallyImplyLeading: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )
            ),

            title: Text('Edit Profile'.toUpperCase()),
            titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle!.merge(
              TextStyle(color: Theme.of(context).colorScheme.onPrimary)
            ),
            expandedHeight: 180,
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
                              backgroundImage: NetworkImage('https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg'),
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
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(10),
                    child: Text('Update your User Profile'.toUpperCase(),
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.titleSmall,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.75,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                  
                  
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      initialValue: 'Augustus Harrell',
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelText: 'Name'.toLowerCase(),
                        labelStyle: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          letterSpacing: 1.8,
                          fontWeight: FontWeight.w300),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      initialValue: 'Lorem Ipsum Designer',
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelText: 'Role'.toLowerCase(),
                        labelStyle: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          letterSpacing: 1.8,
                          fontWeight: FontWeight.w300),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      initialValue: '+91 9876543210',
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelText: 'Mobile'.toLowerCase(),
                        labelStyle: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          letterSpacing: 1.8,
                          fontWeight: FontWeight.w300),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
                        ),
                        suffix: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                            foregroundColor: Theme.of(context).colorScheme.primary,
                          ),
                          onPressed: () {},
                          child: Text(
                            'Verify',
                            style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.titleSmall,
                              color: Theme.of(context).colorScheme.primary,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      initialValue: 'stephan@1254979@gmail.com',
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelText: 'Email Address'.toLowerCase(),
                        labelStyle: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          letterSpacing: 1.8,
                          fontWeight: FontWeight.w300),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
                        ),
                        suffix: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                            foregroundColor: Theme.of(context).colorScheme.primary,
                          ),
                          onPressed: () {},
                          child: Text(
                            'Verify',
                            style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.titleSmall,
                              color: Theme.of(context).colorScheme.primary,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      initialValue: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      maxLines: 5,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelText: 'Description'.toLowerCase(),
                        labelStyle: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          letterSpacing: 1.8,
                          fontWeight: FontWeight.w300),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
                        ),
                      ),
                    ),
                  ),
                
                ],
              ),
            )
          ),
        ],
      )
    );
  }
}
