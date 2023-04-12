// ignore_for_file: unused_import, prefer_const_constructors, use_key_in_widget_constructors, file_names, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'makeContainer.dart';
import 'drawer.dart';



class ReadPage extends StatelessWidget {
  // List<TextEditingController> myController =
  //     List.generate(3, (i) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(title: Text("READ & EDIT")),
            body:
              //SHOW DATA ON DATABASE
              SingleChildScrollView(
                child: StreamBuilder(
                  
                  stream:
                      FirebaseFirestore.instance.collection('users').snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    var test = streamSnapshot.hasData;
                    if (test == true) {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
            
                        scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: streamSnapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                                final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                                final documentId = documentSnapshot.reference.id;

                                return makeReadData(documentSnapshot['name'], 
                                documentSnapshot['age'], 
                                documentSnapshot['study'], 
                                context, 
                                documentId);
                                
                          });
                    } else {
                      return Text("No Data");
                    }
                  },
                ),
              ),
          
            drawer: makeDrawer(context),
            
            );
  }
}