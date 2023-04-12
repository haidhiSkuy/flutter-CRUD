// ignore_for_file: file_names, unnecessary_import, implementation_imports, unused_import, no_logic_in_create_state, prefer_const_constructors, unused_local_variable, depend_on_referenced_packages, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'createPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditPage extends StatefulWidget {
  String name; 
  String age; 
  String study;
  dynamic docId;

  EditPage(this.name, this.age, this.study, this.docId);

  @override
  State<EditPage> createState() => _EditPageState(name, age, study, docId);
}


class _EditPageState extends State<EditPage> {
  String name; 
  String age; 
  String study;
  dynamic docId;
  _EditPageState(this.name, this.age, this.study, this.docId);

  List<TextEditingController> editController = List.generate(3, (i) => TextEditingController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('EDIT')),
      body: Column(children: [
              //name
              SizedBox(height: 10),
              TextField(
                controller: editController[0],
                decoration: InputDecoration(
                    hintText: name,
                    icon: Icon(Icons.person),
                    labelText: "Name:",
                    border: OutlineInputBorder()),
              ),

              //Age
              SizedBox(height: 10),
              TextField(
                controller: editController[1],
                decoration: InputDecoration(
                  hintText: age,
                    icon: Icon(Icons.cake_rounded),
                    labelText: "Age:",
                    border: OutlineInputBorder()),
              ),

              //study
              SizedBox(height: 10),
              TextField(
                controller: editController[2],
                decoration: InputDecoration(
                    hintText: study,
                    icon: Icon(Icons.menu_book),
                    labelText: "Study:",
                    border: OutlineInputBorder()),
              ),

              //create button
              SizedBox(height: 10),
              ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber)),
                  onPressed: () {
                    final name = editController[0].text;
                    final age = editController[1].text;
                    final study = editController[2].text;
                    
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(docId).update({'name': name, 'age':age, 'study':study});
                      
                   Navigator.of(context).pop();

                  },
                  child: Text("Edit")),
            ]),
    );
  }
}
