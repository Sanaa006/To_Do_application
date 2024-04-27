import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigPovider extends  ChangeNotifier{
    /// data which when change will efact on all widget in application
  String langaugeApp="en";
  ThemeMode themeApp=ThemeMode.light;
  // Obtain shared preferences.

  changeLangaugeApp(String newLanguageApp)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('langaugeApp', langaugeApp);
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