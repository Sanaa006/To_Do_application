import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_application/My_theme.dart';
import 'package:todo_list_application/home/task_list/task_list_item.dart';
import 'package:todo_list_application/provider/app_config_provider.dart';

class TaskListTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigPovider>(context);
    return Column(
      children: [
        EasyDateTimeLine(
          initialDate: DateTime.now(),
          onDateChange: (selectedDate) {
            print("---------");
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
            itemBuilder:(context,index)=> TaskListItem(),
            itemCount: 9,
          ),
        )
      ],
    );
  }
}
