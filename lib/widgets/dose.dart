import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoseTime extends StatelessWidget {
  int index;
  DoseTime({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    TimeOfDay timeOfDay = TimeOfDay.now();

    Future displayTimePicker(BuildContext context) async {
      var time = await showTimePicker(context: context, initialTime: timeOfDay);

      if (time != null) {
        Navigator.pop(context, "${time.hour}:${time.minute}");
      }
    }

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.access_time,
                  size: 28,
                  color: Colors.grey[500],
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Dose $index",
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios,
                      size: 18, color: Colors.grey[500]),
                  onPressed: () => displayTimePicker(context),
                ),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            new Divider(
              color: Colors.black,
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
