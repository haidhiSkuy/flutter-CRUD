// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


Drawer makeDrawer(dynamic context) { 
       return Drawer(
        child: Column(
          children: [
            //TITLE
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.red,
              height: 100,
              width: double.infinity,
              alignment: Alignment.bottomLeft,
              child: Text(
                "Menu",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),

            //MENU LIST
           ListTile(
              leading: Icon(Icons.create, size:30),
              title: Text("Create", style: TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/createpage');
              },
            ), 
            ListTile(
              leading: Icon(Icons.settings, size:30),
              title: Text("READ & EDIT", style: TextStyle(fontSize: 20)),
               onTap: () {
                Navigator.of(context).pushReplacementNamed('/editpage');
              },
            )
          ],
        ),
      );

}