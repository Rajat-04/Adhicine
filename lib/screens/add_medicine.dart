// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:adhicene/screens/type_widget.dart';
import 'package:adhicene/widgets/colours_widget.dart';
import 'package:adhicene/widgets/compartment_widget.dart';
import 'package:flutter/material.dart';

class AddMedicine extends StatefulWidget {
  const AddMedicine({super.key});

  @override
  State<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  double _value = 0;

  String? value = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFAFAFAFA),
          elevation: 0,
          title: Text(
            "Add Medicines",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          )),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 0, 10),
              child: Row(
                children: [
                  Text(
                    "Compartment",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  )
                ],
              ),
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 60,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return CompartmentWidget(index: index);
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            //COLORS

            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 0, 10),
              child: Row(
                children: [
                  Text(
                    "Colour",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  )
                ],
              ),
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 60,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 7,
                            itemBuilder: (BuildContext context, int index) {
                              return ColorsWidget(
                                index: index,
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // TYPE

            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 0, 10),
              child: Row(
                children: [
                  Text(
                    "Type",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  )
                ],
              ),
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int index) {
                              return TypeWidget(index: index);
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Quantity

            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 0, 10),
              child: Row(
                children: [
                  Text(
                    "Quantity",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  )
                ],
              ),
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 24,
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey, width: 1)),
                  child: Center(
                      child: Text(
                    "Take 1/2 Pill",
                    style: TextStyle(fontSize: 18),
                  )),
                ),
                SizedBox(
                  width: 7.5,
                ),
                Expanded(
                    child: Row(
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.blue, width: 1)),
                        height: 50,
                        child: Center(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.remove,
                                color: Colors.blue,
                              )),
                        )),
                    SizedBox(
                      width: 7.5,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.blue, width: 1),
                        ),
                        height: 50,
                        child: Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ))
                  ],
                ))
              ],
            ),

            //Total Count
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 0, 10),
                  child: Row(
                    children: [
                      Text(
                        "Total Count",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
                Container()
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Slider(
                min: 0,
                max: 100,
                divisions: 100,
                value: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
            ),

            // Set Date
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 0, 10),
                  child: Row(
                    children: [
                      Text(
                        "Frequency of Days",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
              ],
            ),

            // How many times a Day
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 0, 10),
                  child: Row(
                    children: [
                      Text(
                        "How many times a Day",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
              ],
            ),
            // Container(
            //     child: DropdownButton<String>(
            //   items: items.map(buildMenuItem).toList(),
            //   onChanged: (value) => this.value = value,
            // ))
          ],
        ),
      )),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
          child: Text(
        item,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ));
}
