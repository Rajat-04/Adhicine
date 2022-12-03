// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';

import 'package:adhicene/screens/add_medicine.dart';
import 'package:adhicene/widgets/list_medicine_tile.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:open_settings/open_settings.dart';

import '../firebase_auth/check_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final user = FirebaseAuth.instance.currentUser!;
  int _cIndex = 0;

  StreamSubscription? internetconnection;
  bool isoffline = false;

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
        debounceDuration: Duration.zero,
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          if (connectivity == ConnectivityResult.none) {
            return Scaffold(
              backgroundColor: Colors.grey[200],
              body: SafeArea(
                child: Center(
                  child: Container(
                    width: 300,
                    height: 430,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Your Device is not \n Connected!",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 22),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Image.asset('assets/images/notConnected.png'),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Connect your device with",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 22),
                          ),
                          SizedBox(
                            height: 21,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(18)),
                                  color: Colors.blue[400],
                                ),
                                width: 149,
                                child: MaterialButton(
                                  onPressed: () {
                                    OpenSettings.openBluetoothSetting();
                                  },
                                  child: Icon(
                                    Icons.bluetooth,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                width: 149,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(18)),
                                  color: Colors.blue[400],
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    OpenSettings.openWIFISetting();
                                  },
                                  child: Icon(
                                    Icons.wifi,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return child;
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          //Body=-
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Text(
                        "Hi User!",
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return AddMedicine();
                                  }));
                                },
                                icon: Icon(
                                  Icons.medical_services_rounded,
                                  color: Colors.blue,
                                  size: 32,
                                )),
                            SizedBox(
                              width: 35,
                            ),
                            CircleAvatar(
                              child: Image.asset("assets/images/logo.png"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: Row(
                    children: [
                      Text(
                        "5 Medicines Left",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                // Sign Out

                MaterialButton(
                  onPressed: () {
                    CheckPage().signOut();
                  },
                  child: Text('Sign out'),
                ),

                // Date Scroll

                Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 16, 35, 10),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Center(
                      child: Text(
                    "Saturday, Sep 3",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Medicines List

                        SizedBox(
                          height: 40,
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(26, 10, 50, 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Morning",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "08:00 am",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        //Widget Desgin
                        ListMedicineTile(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          //BottomNavigation Bar
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            currentIndex: _cIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_filled,
                    size: 36,
                  ),
                  //title: Text('Home')
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.bar_chart_sharp,
                    size: 36,
                  ),
                  label: "Report"
                  //title: Text('Power')
                  )
            ],
            onTap: (index) {
              _incrementTab(index);
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AddMedicine();
              }));
            },
            child: Icon(
              Icons.add,
            ),
          ),
        ));
  }
}
