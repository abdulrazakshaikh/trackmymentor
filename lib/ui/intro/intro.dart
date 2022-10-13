import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_slider/introduction_slider.dart';
import 'package:trackmy_mentor/ui/login/login.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> with TickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    return IntroductionSlider(
      showStatusBar: true,
      scrollDirection: Axis.horizontal,
      dotIndicator: DotIndicator(
        selectedColor: Theme.of(context).colorScheme.secondary,
        // unselectedColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      ),
      done: Done(
        curve: Curves.easeInBack,
        animationDuration: Duration(milliseconds: 350),
        child: Row(
          children: [
            Text('Done'.toUpperCase(),
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.titleSmall,
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
            ),
            SizedBox(width: 5),
            Icon(Icons.done),
          ],
        ),
        home: Login(),
      ),
      next: Next(
        child: Row(
          children: [
            Text('Next'.toUpperCase(),
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.titleSmall,
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
            ),
            SizedBox(width: 5),
            Icon(Icons.arrow_forward, color: Theme.of(context).colorScheme.primary,)
          ],
        ),
      ),
      back: Back(
        child: Row(
          children: [
            Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.secondary,),
            SizedBox(width: 5),
            Text('Back'.toUpperCase(),
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.titleSmall,
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
            ),
          ],
        ),
        
      ),
      
      items: [
        IntroductionSliderItem(
          logo: Image.asset("assets/images/success.png",
            fit: BoxFit.contain,
          ),
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text("Lorem Ipsum Heading", textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.headlineSmall,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.2,
            ),
            ),
          ),
          subtitle: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text("Lorem Ipsum Dolor sit amet is a simply dummy text used for typesetting",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.labelMedium,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
            ),
            ),
          ),
        ),
        IntroductionSliderItem(
          logo: Image.asset("assets/images/success.png",
            fit: BoxFit.contain,
          ),
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text("Lorem Ipsum Heading", textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.headlineSmall,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.2,
            ),
            ),
          ),
          subtitle: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text("Lorem Ipsum Dolor sit amet is a simply dummy text used for typesetting",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.labelMedium,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
            ),
            ),
          ),
        ),
        IntroductionSliderItem(
          logo: Image.asset("assets/images/success.png",
            fit: BoxFit.contain,
          ),
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text("Lorem Ipsum Heading", textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.headlineSmall,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.2,
            ),
            ),
          ),
          subtitle: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text("Lorem Ipsum Dolor sit amet is a simply dummy text used for typesetting",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.labelMedium,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
            ),
            ),
          ),
        ),
      ],
    );
  }

}

