import 'dart:js';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'package:google_fonts/google_fonts.dart';

// ------TEXT THEME--------//
TextTheme lightTextTheme = TextTheme(
  displayLarge: GoogleFonts.lato(
      textStyle: const TextStyle(color: arstextColorLight, fontSize: 57, fontWeight: FontWeight.w300,)
  ),
  displayMedium: GoogleFonts.lato(
      textStyle: const TextStyle(color: arstextColorLight, fontSize: 45, fontWeight: FontWeight.w300,)
  ),
  displaySmall: GoogleFonts.lato(
      textStyle: const TextStyle(color: arstextColorLight, fontSize: 36, fontWeight: FontWeight.w300,)
  ),
  headlineLarge: GoogleFonts.lato(
    textStyle: const TextStyle(color: arstextColorLight, fontSize: 32, fontWeight: FontWeight.w300,)
  ),
  headlineMedium: GoogleFonts.lato(
      textStyle: const TextStyle(color: arstextColorLight, fontSize: 28, fontWeight: FontWeight.w300,)
  ),
  headlineSmall: GoogleFonts.lato(
      textStyle: const TextStyle(color: arstextColorLight, fontSize: 24, fontWeight: FontWeight.w300,)
  ),
  titleLarge: GoogleFonts.lato(
      textStyle: const TextStyle(color: arstextColorLight, fontSize: 22, fontWeight: FontWeight.w500, )
  ),
  titleMedium: GoogleFonts.lato(
      textStyle: const TextStyle(color: arstextColorLight, fontSize: 16, letterSpacing: 0.15, fontWeight: FontWeight.w500,)
  ),
  titleSmall: GoogleFonts.lato(
      textStyle: const TextStyle(color: arstextColorLight, fontSize: 14, letterSpacing: 0.1, fontWeight: FontWeight.w500,)
  ),
  labelLarge: GoogleFonts.lato(
      textStyle: TextStyle(color: arstextColorLight.withOpacity(0.65), fontSize: 14, letterSpacing: 0.5, fontWeight: FontWeight.w500,)
  ),
  labelMedium: GoogleFonts.lato(
      textStyle: TextStyle(color: arstextColorLight.withOpacity(0.65), fontSize: 12, letterSpacing: 0.5, fontWeight: FontWeight.w500,)
  ),
  labelSmall: GoogleFonts.lato(
      textStyle: TextStyle(color: arstextColorLight.withOpacity(0.65), fontSize: 11, letterSpacing: 0.5, fontWeight: FontWeight.w500,)
  ),
  bodyLarge: GoogleFonts.lato(
      textStyle: const TextStyle(color: arstextColorLight, fontSize: 16, letterSpacing: 0.5, fontWeight: FontWeight.w500,)
  ),
  bodyMedium: GoogleFonts.lato(
      textStyle: const TextStyle(color: arstextColorLight, fontSize: 14, letterSpacing: 0.25, fontWeight: FontWeight.w500,)
  ),
  bodySmall: GoogleFonts.lato(
      textStyle: const TextStyle(color: arstextColorLight, fontSize: 12, letterSpacing: 0.4, fontWeight: FontWeight.w500,)
  ),
);


// ------COLORSCHEME--------//
const lightColorScheme = ColorScheme(
  brightness: Brightness.light,

  primary: arsprimary,
  onPrimary: arsonprimary,
  primaryContainer: arsprimarycontainer,
  onPrimaryContainer: arsprimary,

  secondary: arssecondary,
  onSecondary: arsonsecondary,
  secondaryContainer: arssecondarycontainer,
  onSecondaryContainer: arssecondary,

  tertiary: arstertiary,
  onTertiary: arsontertiary,
  tertiaryContainer: arstertiarycontainer,
  onTertiaryContainer: arstertiary,

  surface: arssurfaceLight,
  onSurface: Color(0xFF1C1B1F),
  surfaceVariant: Color(0xFFFFFFFF),
  onSurfaceVariant: Color(0xFF49454F),
  background: arsbackgroundLight,
  onBackground: Color(0xFF1C1B1F),
  error: arserror,
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFF9DEDC),
  onErrorContainer: Color(0xFF410E0B),
  outline: arsoutline,
);

// ------APPBAR--------//
AppBarTheme lightAppbarTheme = AppBarTheme(
  backgroundColor: arsappbarbackgroundLight,
  surfaceTintColor: arsappbarbackgroundLight,
  elevation: 4,
  shadowColor: arsshadow,
  titleTextStyle: GoogleFonts.robotoCondensed(textStyle: const TextStyle(fontSize: 15, color: arstextColorLight, letterSpacing: 1.2, fontWeight: FontWeight.bold)),
  // titleSpacing: 0,
);

