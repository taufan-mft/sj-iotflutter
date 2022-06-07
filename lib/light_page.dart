import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class LightPage extends StatefulWidget {
  const LightPage({Key? key}) : super(key: key);

  @override
  State<LightPage> createState() => _LightPageState();
}

class _LightPageState extends State<LightPage> {
  final databaseRef = FirebaseDatabase.instance.reference().child("Lampu");
  String ldrValue = '0';
  String ultraValue = '0';

  _doSync() {
    databaseRef.onValue.listen((event) {
      var theArray = [];
      for (var v in event.snapshot.value.keys) {
        theArray.add(v);
      }
      print('the data');
      print(event.snapshot.value[theArray[theArray.length - 2]]);
      setState(() {
        if (event.snapshot.value[theArray[theArray.length - 2]]['LDR']
                .toString() !=
            'null') {
          ldrValue = event.snapshot.value[theArray[theArray.length - 2]]['LDR']
              .toString();
          ultraValue = event
              .snapshot.value[theArray[theArray.length - 2]]['Ultrasonik']
              .toString();
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _doSync();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.greenAccent[100],
          ),
          margin: EdgeInsets.only(top: 0),
          child: Center(
            child: Image(
              image: AssetImage('assets/light.png'),
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
              children: <Widget>[
                const Text(
                  "Light",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const Text(
                  "Cahaya berada dalam genggaman",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                const Text(
                  "Nilai sensor LDR",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        child: Material(
                          color: Colors.orange[100],
                          borderRadius: BorderRadius.circular(24.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  height: 100,
                                  child: Center(
                                    child: Text(
                                      ldrValue.toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  "Nilai sensor Ultrasonik",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        child: Material(
                          color: Colors.orange[100],
                          borderRadius: BorderRadius.circular(24.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  height: 100,
                                  child: Center(
                                    child: Text(
                                      ultraValue.toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
}
