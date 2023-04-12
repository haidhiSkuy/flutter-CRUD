// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers
import 'editPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Container makeReadData(dynamic name, dynamic age, dynamic study, dynamic context, dynamic docId) {


  return Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.only(left: 10),
    width: 350,
    height: 80,
    decoration: BoxDecoration(border: Border.all(width: 2)),
    child: Row(
      children: [
        Container(
          width: 250,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text("Name   :  ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(name)
                  ],
                ),
                Row(
                  children: [
                    Text("Age       :  ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(age)
                  ],
                ),
                Row(
                  children: [
                    Text("Study    :  ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(study)
                  ],
                )
              ]),
        ),

        //LOGO
        Container(
            child: Row(
          children: [
            IconButton(
                icon: Icon(Icons.edit, size: 35),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return EditPage(name, age, study, docId);
                  }));
                  
                }),
            SizedBox(width: 10),
            IconButton(
                icon: Icon(Icons.delete, size: 35),
                onPressed: () {
                  return;
                })
          ],
        ))
      ],
    ),
  );
}
