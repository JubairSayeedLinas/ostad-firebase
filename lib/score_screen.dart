import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ScoreScreen extends StatefulWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ArgVsAfrica'),
      ),

      body: StreamBuilder(
        stream: firebaseFirestore.collection('matches').doc('match-list').snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot<Object?>> snapshot) {
          print(snapshot.data?.data());


          final score = snapshot.data!;
          return Card(
            elevation: 20,
            shadowColor: Colors.black,
            child: SizedBox(
              height: 200,
              width: 380,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(score.get('team_a') +' vs '+ score.get('team_b'),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(score.get('team_a_score').toString() +' vs '+ score.get('team_b_score').toString(),
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text('Time : '+ score.get('time'),
                        style: Theme.of(context).textTheme.headlineSmall
                    ),
                    Text(' Total Time: '+ score.get('total_time'),
                        style: Theme.of(context).textTheme.headlineSmall
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
