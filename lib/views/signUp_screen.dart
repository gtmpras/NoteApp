

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:note_app/views/signIn_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameCOntroller = TextEditingController();
  TextEditingController userPhoneCOntroller = TextEditingController();
  TextEditingController userEmailCOntroller = TextEditingController();
  TextEditingController userPasswordCOntroller = TextEditingController();

  User? currentUser= FirebaseAuth.instance.currentUser;
  
  @override
  Widget build(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width *1;
  final height = MediaQuery.sizeOf(context).height *1;
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp Screen'),
        backgroundColor: Colors.cyan,
        centerTitle: true,
        // actions: [
        //   Icon(Icons.more_vert),
        // ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: height*0.2,
                width: width*1,
                child: Lottie.asset("assets/animation.json"),
              ),
        
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  controller: userNameCOntroller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'User Name',
                    enabledBorder: OutlineInputBorder(),
                    
                  ),
                ),
              ),
              SizedBox(height: height*0.03,),

               Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  controller: userPhoneCOntroller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    hintText: 'Phone',
                    enabledBorder: OutlineInputBorder(),
                    
                  ),
                ),
              ),
              SizedBox(height: height*0.03,),
               Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  controller: userEmailCOntroller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Email',
                    enabledBorder: OutlineInputBorder(),                   
                  ),
                ),
              ),
              SizedBox(height: height*0.03,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  controller: userPasswordCOntroller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.visibility),
                    hintText: 'Password',
                    enabledBorder: OutlineInputBorder(),
                    
                  ),
                ),
              ),
              SizedBox(height: height*0.01,),
              ElevatedButton(
                onPressed: (){
                  //store username in controller and trim the remaining white space from all the space
                  var userName = userNameCOntroller.text.trim(); 
                  var userPhone = userPhoneCOntroller.text.trim();
                  var userEmail = userEmailCOntroller.text.trim();  
                  var userPassword = userPasswordCOntroller.text.trim();

                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: userEmail, password: userPassword).then((value) => {
                      print("User Created"),
                      FirebaseFirestore.instance.collection("users")
                      .doc(currentUser!.uid)
                      .set({
                        'userName': userName,
                        'userPhone': userPhone,
                        'userEmail': userEmail,
                        'createdAt': DateTime.now(),  
                        'userId': currentUser!.uid,                   
                       }),
                       print('Data added successfully')
                    });   
              }, child: Text("Sign Up")),
              SizedBox(height: height*0.001,),
              SizedBox(height: height*0.001,),
              GestureDetector(
                onTap:(){
                  Get.to(SignInScreen());//login
                },
                child: Container(
                  child: Card(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Already have an account SignUp "),
                  ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}