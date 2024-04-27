import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_application/provider/app_config_provider.dart';
class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigPovider>(context);
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              ///Change theme to light
              provider.changeThemeApp(ThemeMode.light);
              Navigator.pop(context);
            },
            child:provider.themeApp==ThemeMode.light?getSelectedItem(AppLocalizations.of(context)!.light):getUnselectedItem(AppLocalizations.of(context)!.light)
          ),
          SizedBox(height: 25,),
          InkWell(
              onTap: (){
            ///change theme to dark
                provider.changeThemeApp(ThemeMode.dark);
                Navigator.pop(context);
          },
              child:provider.themeApp==ThemeMode.dark?getSelectedItem(AppLocalizations.of(context)!.dark):getUnselectedItem(AppLocalizations.of(context)!.dark) ),
        ],
      ),
    );
  }

  Widget getSelectedItem(String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: Theme.of(context).textTheme.titleMedium,),
        Icon(Icons.check,color: Theme.of(context).primaryColor,size: 30,)
      ],
    );
  }
  Widget getUnselectedItem(String text){
    return Text(text,style: Theme.of(context).textTheme.labelMedium,);
  }
}
