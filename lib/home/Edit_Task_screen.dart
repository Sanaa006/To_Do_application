import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_application/My_theme.dart';
import 'package:todo_list_application/firebase_utils.dart';
import 'package:todo_list_application/model/task.dart';

import '../provider/list_provider.dart';
class EditScreen extends StatefulWidget {
  static const String routeName="Edit_Task_Screen";

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  var formKey = GlobalKey<FormState>();
  late var args;
  late DateTime selectedDate=args.dateTime!;

  late ListProvider listProvider;

  @override
  Widget build(BuildContext context) {
    listProvider=Provider.of<ListProvider>(context);
   args = ModalRoute.of(context)?.settings.arguments as Tasks;
  TextEditingController titleController=TextEditingController(text: args.title);
  TextEditingController descriptioncontroller=TextEditingController(text: args.description);


    return Scaffold(

      appBar:AppBar(
          toolbarHeight: MediaQuery.of(context).size.height*0.20,
          title:Text(AppLocalizations.of(context)!.todolist,style:Theme.of(context).textTheme.titleLarge)
      ),
        body: SingleChildScrollView(
          child: Container(

               decoration: BoxDecoration(
                 color: Theme.of(context).primaryColorLight,
                 borderRadius: BorderRadius.circular(15)
               ),

      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery
              .of(context)
              .size
              .width * 0.06,
          vertical: MediaQuery
              .of(context)
              .size
              .height * 0.06,
      ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(AppLocalizations.of(context)!.edit_task,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center),

                Form(

                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:  EdgeInsets.all(20),
                        child: TextFormField(
                          controller: titleController,
                          onChanged:(text){
                          args.title=text;

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
                          controller: descriptioncontroller,
                          onChanged:(text){
                            args.description=text;

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
                          //edit task
                          editDitailsofTask(args);


                        },
                        child: Text(AppLocalizations.of(context)!.save_changes,
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
      ),
        )
    );
  }

  void showCalender()async {
    var choosenDate = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 36500)));
    if(choosenDate != null){
      selectedDate=choosenDate;

      setState(() {

      });
    }
  }
  Future<void> editDitailsofTask(Tasks task){
  return  FirebaseUtils.getTaskcollection().doc(task.id).update({
    'title':args.title,
    'description':args.description,
    "dateTime":selectedDate.millisecondsSinceEpoch,
  }).timeout(Duration (milliseconds: 500),onTimeout: (){

    print("task apdate successfuly");
    listProvider.getAllTaskFromFirebase();
    Navigator.pop(context);

  });;

  }
}
