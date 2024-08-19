import 'package:chat_app/theme/dark_mode.dart';
import 'package:chat_app/theme/light_mode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
ThemeData _themeData = lightMode;
ThemeData get themedata => _themeData;
bool get isDarkMode => _themeData == darkMode;
set themedata(ThemeData themeData){
  _themeData = themeData;
  notifyListeners();
}
void toggleTheme(){
  if(_themeData==lightMode){
    themedata = darkMode;
  }
  else{
themedata = lightMode;
  }
}
}