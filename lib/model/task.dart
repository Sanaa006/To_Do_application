class Tasks{
  static const String collectionName="tasks";
  String? id;
  String? title;
  String? description;
  DateTime? dateTime;
  bool? isdone;
  Tasks({this.id='',required this.title,required this.description,required this.dateTime,this.isdone=false});
  Tasks.formfirebase(Map<String,dynamic> data):this(
    id: data['id'] as String,
    title: data['title'] as String,
    description: data['description'] as String,
    dateTime:DateTime.fromMillisecondsSinceEpoch(data['dateTime']),
    isdone: data['isdone'] as bool
  );
 Map<String, dynamic> toFireSore(){
    return {
      "id":id,
      "title":title,
      "description":description,
      "dateTime":dateTime?.millisecondsSinceEpoch,
      "isdone":isdone
    };

  }
}
/// writing data object => json map
/// reading data map =>