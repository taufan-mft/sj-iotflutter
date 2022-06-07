import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final databaseRef = FirebaseDatabase.instance.reference().child("Lampu");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text(
          'History',
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.greenAccent[100],
        centerTitle: true,
      ),
      body: SafeArea(
          child: FirebaseAnimatedList(
        query: databaseRef,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          return Card(
            child: Column(children: [
              /*
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Text(
                        "Waktu",
                        style: TextStyle(fontSize: 14),
                      )),
                  Expanded(
                      flex: 3,
                      child: Text(
                        snapshot.value['Lampu'].toString(),
                        style: TextStyle(fontSize: 14),
                      ))
                ],
              ),
              */
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

  /*
    Widget header() {
      return Column(children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.greenAccent[100],
          ),
          margin: EdgeInsets.only(top: 0),
          child: Center(
            child: Image(
              image: AssetImage('assets/history.png'),
            ),
          ),
        ),
      ]);
    }

    Widget content() {
      return Container(
        constraints: BoxConstraints(minHeight: 550),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "History",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "Lihat riwayat data",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ]),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.greenAccent[100],
      body: ListView(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
  */
}
