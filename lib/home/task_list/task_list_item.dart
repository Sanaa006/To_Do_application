import 'package:flutter/material.dart';

import '../../My_theme.dart';

class TaskListItem extends StatelessWidget {
  const TaskListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            margin: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            child: ListTile(
              leading: Container(
                height: MediaQuery.of(context).size.height*0.8,
                width: 5,
                color: Theme.of(context).primaryColor,
              ),
              title: Text('Title',style:Theme.of(context).textTheme.titleMedium),
              subtitle: Text('Subtitle',style: Theme.of(context).textTheme.bodySmall,),
              trailing: Container(padding: EdgeInsets.symmetric(vertical: 5,horizontal: 18),decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                  color: MyTheme.primaryColor
              ),child: Icon(Icons.check,color: MyTheme.whiteColor,size: 30,)),
            ),
          ),
        ),
      ],
    );
  }
}
