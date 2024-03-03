import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/views/createNoteScreen.dart';
import 'package:note_app/views/editNoteScreen.dart';
import 'package:note_app/views/signIn_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? userId = FirebaseAuth.instance.currentUser;
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
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
          .collection("notes")
          .where("userid", isEqualTo:userId?.uid)
          .snapshots(),
          builder: ((context,AsyncSnapshot<QuerySnapshot> snapshot) {
            
            if(snapshot.hasError){
              return Text('Something went wrong!');
            }
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CupertinoActivityIndicator());
            }
            if(snapshot.data!.docs.isEmpty){
              return Center(child: Text("No data found"));
            }
            if(snapshot !=null && snapshot.data != null){
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context,index){
                  var note = snapshot.data!.docs[index]['note'];
                  var userid = snapshot.data!.docs[index]['userid'];
                  var docId = snapshot.data!.docs[index].id;
                  return Card(child: ListTile(
                    title: Text(note),
                    subtitle: Text(userid),
                    trailing: Row(
                      mainAxisSize:MainAxisSize.min ,
                      children: [
                        GestureDetector(
                          onTap:(){
                            //print(docId);
                            Get.to(()=>EditNoteScreen(),
                            arguments: {
                              'note': note,
                              'docId' : docId
                            });
                          },
                          child: Icon(Icons.edit)),
                        SizedBox(width:20),
                        Icon(Icons.delete)
                      ],
                    ),
                  ),);
              });
              
            }
            return Container();
          })),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.to(()=> CreateNoteScreen());
      },child: Icon(Icons.add),),
    );
  }
}
