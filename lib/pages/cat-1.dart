// @dart=2.9
// import 'package:cap_foundation/models/item_model.dart';
// import 'package:cap_foundation/models/item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Category1Page extends StatefulWidget {
  const Category1Page({Key key}) : super(key: key);

  @override
  _Category1PageState createState() => _Category1PageState();
}

class _Category1PageState extends State<Category1Page> {
  // Future<QuerySnapshot> getData() async {
  //   await Firebase.initializeApp();
  //   return await FirebaseFirestore.instance.collection("category1").get();
  // }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("category1").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text("Loading..."));
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Something went wrong"),
            );
          }

          if (snapshot.data.docs.length == 0) {
            return Center(
              child: Text('No Records Found'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, i) => Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.account_circle),
                  ),
                  title: Text(snapshot.data.docs[i]['animalName']),
                  subtitle: Text(snapshot.data.docs[i]['animalDesc']),
                ),
                Divider(height: 30.0),
              ],
            ),
          );
        });
  }
}
