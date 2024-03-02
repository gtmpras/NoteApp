import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/views/createNoteScreen.dart';
import 'package:note_app/views/signIn_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
                Get.off(() => SignInScreen());
              },
              child: Icon(Icons.logout)),
        ],
      ),
      body: Center(
        child: Container(
          child: Text("Notes"),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.to(()=> CreateNoteScreen());
      },child: Icon(Icons.add),),
    );
  }
}
