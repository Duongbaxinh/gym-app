import 'package:flutter/material.dart';
class DeclareColor {
  static const Color bgColor =  Color.fromARGB(255, 28, 28, 30);
  static const Color yellowColor =  Color.fromARGB(255, 206, 251, 63);
  static const Color darkGrey =  Color.fromARGB(255, 44, 44, 46);
  static const Color lightGrey =  Color.fromARGB(255, 58, 58, 60);

}
class CustomText {
  static const TextStyle text1 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 10,
    color: Colors.white,
  );
  static const TextStyle text2 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 13,
    color: Colors.white,
  );
  static const TextStyle text3 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 15,
    color: Colors.white,
  );
  static const TextStyle text4 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 17,
    color: Colors.white,
  );
  static const TextStyle text5= TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    color: Colors.white,
  );
  static const TextStyle text6 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 24,
    color: Colors.white,
  );
  static const TextStyle text7 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 36,
    color: Colors.white,
  );
}
class  ThemeDataClass {
 static  ThemeData darkTheme = ThemeData(
   brightness: Brightness.dark,
    primaryColor: DeclareColor.yellowColor,
   colorScheme: const ColorScheme(
     primary: DeclareColor.bgColor,
     brightness: Brightness.dark,
     onPrimary: DeclareColor.bgColor,
     secondary: DeclareColor.yellowColor,
     onSecondary: DeclareColor.yellowColor,
     background: DeclareColor.bgColor,
     onBackground: DeclareColor.bgColor,
     error: Colors.red,
     onError: Colors.red,
     surface: DeclareColor.darkGrey,
     onSurface: DeclareColor.darkGrey,
     onSecondaryContainer: DeclareColor.lightGrey
   ),
  listTileTheme: ListTileThemeData(
      dense: true,
      contentPadding: EdgeInsets.all(0)
  ),
  sliderTheme: SliderThemeData(
    thumbShape: SliderComponentShape.noThumb
  ),
  textTheme: const TextTheme(
    headline1: CustomText.text7,
    headline2: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: Colors.white,
    ),
    headline3: CustomText.text5,
    headline4: CustomText.text4,
    headline5: CustomText.text3,
    subtitle1: CustomText.text2,
    subtitle2: CustomText.text1,
  )
  );
}