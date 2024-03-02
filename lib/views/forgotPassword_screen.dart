import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:note_app/views/signIn_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController forgetPasswordCOntroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Passowrd'),
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
                height: height * 0.2,
                width: width * 1,
                child: Lottie.asset("assets/animation.json"),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  controller: forgetPasswordCOntroller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Email',
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              ElevatedButton(onPressed: ()async {
                var forgotEmail = forgetPasswordCOntroller.text.trim();

                try{
                 await FirebaseAuth.instance.sendPasswordResetEmail(
                    email: forgotEmail).then((value) => {
                      print("Email sent!"),
                      Get.off(()=> SignInScreen()),
                    });
                    
                }
                on FirebaseAuthException catch(e){
                  print("error $e");
                }

              }, child: Text("Sign Up")),
              SizedBox(
                height: height * 0.001,
              ),
              SizedBox(
                height: height * 0.001,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
