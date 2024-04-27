import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_list_application/home/settings/settings_Tab.dart';
import 'package:todo_list_application/home/task_list/add_task_bottom_sheet.dart';
import 'package:todo_list_application/home/task_list/task_list_Tab.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName = "Home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectTap=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        toolbarHeight: MediaQuery.of(context).size.height*0.20,
        title:selectTap==0?Text(AppLocalizations.of(context)!.todolist,style:Theme.of(context).textTheme.titleLarge):Text(AppLocalizations.of(context)!.settings,style:Theme.of(context).textTheme.titleLarge)
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 9,
        child: BottomNavigationBar(
          onTap: (index){
            selectTap=index;
            setState(() {
            });
          },
          currentIndex:selectTap ,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: AppLocalizations.of(context)!.task_list,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: AppLocalizations.of(context)!.settings,
            ),
          ],
        ),
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: (){
          showAddTaskBottomSheet();
        },
        child: Icon(Icons.add,size: 35,),
      backgroundColor: Theme.of(context).primaryColor,
      ) ,
      floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked ,
      body: selectTap==0?TaskListTab():SettingsTab(),
    );
  }

  void showAddTaskBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder:(context) => AddTaskBottomSheet(),
      
    );
  }
}
