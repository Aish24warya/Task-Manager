import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';
import 'package:taskmanage/sevice/database.dart';

class Tasksection extends StatefulWidget {
  const Tasksection({super.key});

  @override
  State<Tasksection> createState() => _TasksectionState();
}

class _TasksectionState extends State<Tasksection> {
  TextEditingController tasknamecontroller = new TextEditingController();
  TextEditingController taskdescriptioncontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xffB6FFA1),
            Color(0xffFEFFA7),
            Color(0xff00FF9C),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("New",
                style: TextStyle(color: Color(0xffFCCD2A) ,
                fontSize: 24,fontWeight: FontWeight.bold,),
                ),
                SizedBox(width: 10),
                Text("Task",
                style: TextStyle(color: Color(0xff347928) ,
                fontSize: 24,fontWeight: FontWeight.bold),
                )
              ],),
        ),
       body: Container(
        margin: EdgeInsets.only(left: 20.0,top:30.0,right:20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10.0),
              child: Text("Task Name",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,fontWeight: FontWeight.bold
              ),),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left:10.0,right: 10.0 ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: 
                  BorderRadius.only(topLeft:Radius.circular(20.0) ,
                  bottomRight:Radius.circular(20.0))
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: TextField(
                    controller: tasknamecontroller,
                    decoration: InputDecoration(
                      border: InputBorder.none  
                    ),
                  ),
                )
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10.0),
              child: Text("Task Description",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,fontWeight: FontWeight.bold
              ),),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left:10.0,right: 10.0 ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: 
                  BorderRadius.only(topLeft:Radius.circular(20.0) ,
                  bottomRight:Radius.circular(20.0))
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: TextField(
                    controller: taskdescriptioncontroller,
                    decoration: InputDecoration(
                      border: InputBorder.none  
                    ),
                  ),
                )
              ),
            ),
            SizedBox(height: 30.0),
             Center(
                      child: ElevatedButton(
                        onPressed: ()async{
                          String id = randomAlphaNumeric(10);
                          Map<String,dynamic>taskinfoMap={
                            "Task name":tasknamecontroller.text,
                            "Task Description":taskdescriptioncontroller.text,
                            "id":id
                          };
                          await DatabaseMethod().addTaskDetails(taskinfoMap, id).then((value){
                            Fluttertoast.showToast(
                            msg: "Task Details has been added successfully",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            textColor: Colors.white,
                            fontSize: 16.0
    );
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text("Add"),
                      ),
                    ),
          ],

        ),
       ),
      ),
    );
  }
}