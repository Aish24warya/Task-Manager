import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';
import 'package:taskmanage/login.dart';
import 'package:taskmanage/sevice/database.dart';
import 'package:taskmanage/tasksection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   TextEditingController tasknamecontroller = new TextEditingController();
  TextEditingController taskdescriptioncontroller = new TextEditingController();
  Stream<QuerySnapshot> ? tasksStream;
   
  getontheload()async{
    tasksStream= await DatabaseMethod().getTaskDetails();
    setState(() {});
  }
  void signUserout(Future pushAndRemoveUntil){
    FirebaseAuth.instance.signOut();
  }
  @override
  void initState(){
    getontheload();
    super.initState();
  }
  Widget allTaskDetails(){
     return StreamBuilder(
      stream: tasksStream,
       builder: (context,AsyncSnapshot snapshot){
      return snapshot.hasData?
      ListView.builder(
        itemCount: snapshot.data.docs.length,
        itemBuilder:(context,index){
          DocumentSnapshot ds =snapshot.data.docs[index];
          return Container(
            margin: EdgeInsets.only(bottom: 20.0),
            child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.only(left: 20,right: 20),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0,top: 10.0,bottom: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Task name:",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold
                              ),),
                              SizedBox(width: 5.0),
                              Text(ds["Task name"],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold
                              ),),
                              Spacer(),
                               GestureDetector(
                                onTap: (){
                                  tasknamecontroller.text=ds["Task name"];
                                  taskdescriptioncontroller.text=ds["Task Description"];
                                  
                                  EditTaskDetail(ds["id"]);
                                },
                                child: Icon(Icons.edit,color: Colors.blue,)),
                                SizedBox(width: 5.0,),
                                GestureDetector(
                                  onTap: ()async{
                                await DatabaseMethod().deleteTaskDetails(ds["id"]);
                                  },
                                child: Icon(Icons.delete,color: Colors.blue,)),
                             

                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text("Task Description:" ,
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold
                              ),),
                              SizedBox(width: 5.0),
                              Text(ds["Task Description"],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold
                              ),),
                            ],
                          )
                      
                        ],
                      ),
                    ),
                  
                  ),
                ),
          );
        

      }):Container();
     });
  }
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
        floatingActionButton: FloatingActionButton(onPressed:(){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>Tasksection()));
        },child: Icon(Icons.add),),
        appBar: AppBar(
          actions: [
           IconButton(
            onPressed: () {
             signUserout(
              Navigator.pushAndRemoveUntil(
              context,
             MaterialPageRoute(builder: (context) => LoginPage()),
             (route) => false,
             ),
             );
            },
            icon: Icon(Icons.logout),
            )
          ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Task",
              style: TextStyle(color: Color(0xffFCCD2A) ,
              fontSize: 24,fontWeight: FontWeight.bold,),
              ),
              SizedBox(width: 10),
              Text("Manager",
              style: TextStyle(color: Color(0xff347928) ,
              fontSize: 24,fontWeight: FontWeight.bold),
              )


            ],),
        ),
        body: Container(
          margin: EdgeInsets.only(left: 20.0,right: 20.0,top: 30),
          child: Column(
            children: [
              Expanded(child:allTaskDetails()),
            ],
          ),
        ),
        
      )
    );
  }
      Future EditTaskDetail(String id)=>showDialog(
        context: context, builder: (context)=>AlertDialog(
          content: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                   GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.cancel),
                   ),
                   SizedBox(width: 60.0),
              Text("Edit",
              style: TextStyle(color: Color(0xffFCCD2A) ,
              fontSize: 24,fontWeight: FontWeight.bold,),
              ),
              SizedBox(width: 10),
              Text("Details",
              style: TextStyle(color: Color(0xff347928) ,
              fontSize: 24,fontWeight: FontWeight.bold),
              )
                  ],
                ),
                SizedBox(height: 20.0),
        Container(
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
                fontSize: 20.0,fontWeight: FontWeight.bold
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
                fontSize: 20.0,fontWeight: FontWeight.bold
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
               ],
            ),
   ),
   SizedBox(height: 20.0),
   Center(
                      child: ElevatedButton(
                        onPressed: ()async{
                          String id = randomAlphaNumeric(10);
                          Map<String,dynamic>updateInfo={
                            "Task name":tasknamecontroller.text,
                            "Task Description":taskdescriptioncontroller.text,
                            "id":id
                          };
                          await DatabaseMethod().addTaskDetails(updateInfo, id).then((value){
                            Navigator.pop(context);
                            Fluttertoast.showToast(
                            msg: "Task Details has been updated successfully",
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
                        child: Text("Update"),
                      ),
                    ),
   ]
)
          ),
        ));
}