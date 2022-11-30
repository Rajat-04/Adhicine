import 'package:flutter/material.dart';

class CompartmentWidget extends StatelessWidget {
  final int index;
  CompartmentWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(6, 0, 10, 0),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Center(
            child: Text(
          (index + 1).toString(),
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        )));
  }
}
