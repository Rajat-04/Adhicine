import 'package:flutter/material.dart';

class TypeWidget extends StatelessWidget {
  final int index;
  TypeWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
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

    return Container(
        margin: EdgeInsets.only(right: 16),
        width: 100,
        height: 100,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              paths[index],
              width: 70,
              height: 70,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              names[index],
              style: TextStyle(color: Colors.grey[400]),
            )
          ],
        )));
  }
}
