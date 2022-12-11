import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:trackmy_mentor/ui/project/photo_view_image.dart';

class ProjectImageSlider extends StatefulWidget {
  List<String> images;

  ProjectImageSlider(
    this.images, {
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
  List galleryItems = [];

  late int currentIndex = widget.initialIndex;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    galleryItems = widget.images;
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
            String item = galleryItems[index];
            return Container(
              margin: EdgeInsets.only(right: 10, left: index == 0 ? 10 : 0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PhotoGallery(widget.images)));
                },
                child: Card(
                  elevation: 5,
                  shadowColor: Theme.of(context).shadowColor.withOpacity(0.35),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                          width: 1, color: Colors.grey.withOpacity(0.2))),
                  child: Container(
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        '${item}',
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

