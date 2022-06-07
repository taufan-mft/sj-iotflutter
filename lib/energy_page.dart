import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class EnergyPage extends StatefulWidget {
  const EnergyPage({Key? key}) : super(key: key);

  @override
  State<EnergyPage> createState() => _EnergyPageState();
}

class _EnergyPageState extends State<EnergyPage> {
  final databaseRef = FirebaseDatabase.instance.reference().child("Lampu");
  String ldrValue = '0';
  String ultraValue = '0';
  String ampereValue = '0';
  String voltValue = '0';
  String pfValue = '0';
  String wattValue = '0';
  String kwhValue = '0';
  String frequencyValue = '0';

  _doSync() {
    databaseRef.onValue.listen((event) {
      var theArray = [];
      for (var v in event.snapshot.value.keys) {
        theArray.add(v);
      }
      print('the data');
      print(event.snapshot.value[theArray[theArray.length - 2]]);
      setState(() {
        if (event.snapshot.value[theArray[theArray.length - 2]]['PZEM']
            .toString() !=
            'null') {
          ampereValue = event.snapshot.value[theArray[theArray.length - 2]]['PZEM']['A']
              .toString();
          voltValue = event.snapshot.value[theArray[theArray.length - 2]]['PZEM']['V']
              .toString();
          pfValue = event.snapshot.value[theArray[theArray.length - 2]]['PZEM']['pf']
              .toString();
          wattValue = event.snapshot.value[theArray[theArray.length - 2]]['PZEM']['W']
              .toString();
          kwhValue = event.snapshot.value[theArray[theArray.length - 2]]['PZEM']['kwh']
              .toString();
          frequencyValue = event.snapshot.value[theArray[theArray.length - 2]]['PZEM']['frequency']
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
                  "Ampere",
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
                                      ampereValue,
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
                  "Voltage",
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
                                      voltValue,
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
                  "PF",
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
                                      pfValue,
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
                  "Watt",
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
                                      wattValue,
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
                  "KWH",
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
                                      kwhValue,
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
                  "Frequency",
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
                                      frequencyValue,
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
                )
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
