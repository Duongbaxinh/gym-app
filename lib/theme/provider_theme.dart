import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/theme/custome_theme.dart';

class ManageThemeClass with ChangeNotifier{
 ThemeData _themeData = ThemeDataClass.darkTheme;
 get themeModel => _themeData;

 toggleThemeData(bool isDark){
   _themeData =  isDark ? ThemeDataClass.darkTheme : ThemeDataClass.darkTheme;
   notifyListeners();
 }

}