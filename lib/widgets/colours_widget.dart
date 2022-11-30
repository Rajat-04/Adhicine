import 'package:flutter/material.dart';

class ColorsWidget extends StatelessWidget {
  final int index;
  ColorsWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Color.fromARGB(255, 237, 153, 188),
      Color.fromARGB(255, 94, 113, 220),
      Color.fromARGB(255, 233, 102, 102),
      Color.fromARGB(255, 173, 238, 155),
      Color.fromARGB(255, 243, 182, 108),
      Color.fromARGB(255, 204, 227, 247),
      Color.fromARGB(255, 246, 234, 130)
    ];
    return Container(
      margin: EdgeInsets.fromLTRB(6, 0, 6, 0),
      child: CircleAvatar(
        radius: 27,
        child: CircleAvatar(
          backgroundColor: colors[index],
          radius: 26,
        ),
      ),
    );
  }
}
