

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_application/My_theme.dart';
import 'package:todo_list_application/firebase_utils.dart';
import 'package:todo_list_application/home/task_list/task_list_item.dart';
import 'package:todo_list_application/provider/app_config_provider.dart';
import 'package:todo_list_application/provider/list_provider.dart';

import '../../model/task.dart';

class TaskListTab extends StatefulWidget {
  @override
  State<TaskListTab> createState() => _TaskListTabState();
}

class _TaskListTabState extends State<TaskListTab> {


  @override
  Widget build(BuildContext context) {
    var listProvider=Provider.of<ListProvider>(context);
    if(listProvider.tasksList.isEmpty){
    listProvider.getAllTaskFromFirebase();}
    var provider=Provider.of<AppConfigPovider>(context);
    return Column(
      children: [
        EasyDateTimeLine(
          initialDate: listProvider.selectDate,
          onDateChange: (selectedDate) {
              listProvider.changeDatetime(selectedDate); 
          },
          activeColor: MyTheme.primaryColor,
          locale:provider.langaugeApp ,
          dayProps: const EasyDayProps(
            landScapeMode: true,
            activeDayStyle: DayStyle(
              borderRadius: 48.0,
            ),
            dayStructure: DayStructure.dayStrDayNum,
          ),
          headerProps: const EasyHeaderProps(
            dateFormatter: DateFormatter.fullDateDMonthAsStrY(),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder:(context,index)=> TaskListItem(task: listProvider.tasksList[index] ),
            itemCount:listProvider.tasksList.length,
          ),
        )
      ],
    );
  }


}
