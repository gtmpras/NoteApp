

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:note_app/views/forgotPassword_screen.dart';
import 'package:note_app/views/homeScreen.dart';
import 'package:note_app/views/signUp_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController loginEmailCOntroller = TextEditingController();
  TextEditingController loginPasswordCOntroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width *1;
  final height = MediaQuery.sizeOf(context).height *1;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Login Screen'),
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
                height: height*0.3,
                width: width*1,
                child: Lottie.asset("assets/animation.json"),
              ),
               SizedBox(height: height*0.05,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  controller: loginEmailCOntroller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Email',
                    enabledBorder: OutlineInputBorder(),
                    
                  ),
                ),
              ),
              SizedBox(height: height*0.01,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  controller: loginPasswordCOntroller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.visibility),
                    hintText: 'Password',
                    enabledBorder: OutlineInputBorder(),
                    
                  ),
                ),
              ),
              SizedBox(height: height*0.01,),
              ElevatedButton(
                onPressed: ()async{
                  var loginEmail = loginEmailCOntroller.text.trim();
                  var loginPassword = loginPasswordCOntroller.text.trim();

                try{
                  final User? firebaseUser = (await FirebaseAuth.instance.
                  signInWithEmailAndPassword(
                    email: loginEmail, password: loginPassword)).user;
                    if(firebaseUser != null){
                      Get.to(()=>HomeScreen());
                    }else{
                      print("Check Email and Password");
                    }
              }on FirebaseAuthException catch(e){
                  print("Error $e");
                }
              }, child: Text("Login")),
              SizedBox(height: height*0.001,),
              GestureDetector(
                onTap: (){
                  Get.to(()=>ForgotPasswordScreen());
                },
                child: Container(
                  child: Card(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Forgot Password'),
                  ))),
              ),
              SizedBox(height: height*0.001,),
              GestureDetector(
                onTap:(){
                  Get.to(()=>SignUpScreen());
                } ,
                child: Container(
                  child: Card(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Don't have an account SignUp "),
                  ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}