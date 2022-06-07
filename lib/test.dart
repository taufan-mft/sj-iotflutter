import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class RealtimeDatabaseDisplay extends StatefulWidget {
  const RealtimeDatabaseDisplay({Key? key}) : super(key: key);

  @override
  State<RealtimeDatabaseDisplay> createState() =>
      _RealtimeDatabaseDisplayState();
}

class _RealtimeDatabaseDisplayState extends State<RealtimeDatabaseDisplay> {
  final databaseRef = FirebaseDatabase.instance.reference().child("Lampu");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FirebaseAnimatedList(
        query: databaseRef,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          return Card(
            child: Column(children: [
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Text(
                        "Nilai LDR",
                        style: TextStyle(fontSize: 14),
                      )),
                  Expanded(
                      flex: 3,
                      child: Text(
                        snapshot.value['LDR'].toString(),
                        style: TextStyle(fontSize: 14),
                      ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Text(
                        "Nilai Ultrasonik",
                        style: TextStyle(fontSize: 14),
                      )),
                  Expanded(
                      flex: 3,
                      child: Text(
                        snapshot.value['Ultrasonik'].toString() + " cm",
                        style: TextStyle(fontSize: 14),
                      )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Text(
                        "Nilai PZEM",
                        style: TextStyle(fontSize: 14),
                      )),
                  Expanded(
                      flex: 3,
                      child: Text(
                        snapshot.value['PZEM'].toString(),
                        style: TextStyle(fontSize: 14),
                      )),
                ],
              ),
            ]),
          );
        },
      )),
    );
  }
}
