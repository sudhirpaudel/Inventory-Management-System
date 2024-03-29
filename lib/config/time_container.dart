import 'package:flutter/material.dart';
import 'package:inventorymanagementsystem/config/colors.dart';

class TimeContainer extends StatefulWidget {
  const TimeContainer({Key? key}) : super(key: key);

  @override
  State<TimeContainer> createState() => _TimeContainerState();
}

class _TimeContainerState extends State<TimeContainer> {
  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: Stream.periodic(const Duration(seconds: 1)),
        builder: (BuildContext context, AsyncSnapshot<Object?> snapshot) =>
            Container(
          margin: const EdgeInsets.all(10),
          height: 130,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 5,
              ),
              showDate(),
              showWeekday(),
              showTime(),
            ],
          ),
        ),
      );
}

showDate() {
  var date = DateTime.now();
  List months = [
    "JAN",
    "FEB",
    "MAR",
    "APR",
    "MAY",
    "JUNE",
    'JULY',
    'AUG',
    'SEPT',
    'OCT',
    'NOV',
    'DEC'
  ];
  return Text(
    "${months[date.month - 1]} ${date.day}, ${date.year}",
    style: const TextStyle(fontSize: 16, color: primaryColor),
  );
}

showTime() {
  var date = DateTime.now();
  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        date.hour < 10
            ? date.minute < 10
                ? "0${date.hour}:0${date.minute}"
                : "${date.hour}:${date.minute}"
            : date.minute < 10
                ? "${date.hour}:0${date.minute}"
                : "${date.hour}:${date.minute}",
        style: const TextStyle(fontSize: 44, color: primaryColor),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Text(
          date.second < 10 ? "0${date.second}" : "${date.second}",
          style: const TextStyle(fontSize: 14, color: primaryColor),
        ),
      ),
    ],
  );
}

showWeekday() {
  List day = [
    "MONDAY",
    "TUESDAY",
    "WEDNESDAY",
    "THURSDAY",
    "FRIDAY",
    "SATURDAY",
    "SUNDAY",
  ];
  return Text(
    "${day[DateTime.now().weekday - 1]}",
    style: const TextStyle(fontSize: 18, color: primaryColor),
  );
}