// ------BOTTOM NAVIGATION BAR--------//
BottomNavigationBarThemeData lightBottomNavigationBarTheme = BottomNavigationBarThemeData(
  // unselectedIconTheme: IconThemeData(color: arstextColorLight),
  // selectedIconTheme: IconThemeData(color: arsprimary),
  backgroundColor: arsappbarbackgroundLight,
  type: BottomNavigationBarType.fixed,
  showSelectedLabels: false,
  showUnselectedLabels: false,
  selectedItemColor: arsprimary,
  unselectedItemColor: arssecondary,

);


// ------DRAWER--------//
DrawerThemeData lightDrawerTheme = const DrawerThemeData(
  backgroundColor: arsdrawerbackgroundLight,
  elevation: 4,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
  ),
);

// ------ICON THEME--------//
IconThemeData lightIconTheme = IconThemeData(
  size: 20,
  color: const Color(0xFF31313d),
);


// ------ELEVATED BUTTON THEME--------//
ElevatedButtonThemeData lightElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: arsprimary,
    foregroundColor: Colors.white,
    minimumSize: Size(64, 40),
    elevation: 3,
    // shape: RoundedRectangleBorder(
    //   borderRadius: BorderRadius.circular(6)
    // ),
    textStyle: GoogleFonts.lato(
      textStyle: TextStyle(fontSize: 15, letterSpacing: 1.2,fontWeight: FontWeight.w500)
    ),
  ),
);



// ------OUTLINED BUTTON THEME--------//
OutlinedButtonThemeData lightOutlinedButtonTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    foregroundColor: arsprimary,
    minimumSize: Size(64, 40),
    // shape: RoundedRectangleBorder(
    //   borderRadius: BorderRadius.circular(6)
    // ),
    side: BorderSide(width: 1, color: arsprimary),
    textStyle: GoogleFonts.lato(
      textStyle: TextStyle(fontSize: 15, letterSpacing: 1.2,fontWeight: FontWeight.w500)
    ),
  ),
);



// ------TEXT BUTTON THEME--------//
TextButtonThemeData lightTextButtonTheme = TextButtonThemeData(
  style: TextButton.styleFrom(
    foregroundColor: arsprimary,
    minimumSize: Size(64, 40),
    // shape: RoundedRectangleBorder(
    //   borderRadius: BorderRadius.circular(6)
    // ),
    textStyle: GoogleFonts.lato(
      textStyle: TextStyle(fontSize: 15, letterSpacing: 1.2,fontWeight: FontWeight.w500)
    ),
  ),
);


// ------BUTTON THEME THEME--------//
ButtonThemeData lightButtonTheme = ButtonThemeData(
  // shape: RoundedRectangleBorder(
  //   borderRadius: BorderRadius.circular(0)
  // ),  
  shape: StadiumBorder()
);


// ------EXPANSIONTILE THEME--------//
ExpansionTileThemeData lightExpansionTileTheme = ExpansionTileThemeData(
  iconColor: arstextColorLight,
  collapsedIconColor: arstextColorLight,
  
);

// ------FLOATING ACTION BUTTON THEME--------//
FloatingActionButtonThemeData lightFloatingActionButtonTheme = FloatingActionButtonThemeData(
  backgroundColor: arsprimary,
  foregroundColor: arsonprimary,
  hoverElevation: 0,
  extendedIconLabelSpacing: 10,
  extendedTextStyle: GoogleFonts.lato(
    textStyle: TextStyle(fontSize: 15, letterSpacing: 1.2,fontWeight: FontWeight.w500)
  ),
);

// ------CARD THEME--------//
CardTheme lightCardTheme = CardTheme(
  elevation: 0,
  color: arscardLight,
  surfaceTintColor: arscardLight,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4),
    side: BorderSide(width: 1, color: arsoutline.withOpacity(0.1)),
  ),
);

// ------THEMEDATA--------//
ThemeData lightthemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: arsprimary,
    colorScheme: lightColorScheme,

    appBarTheme: lightAppbarTheme,
    // bottomAppBarTheme: lightBottomAppbarTheme,
    bottomNavigationBarTheme: lightBottomNavigationBarTheme,
  
  

    drawerTheme: lightDrawerTheme,
    cardTheme: lightCardTheme,
    

    iconTheme: lightIconTheme,    

    textButtonTheme: lightTextButtonTheme,
    buttonTheme: lightButtonTheme,
    elevatedButtonTheme: lightElevatedButtonTheme,
    outlinedButtonTheme: lightOutlinedButtonTheme,

    expansionTileTheme: lightExpansionTileTheme,

    
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
    textTheme : lightTextTheme,
  );
}

