import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_application/My_theme.dart';
import 'package:todo_list_application/home/settings/langauge_bottom_sheet.dart';
import 'package:todo_list_application/home/settings/theme_bottom_sheet.dart';
import 'package:todo_list_application/provider/app_config_provider.dart';
class SettingsTab extends StatefulWidget {


  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override

  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigPovider>(context);
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 30,vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,style:Theme.of(context).textTheme.titleSmall),
          InkWell(
            onTap: (){
             showLangaugeBottomSheet();
            },
            child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                border: Border.all(color: MyTheme.primaryColor,width: 1)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.langaugeApp=="en"? AppLocalizations.of(context)!.english:AppLocalizations.of(context)!.arabic,style: Theme.of(context).textTheme.labelSmall,),
                  Icon(Icons.arrow_drop_down,color:Theme.of(context).primaryColor)
                ],
              ),
            ),
          ),
          Text(AppLocalizations.of(context)!.mode,style:Theme.of(context).textTheme.titleSmall),
          InkWell(
            onTap: (){
              showThemeBottomSheet();
            },
            child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  border: Border.all(color: MyTheme.primaryColor,width: 1)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.themeApp==ThemeMode.light? AppLocalizations.of(context)!.light:AppLocalizations.of(context)!.dark,style: Theme.of(context).textTheme.labelSmall,),
                  Icon(Icons.arrow_drop_down,color:Theme.of(context).primaryColor)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLangaugeBottomSheet() {
    showModalBottomSheet(context: context, builder:(context)=> LangaugeBottomSheet());
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(context: context, builder:(context)=> ThemeBottomSheet());
  }
}
