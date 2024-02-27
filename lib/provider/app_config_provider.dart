import 'package:flutter/material.dart';

class AppConfigPovider extends  ChangeNotifier{
    /// data which when change will efact on all widget in application
  String langaugeApp="en";
  ThemeMode themeApp=ThemeMode.light;
  changeLangaugeApp(String newLanguageApp){
    if(newLanguageApp==langaugeApp){
      return;
    }
    langaugeApp=newLanguageApp;
    notifyListeners();
  }
  changeThemeApp(ThemeMode newThemeApp){
    if(newThemeApp==themeApp){
      return;
    }
    themeApp=newThemeApp;
    notifyListeners();
  }
}