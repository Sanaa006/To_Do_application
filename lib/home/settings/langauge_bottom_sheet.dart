import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_application/provider/app_config_provider.dart';
class LangaugeBottomSheet extends StatefulWidget {
  const LangaugeBottomSheet({super.key});

  @override
  State<LangaugeBottomSheet> createState() => _LangaugeBottomSheetState();
}

class _LangaugeBottomSheetState extends State<LangaugeBottomSheet> {
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
              ///Change language to English
              provider.changeLangaugeApp("en");
              Navigator.pop(context);
            },
            child:provider.langaugeApp=="en"?getSelectedItem(AppLocalizations.of(context)!.english):getUnselectedItem(AppLocalizations.of(context)!.english)
          ),
          SizedBox(height: 25,),
          InkWell(
              onTap: (){
            ///change language to arabic
                provider.changeLangaugeApp("ar");
                Navigator.pop(context);
          },
              child:provider.langaugeApp=="ar"?getSelectedItem(AppLocalizations.of(context)!.arabic):getUnselectedItem(AppLocalizations.of(context)!.arabic) ),
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
