// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

Container makeReadData(dynamic name, dynamic age, dynamic study) {
  return Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.only(left: 10),
    width: 350,
    height: 80,
    decoration: BoxDecoration(border: Border.all(width: 2)),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [Text("Name   :  ",style: TextStyle(fontWeight: FontWeight.bold)), 
                      Text(name)],
          ),
          Row(
            children: [Text("Age       :  ",style: TextStyle(fontWeight: FontWeight.bold)), 
                       Text(age)],
          ),
          Row(
            children: [Text("Study    :  ",style: TextStyle(fontWeight: FontWeight.bold)), 
                       Text(study)],
          )
        ]),
  );
}
