import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taskmanage/login.dart';

class signupscreen extends StatefulWidget {
  const signupscreen({super.key});

  @override
  State<signupscreen> createState() => _signupscreenState();
}

class _signupscreenState extends State<signupscreen> {
   String firstname = "",
      lastname = "",
      dateofbirth = "",
      gender = "",
      email = "",
      contact = "",
      password = "";
  bool showPass = true;
  bool validateUser = true;
  final authInstance = FirebaseAuth.instance;
  final storeInstance = FirebaseFirestore.instance;


  @override
  Widget build(BuildContext context) {
    return  Container(
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
        body:Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                    ),
                    child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Registration Form",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Text(
                          "Please fill out the form carefully for registration",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      if (!validateUser)
                        Center(
                          child: Text(
                            "Please check all the fields",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                         SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: TextField(
                                onChanged: (value) => setState(() {
                                  firstname = value;
                                }),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  labelText: "First Name",
                                  prefixIcon: Icon(Icons.person, color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: TextField(
                                onChanged: (value) => setState(() {
                                  lastname = value;
                                }),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  labelText: "Last Name",
                                  prefixIcon: Icon(Icons.person, color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                       SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: TextField(
                                onChanged: (value) => setState(() {
                                  dateofbirth = value;
                                }),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  labelText: "Date Of Birth",
                                  hintText: "DD/MM/YYYY",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                           const SizedBox(width: 20),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right:10 ),
                              child: TextField(
                                onChanged: (value) => setState(() {
                                  gender = value;
                                }),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  labelText: "Gender",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                         ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: TextField(
                          onChanged: (value) => setState(() {
                            contact = value;
                          }),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            labelText: "Contact Number",
                            prefixIcon: Icon(Icons.call, color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: TextField(
                          onChanged: (value) => setState(() {
                            password = value;
                          }),
                          obscureText: showPass,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            labelText: "Password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                showPass ? Icons.visibility : Icons.visibility_off,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  showPass = !showPass;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(right: 10,left: 10),
                        child: TextField(
                          onChanged: (value) => setState(() {
                            email = value;
                          }),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            labelText: "Email",
                            prefixIcon: Icon(Icons.email, color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              validateUser = email.isNotEmpty &&
                                  password.isNotEmpty &&
                                  contact.isNotEmpty &&
                                  firstname.isNotEmpty &&
                                  lastname.isNotEmpty &&
                                  dateofbirth.isNotEmpty &&
                                  gender.isNotEmpty;
                            });
                      
                            if (validateUser) {
                              try {
                                await authInstance.createUserWithEmailAndPassword(
                                  email: email,
                                  password: password,
                                );
                      
                                if (authInstance.currentUser != null) {
                                  await storeInstance
                                      .collection("Users")
                                      .doc(authInstance.currentUser!.uid)
                                      .set({
                                    "Firstname": firstname,
                                    "Lastname": lastname,
                                    "DOB": dateofbirth,
                                    "Gender": gender,
                                    "Contact": contact,
                                    "email": email,
                                  });
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const LoginPage()),
                                  );
                                }
                              } catch (error) {
                                Fluttertoast.showToast(msg: error.toString());
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff36C2CE),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
