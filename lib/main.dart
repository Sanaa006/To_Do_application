import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_application/My_theme.dart';
import 'package:todo_list_application/auth/login/login_screen.dart';
import 'package:todo_list_application/home/Edit_Task_screen.dart';
import 'package:todo_list_application/home/Home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_list_application/provider/app_config_provider.dart';
import 'package:todo_list_application/provider/list_provider.dart';
import 'auth/register/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 await FirebaseFirestore.instance.disableNetwork();
 FirebaseFirestore.instance.settings =
      Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>AppConfigPovider()),
    ChangeNotifierProvider(create: (context)=>ListProvider())
  ],
    child:MyApp()
  ));
}

class MyApp extends StatelessWidget {

  late var provider;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     provider = Provider.of<AppConfigPovider>(context);
    initprefirance();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        RegisterScreen.routeName: (context) => RegisterScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        EditScreen.routeName: (context) => EditScreen(),
      },
      theme: MyTheme.lightTheme,
      themeMode: provider.themeApp,
      darkTheme: MyTheme.darkTheme,
      locale: Locale(provider.langaugeApp),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }

  Future<void> initprefirance()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String language = prefs.getString('langaugeApp')??"en";
  }
}
