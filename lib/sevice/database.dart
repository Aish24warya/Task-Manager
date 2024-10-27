import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseMethod {
  //Create
  Future<void> addTaskDetails(Map<String, dynamic> taskInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("tasks")
        .doc(id)
        .set(taskInfoMap);
  }
  //Read
  Future<Stream<QuerySnapshot<Object?>>>getTaskDetails()async{
     return await FirebaseFirestore.instance.collection("tasks").snapshots();
  }
  //Update
  Future updateTaskDetails(String id,Map<String,dynamic>updateInfo)async{
    return await FirebaseFirestore.instance.collection("tasks").doc(id).update(updateInfo);
  }
  //Delete
   Future deleteTaskDetails(String id)async{
    return await FirebaseFirestore.instance.collection("tasks").doc(id).delete();
  }
}
