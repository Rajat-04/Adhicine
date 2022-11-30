// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';

import 'package:adhicene/screens/add_medicine.dart';
import 'package:adhicene/widgets/list_medicine_tile.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    internetconnection = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // whenevery connection status is changed.
      if (result == ConnectivityResult.none) {
        //there is no any connection
        setState(() {
          isoffline = true;
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
                backgroundColor: Colors.transparent,
                child: Text("data"),
              );
            },
          );
        });
      } else if (result == ConnectivityResult.mobile) {
        //connection is mobile data network
        setState(() {
          isoffline = false;
        });
      } else if (result == ConnectivityResult.wifi) {
        //connection is from wifi
        setState(() {
          isoffline = false;
        });
      }
    }); // using

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    internetconnection!.cancel();
  }

  void show() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
    );
  }
}
