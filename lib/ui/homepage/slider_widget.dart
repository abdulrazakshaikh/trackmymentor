import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  int size = 4;

  SliderWidget({this.size = 4});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: widget.size == 4
            ? [
                Image.network(
                    "https://i.pinimg.com/originals/0b/a3/d6/0ba3d60362c7e6d256cfc1f37156bad9.jpg"),
                Image.network(
                    "https://cdn.pixabay.com/photo/2015/10/29/14/38/web-1012467__340.jpg"),
                Image.network(
                    "https://img.freepik.com/free-vector/blue-technology-digital-banner-design_1017-32257.jpg?w=400"),
                Image.network(
                    "https://cdn.pixabay.com/photo/2015/10/29/14/38/web-1012467__340.jpg"),
              ]
            : [
                Image.network(
                    "https://i.pinimg.com/originals/0b/a3/d6/0ba3d60362c7e6d256cfc1f37156bad9.jpg"),
              ],
        options: CarouselOptions(
          height: 150,
          //aspectRatio: 16/9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: widget.size == 4 ? true : false,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          onPageChanged: (int index, CarouselPageChangedReason reason) {},
          scrollDirection: Axis.horizontal,
        ));
  }
}
