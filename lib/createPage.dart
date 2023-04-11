// ignore_for_file: unused_import, prefer_const_constructors, use_key_in_widget_constructors, file_names, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'makeContainer.dart';
import 'drawer.dart';



class CreatePage extends StatelessWidget {
  List<TextEditingController> myController =
      List.generate(3, (i) => TextEditingController());

  //CREATE
  Future createUser(
      {required String name,
      required String age,
      required String study}) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    final json = {'name': name, 'age': age, 'study': study};

    await docUser.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(title: Text("CREATE")),
            body: Column(children: [
              //name
              SizedBox(height: 10),
              TextField(
                controller: myController[0],
                decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: "Name:",
                    border: OutlineInputBorder()),
              ),

              //Age
              SizedBox(height: 10),
              TextField(
                controller: myController[1],
                decoration: InputDecoration(
                    icon: Icon(Icons.cake_rounded),
                    labelText: "Age:",
                    border: OutlineInputBorder()),
              ),

              //study
              SizedBox(height: 10),
              TextField(
                controller: myController[2],
                decoration: InputDecoration(
                    icon: Icon(Icons.menu_book),
                    labelText: "Study:",
                    border: OutlineInputBorder()),
              ),

              //create button
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    final name = myController[0].text;
                    final age = myController[1].text;
                    final study = myController[2].text;

                    createUser(name: name, age: age, study: study);
                    myController[0].clear();
                    myController[1].clear();
                    myController[2].clear();
                  },
                  child: Text("Create")),
            ]),
            drawer: makeDrawer(context),
            
            );
  }
}