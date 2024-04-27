import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_application/firebase_utils.dart';
import 'package:todo_list_application/model/task.dart';

class ListProvider extends ChangeNotifier{
  DateTime selectDate =DateTime.now();
  List<Tasks> tasksList=[];
  void getAllTaskFromFirebase()async{
    //get all tasks
    QuerySnapshot<Tasks> queryTask=await FirebaseUtils.getTaskcollection().get();
    //List<QueryDocumentSnapshot<Tasks>>
    tasksList=queryTask.docs.map((doc){
      return doc.data();
    }).toList();

    //filter all tasks
    // select date => date time
   tasksList= tasksList.where((task){
      if(task.dateTime?.day==selectDate.day&&
          task.dateTime?.month==selectDate.month&&
          task.dateTime?.year==selectDate.year){
        return true;
      }
      return false;
    }).toList();
   tasksList.sort((task1,task2){
     return task1.dateTime!.compareTo(task2.dateTime!);
   });
 print("get all tasks");



  notifyListeners();
  }

  changeDatetime(DateTime newDate){
    selectDate =newDate;
    getAllTaskFromFirebase();
   // notifyListeners();
  }

}