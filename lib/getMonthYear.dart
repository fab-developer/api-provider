import 'package:flutter/material.dart';



Card getYear(int previousYear,int i)
{
    return Card(
      color: Colors.white,
      child: Center(
        child: Text(
          '${previousYear + i}',
          style: TextStyle(color: Colors.indigo),
        ),
      ),
    );

  }

final List<String> months = [
  'Jan',
  'Feb',
  'March',
  'April',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];

Card getMonths(int j)
{
  return Card(
    color: Colors.indigo,
    child: Center(
      child: Text(
        months[j],
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
