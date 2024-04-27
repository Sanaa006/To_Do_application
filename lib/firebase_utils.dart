import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_list_application/model/task.dart';

class FirebaseUtils{
  static CollectionReference<Tasks> getTaskcollection(){
  return FirebaseFirestore.instance.collection(Tasks.collectionName).
    withConverter<Tasks>(
        fromFirestore: (snapshot, options) => Tasks.formfirebase(snapshot.data()!),
        toFirestore: (task, options) => task.toFireSore());
  }
  static Future<void> addTaskToFireStore(Tasks task){
    var taskCollectionRef=getTaskcollection();//collection
    DocumentReference<Tasks> taskdocRef= taskCollectionRef.doc();
    task.id=taskdocRef.id;
    return taskdocRef.set(task);
  }
  static Future<void> deleteTaskFromFireStore(Tasks task){
  return getTaskcollection().doc(task.id).delete();
  }
  static Future<void> updatestatTask(Tasks task){
   return getTaskcollection().doc(task.id).update({"isdone":true});
  }
}