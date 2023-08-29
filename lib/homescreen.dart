import 'dart:convert';
import 'package:firebase_assignment/score_screen.dart';
import 'package:firebase_assignment/score_screen_2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Map<String, dynamic> scoresMap = {};

  Future<void> getDataFromFirebase() async {
    CollectionReference matchDataRef = firebaseFirestore.collection('matches');
    final DocumentReference docRef = matchDataRef.doc('match-list');
    final data = await docRef.get();
    print(data.data());
    final teamName = data.get('team_a');
    print(teamName);
  }
  @override
  void initState() {
    getDataFromFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Match List'),
      ),

      body: Column(
        children: [
          ListTile(
            title: Text('Argentina vs Africa'),
            trailing: IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ScoreScreen()));
              },
              icon: Icon(Icons.arrow_forward),
            ),
          ),
          ListTile(
            title: Text('Italy vs Spain'),
            trailing: IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ScoreScreen2()));
              },
              icon: Icon(Icons.arrow_forward),
            ),
          ),
        ],
      )
    );
  }
}
