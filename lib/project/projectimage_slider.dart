import 'dart:ui';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trackmy_mentor/profile/teacherprofile.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ProjectImageSlider extends StatefulWidget {
  
  ProjectImageSlider({
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialIndex = 0,
  
    this.scrollDirection = Axis.horizontal,
  }) : pageController = PageController(initialPage: initialIndex);

  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initialIndex;
  final PageController pageController;
  
  final Axis scrollDirection;

  @override
  _ProjectImageSliderState createState() => new _ProjectImageSliderState();

}

class _ProjectImageSliderState extends State<ProjectImageSlider> {
  List galleryItems = [
    {
      "id": "001",
      "image": "https://images.pexels.com/photos/3183153/pexels-photo-3183153.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    },
    {
      "id": "002",
      "image": "https://images.pexels.com/photos/7376/startup-photos.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    },
    {
      "id": "003",
      "image": "https://images.pexels.com/photos/669615/pexels-photo-669615.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    },
    {
      "id": "004",
      "image": "https://images.pexels.com/photos/10227348/pexels-photo-10227348.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    },
    {
      "id": "005",
      "image": "https://images.pexels.com/photos/13878056/pexels-photo-13878056.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    },
  ];


  late int currentIndex = widget.initialIndex;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }


  


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      height: MediaQuery.of(context).size.width < 321 ? 180 : 180,
      child: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: PageController(
            viewportFraction: MediaQuery.of(context).size.width < 321 ? 0.5 : 0.4,
          ),
          padEnds: false,
          pageSnapping: true,
          itemCount: galleryItems == null ? 0 : galleryItems.length,
          physics: PageScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            Map item = galleryItems[index];
            return Container(
              margin: EdgeInsets.only(right: 10, left: index == 0 ? 10 : 0),
              child: GestureDetector(
                onTap: () {},
                child: Card(
                  elevation: 5,
                  shadowColor: Theme.of(context).shadowColor.withOpacity(0.35),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(width: 1, color: Colors.grey.withOpacity(0.2))),
                  child: Container(
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        '${item["image"]}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        ),
    );

    // return Container(
    //   child: PhotoViewGallery.builder(
        
    //     scrollPhysics: const BouncingScrollPhysics(),
    //     builder: (BuildContext context, int index) {
    //       Map item = galleryItems[index];
    //       return PhotoViewGalleryPageOptions(
    //         // imageProvider: NetworkImage(galleryItems[index].image),
    //         imageProvider: NetworkImage('${item["image"]}'),
    //         initialScale: PhotoViewComputedScale.contained * 0.8,
    //         // heroAttributes: PhotoViewHeroAttributes(tag: galleryItems[index].id),
    //         heroAttributes: PhotoViewHeroAttributes(tag: item["id"]),
    //       );
    //     },
    //     itemCount: galleryItems == null ? 0 : galleryItems.length,
    //     loadingBuilder: (context, event) => Center(
    //       child: Container(
    //         width: 20.0,
    //         height: 20.0,
    //         child: CircularProgressIndicator(
    //           // value: event == null ? 0 : event.cumulativeBytesLoaded / event.expectedTotalBytes,
    //         ),
    //       ),
    //     ),
    //     backgroundDecoration: widget.backgroundDecoration,
    //     pageController: widget.pageController,
    //     onPageChanged: onPageChanged,
    //   ),
    // );
  }
  
}

