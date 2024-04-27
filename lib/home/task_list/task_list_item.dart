

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_application/firebase_utils.dart';
import 'package:todo_list_application/provider/list_provider.dart';

import '../../My_theme.dart';
import '../../model/task.dart';
import '../Edit_Task_screen.dart';

class TaskListItem extends StatefulWidget {

  Tasks task;
  TaskListItem({required this.task});

  @override
  State<TaskListItem> createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  @override
  Widget build(BuildContext context) {
    var providerlist=Provider.of<ListProvider>(context);
    return Container(
      margin: EdgeInsets.all( 15),
      child: Slidable(
        // The start action pane is the one at the left or the top side.
        startActionPane: ActionPane(
          extentRatio: 0.50,
          // A motion is a widget used to control how the pane animates.
          motion: const ScrollMotion(),
          // All actions are defined in the children parameter.
          children:  [
            // A SlidableAction can have an icon and/or a label.
            SlidableAction(
              onPressed: (context){
                //delete of task
                FirebaseUtils.deleteTaskFromFireStore(widget.task).timeout(Duration(milliseconds: 500),onTimeout: (){
                  print("delete task successfuly");
                  providerlist.getAllTaskFromFirebase();
                });
              },
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),

              backgroundColor: MyTheme.rad,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
            SlidableAction(
              onPressed: (context){
                //edit of task
                Navigator.pushNamed(context,EditScreen.routeName,arguments: widget.task);
              },
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
              backgroundColor: MyTheme.green,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                child: ListTile(
                  leading: Container(
                    height: MediaQuery.of(context).size.height*0.8,
                    width: 5,
                    color:widget.task.isdone==true?MyTheme.green:Theme.of(context).primaryColor,
                  ),
                  title: Text(widget.task.title??" ",style:widget.task.isdone==true?Theme.of(context).textTheme.bodyMedium:Theme.of(context).textTheme.titleMedium),
                  subtitle: Text(widget.task.description??" ",style: Theme.of(context).textTheme.bodySmall,),
                  trailing: InkWell(
                    onTap: (){
                     FirebaseUtils.updatestatTask(widget.task);

                     providerlist.getAllTaskFromFirebase();
                    },
                    child:  widget.task.isdone==true?isdone(context):notdone()
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget isdone(BuildContext context){
    return Text("isdone",style:Theme.of(context).textTheme.bodyMedium ,);
  }
  Widget notdone(){
    return Container(padding: EdgeInsets.symmetric(vertical: 5,horizontal: 18),decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: MyTheme.primaryColor
    ),child:  Icon(Icons.check,color: MyTheme.whiteColor,size: 30,));
  }
}
