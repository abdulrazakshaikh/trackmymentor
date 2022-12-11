import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoGallery extends StatefulWidget {
  List<String> galleryItems;

  PhotoGallery(this.galleryItems);

  @override
  State<StatefulWidget> createState() {
    return PhotoGalleryState();
  }
}

class PhotoGalleryState extends State<PhotoGallery> {
  int current_index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // elevation: 0,
        // scrolledUnderElevation: 0,
        title: Text("Images"),
        automaticallyImplyLeading: true,
        actions: [],
      ),
      bottomNavigationBar: Container(
        height: 30,
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(2, 0),
            ),
          ],
        ),
        child: SizedBox(
          child: Container(
              width: double.infinity,
              child: Align(
                  alignment: Alignment.center,
                  child:
                      Text("${current_index}/${widget.galleryItems.length}"))),
        ),
      ),
      body: Container(
          child: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(widget.galleryItems[index]),
            initialScale: PhotoViewComputedScale.contained * 0.8,
            heroAttributes: PhotoViewHeroAttributes(tag: index),
          );
        },
        itemCount: widget.galleryItems.length,
        loadingBuilder: (context, event) => Center(
          child: Container(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(),
          ),
        ),
        onPageChanged: (index) {
          setState(() {
            current_index = index + 1;
          });
        },
        /*  backgroundDecoration: widget.backgroundDecoration,
            pageController: widget.pageController,
            onPageChanged: onPageChanged,*/
      )),
    );
  }
}
