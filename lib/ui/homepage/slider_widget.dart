import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trackmy_mentor/view_model/banner_view_model.dart';

import '../../model/storage/shared_prefs.dart';

class SliderWidget extends StatefulWidget {
  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  bool sTeacher = SharedPrefs().userdata?.type == "2";
  List<Widget> listIMage = [];
  List<String> slistImage = [];
  late BannerViewModel bannerViewModel;
  CarouselController buttonCarouselController = CarouselController();
  PageController controller = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      sTeacher = SharedPrefs().userdata?.type == "2";
      sTeacher
          ? await bannerViewModel.getTeacherBannerList()
          : await bannerViewModel.getSudentBannerList();
      slistImage = bannerViewModel.listData;
      slistImage.forEach((element) {
        listIMage.add(Container(
          //   height: 100,
          margin: EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Image.network(element, fit: BoxFit.cover, width: 1000.0),
          ),
        )
            // Image.network(element,)
            );
      });
      setState(() {});
      autoChange();
    });
  }

  void autoChange() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      index = index + 1;
      if (index == listIMage.length) {
        index = 0;
        controller.animateToPage(index,
            duration: Duration(milliseconds: 300), curve: Curves.linear);
      } else {
        controller.animateToPage(index,
            duration: Duration(milliseconds: 300), curve: Curves.linear);
      }
      autoChange();
      setState(() {});
    });
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    bannerViewModel = context.watch<BannerViewModel>();
    return bannerViewModel.isLoading
        ? Container(
            height: 150, child: Center(child: CircularProgressIndicator()))
        : listIMage.length == 0
            ? Container(
                height: 150,
                child: Center(
                  child: Text(
                    "No search record found",
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.titleMedium,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            : Column(
                children: [
                  true
                      ? SizedBox(
                          height: 150,
                          child: PageView(
                            controller: controller,
                            children: listIMage,
                          ),
                        )
                      : CarouselSlider.builder(
                          itemCount: listIMage.length,
                          carouselController: buttonCarouselController,

                          //carouselController: this,
                          options: CarouselOptions(
                            height: 150,
                            //aspectRatio: 16/9,
                            //viewportFraction: 0.8,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 5),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 1200),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            onPageChanged:
                                (int index, CarouselPageChangedReason reason) {
                              print("index $index");
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                //controller= ((buttonCarouselController as CarouselControllerImpl).state1 as CarouselState).pageController!;
                                controller.animateTo(index.toDouble(),
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.linear);
                                setState(() {});
                              });
                            },
                            scrollDirection: Axis.horizontal,
                          ),

                          //carouselController: controller,
                          itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) {
                            return listIMage[itemIndex];
                          },
                        ),
                  SizedBox(
                    height: 2,
                  ),
                  SmoothPageIndicator(
                    controller: controller,
                    count: listIMage.length,
                    effect: WormEffect(
                        dotHeight: 7,
                        dotWidth: 7,
                        type: WormType.thin,
                        activeDotColor: Theme.of(context).primaryColor,
                        dotColor:
                            Theme.of(context).primaryColor.withOpacity(0.5)
                        // strokeWidth: 5,
                        ),
                  ),
                ],
              );
  }
}
