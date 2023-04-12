// ignore_for_file: depend_on_referenced_packages, use_key_in_widget_constructors, prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'makeContainer.dart';
import 'dart:async';
import 'createPage.dart';
import 'readPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => HomePage();
}

class HomePage extends State<MyApp> {
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CreatePage(),
      initialRoute: "/createpage",
      routes: {
        "/createpage": (context) => CreatePage(),
        "/readpage": (context) => ReadPage()
      },
      
    );
  }
}
