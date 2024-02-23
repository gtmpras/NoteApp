

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