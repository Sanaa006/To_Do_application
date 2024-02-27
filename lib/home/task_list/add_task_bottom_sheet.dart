import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:todo_list_application/My_theme.dart';
class AddTaskBottomSheet extends StatefulWidget {


  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}


class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime selectedDate=DateTime.now();
  var formKey = GlobalKey<FormState>();
  String title="";
  String description="";
  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(AppLocalizations.of(context)!.add_new_task,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center),

            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:  EdgeInsets.all(20),
                    child: TextFormField(
                      onChanged:(text){
                        title=text;
                      } ,
                      validator: (text){
                        if(text!.isEmpty ){
                          return AppLocalizations.of(context)!.please_enter_title;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText:AppLocalizations.of(context)!.enter_task_title,
                        hintStyle: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(20),
                    child: TextFormField(
                      onChanged:(text){
                        description=text;
                      } ,
                      validator: (text){
                        if(text!.isEmpty){
                          return AppLocalizations.of(context)!.please_enter_description;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText:AppLocalizations.of(context)!.enter_task_description,
                        hintStyle: Theme.of(context).textTheme.bodySmall,
                      ),
                      maxLines: 4,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(AppLocalizations.of(context)!.select_time,style: Theme.of(context).textTheme.labelLarge),
                    ),
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: InkWell(onTap: (){
                      showCalender();
                    },
                        child: Text(  DateFormat('yyyy-MM-dd').format(selectedDate),style: Theme.of(context).textTheme.titleSmall,textAlign: TextAlign.center)),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      addTask();
                    },
                    child: Text(AppLocalizations.of(context)!.add,
                        style:Theme.of(context).textTheme.labelMedium?.copyWith(color: MyTheme.whiteColor)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(MyTheme.primaryColor),
                      shape:MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ))
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showCalender()async {
   var choosenDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 36500)));
    if(choosenDate != null){
    selectedDate=choosenDate;

    setState(() {

    });
    }
  }

  void addTask() {
   if( formKey.currentState!.validate()==true){

   }
  }

}
