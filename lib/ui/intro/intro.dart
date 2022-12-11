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
        child: GestureDetector(
          onTap: () {
            //print("dcsdvdv");
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Login()),
                (route) => false);
          },
          child: Row(
            children: [
              Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.secondary,
              ),
              SizedBox(width: 5),
              Text(
                'Skip'.toUpperCase(),
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
      ),
      
      items: [
        IntroductionSliderItem(
          logo: Image.asset(
            "assets/images/curious_cuate.png",
            fit: BoxFit.contain,
          ),
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              "Grow and earn like pro",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.headlineSmall,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.2,
              ),
            ),
          ),
          subtitle: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Find a tutor and hire for a assignment with them as per your preferences.",
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
          logo: Image.asset(
            "assets/images/mathematics.png",
            fit: BoxFit.contain,
          ),
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              "Hire coaches",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.headlineSmall,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.2,
              ),
            ),
          ),
          subtitle: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Excellent Coaches and trainers for various sports activities can also be found on hire.",
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
          logo: Image.asset(
            "assets/images/seminar.png",
            fit: BoxFit.contain,
          ),
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              "Complete project",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.headlineSmall,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.2,
              ),
            ),
          ),
          subtitle: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "You can post your requirements for experts help with Track Mentor as projects.",
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
          logo: Image.asset(
            "assets/images/thesis.png",
            fit: BoxFit.contain,
          ),
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              "Learn activity",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.headlineSmall,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.2,
              ),
            ),
          ),
          subtitle: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Loren different activities on Track My Mentor from experts tutors.",
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

