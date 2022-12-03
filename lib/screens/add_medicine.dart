// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:adhicene/screens/type_widget.dart';
import 'package:adhicene/widgets/colours_widget.dart';
import 'package:adhicene/widgets/compartment_widget.dart';
import 'package:adhicene/widgets/dose.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:intl/intl.dart';

class AddMedicine extends StatefulWidget {
  const AddMedicine({super.key});

  @override
  State<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  double _value = 0; // Option 2
  dynamic dropdownValue = 'Everyday';
  dynamic howmanytimeDropdown = 'Three Times';
  int? tappedIndex, colorTappedIndex, compartmentTappedIndex, typeTappedIndex;
  double? quantityPillChange;
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();

  TimeOfDay timeOfDay = TimeOfDay.now();

  Future displayTimePicker(BuildContext context) async {
    var time = await showTimePicker(context: context, initialTime: timeOfDay);

    if (time != null) {
      Navigator.pop(context, "${time.hour}:${time.minute}");
    }
  }

  List<String> TimesList = [
    'One Time',
    'Two Times',
    'Three Times',
  ];

  List<String> takeDoses = [
    "Before Breakfast",
    "After Breakfast",
    "Before Lunch",
    "After Lunch",
    "Evening",
    "Before Dinner",
    "Before Sleep"
  ];

  List<String> paths = [
    'assets/images/tablet.jpg',
    'assets/images/capsule.jpg',
    'assets/images/cream.jpg',
    'assets/images/cream.jpg',
  ];

  List<String> names = [
    'Tablet',
    'Capsule',
    'Cream',
    'Liquid',
  ];

  List<Color> colors = [
    Color.fromARGB(255, 237, 153, 188),
    Color.fromARGB(255, 94, 113, 220),
    Color.fromARGB(255, 233, 102, 102),
    Color.fromARGB(255, 173, 238, 155),
    Color.fromARGB(255, 243, 182, 108),
    Color.fromARGB(255, 204, 227, 247),
    Color.fromARGB(255, 246, 234, 130)
  ];

  @override
  void initState() {
    startDateController.text = "Today";
    endDateController.text = "End Date";
    tappedIndex = 0;
    colorTappedIndex = 0;
    compartmentTappedIndex = 0;
    typeTappedIndex = 0;
    quantityPillChange = 0.5;
    super.initState();
  }

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
                              return Container(
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        compartmentTappedIndex = index;
                                        print(index);
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        primary: compartmentTappedIndex == index
                                            ? Color.fromARGB(255, 237, 243, 255)
                                            : Color(0xFAFAFAFA)),
                                    child: CompartmentWidget(
                                      index: index,
                                    )),
                              );
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
                            return Container(
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      colorTappedIndex = index;
                                      print(index);
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      primary: colorTappedIndex == index
                                          ? Color.fromARGB(255, 237, 243, 255)
                                          : Color(0xFAFAFAFA)),
                                  child: ColorsWidget(
                                    index: index,
                                  )),
                            );
                          },
                        ),
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
                              return Container(
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        typeTappedIndex = index;
                                        print(index);
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        primary: typeTappedIndex == index
                                            ? Color.fromARGB(255, 237, 243, 255)
                                            : Color(0xFAFAFAFA)),
                                    child: TypeWidget(
                                      index: index,
                                    )),
                              );
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
                    "${"Take $quantityPillChange"} Pill",
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
                              onPressed: () {
                                setState(() {
                                  if (quantityPillChange! > 0) {
                                    quantityPillChange =
                                        (quantityPillChange! - 0.5);
                                  }
                                });
                              },
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
                            onPressed: () {
                              setState(() {
                                quantityPillChange =
                                    (quantityPillChange! + 0.5);
                              });
                            },
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
                        "Set Date",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 30,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Color.fromARGB(255, 236, 235, 232),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          child: TextField(
                            controller: startDateController,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context:
                                            context, //context of current state
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(
                                            2000), //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2101));

                                    if (pickedDate != null) {
                                      //pickedDate output format => 2021-03-10 00:00:00.000
                                      String formattedDate =
                                          DateFormat('dd-MM-yyyy')
                                              .format(pickedDate);
                                      startDateController.text = formattedDate;
                                      print(
                                          formattedDate); //formatted date output using intl package =>  2021-03-16
                                    } else {
                                      print("Date is not selected");
                                    }
                                  },
                                  icon: Icon(Icons.arrow_forward_ios)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 30,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Color.fromARGB(255, 236, 235, 232),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          child: TextField(
                            controller: endDateController,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context:
                                            context, //context of current state
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(
                                            2000), //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2101));

                                    if (pickedDate != null) {
                                      //pickedDate output format => 2021-03-10 00:00:00.000
                                      String formattedDate =
                                          DateFormat('dd-MM-yyyy')
                                              .format(pickedDate);
                                      endDateController.text = formattedDate;
                                      print(
                                          formattedDate); //formatted date output using intl package =>  2021-03-16
                                    } else {
                                      print("Date is not selected");
                                    }
                                  },
                                  icon: Icon(Icons.arrow_forward_ios)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),

            //Frequency of Days
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

            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 18, right: 18),
              child: DropdownButtonHideUnderline(
                child: GFDropdown(
                  padding: const EdgeInsets.all(15),
                  borderRadius: BorderRadius.circular(10),
                  border: const BorderSide(color: Colors.black12, width: 1),
                  dropdownButtonColor: Color.fromARGB(255, 236, 235, 232),
                  value: dropdownValue,
                  onChanged: (newValue) {
                    if (newValue != null) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    }
                  },
                  items: [
                    'Everyday',
                    'Once a Week',
                    'Two Days a Week',
                    'Three Days a Week',
                    'Four Days a Week',
                    'Five Days a Week',
                    'Six Days a Week'
                  ]
                      .map((value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                ),
              ),
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

            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 18, right: 18),
              child: DropdownButtonHideUnderline(
                child: GFDropdown(
                  padding: const EdgeInsets.all(15),
                  borderRadius: BorderRadius.circular(10),
                  border: const BorderSide(color: Colors.black12, width: 1),
                  dropdownButtonColor: Color.fromARGB(255, 236, 235, 232),
                  value: howmanytimeDropdown,
                  onChanged: (newValue) {
                    if (newValue != null) {
                      setState(() {
                        howmanytimeDropdown = newValue;
                      });
                    }
                  },
                  items: TimesList.map((value) => DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      )).toList(),
                ),
              ),
            ),

            SizedBox(
              height: 30,
            ),

            //Doses
            Column(
              children: [
                DoseTime(
                  index: 1,
                ),
                TimesList.indexOf(howmanytimeDropdown) >= 1
                    ? DoseTime(
                        index: 2,
                      )
                    : Container(),
                TimesList.indexOf(howmanytimeDropdown) > 1
                    ? DoseTime(
                        index: 3,
                      )
                    : Container(),
              ],
            ),

            //When to take
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: takeDoses.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding:
                                        EdgeInsets.only(left: 16, right: 16),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(16.0),
                                    ),
                                    primary: tappedIndex == index
                                        ? Color.fromARGB(255, 118, 186, 243)
                                        : Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      tappedIndex = index;
                                    });
                                  },
                                  child: Center(
                                    child: Text(
                                      takeDoses[index],
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 20,
            ),

            //Add Button
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: Container(
                height: 50,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(40)),
                width: MediaQuery.of(context).size.width,
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.blue[400],
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Center(
                      child: Text(
                        "Add",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
