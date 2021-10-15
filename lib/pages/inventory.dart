//@dart=2.9
import 'package:cap_foundation/helpers/auth.dart';
import 'package:cap_foundation/helpers/collectionprovider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'inv_details.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({Key key}) : super(key: key);

  @override
  _InventoryPageState createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  @override
  Widget build(BuildContext context) {
    var onTap = Provider.of<CategoryProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffbb86fc),
        title: Text("Inventory"),
        actions: [
          IconButton(
              onPressed: () {
                context.read<AuthenticationService>().signOut();
                Navigator.pop(context);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection("inventory").snapshots(),
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
                itemBuilder: (context, i) {
                  String id = snapshot.data.docs[i].id;
                  String name = snapshot.data.docs[i]['name'];
                  return Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          onTap.uidSetter(id);
                          onTap.nameSetter(name);
                          print(id);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InventoryDetails()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                              height: 100,
                              width: double.infinity - 50,
                              decoration: BoxDecoration(
                                  color: Colors.purple[100],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(snapshot.data.docs[i]['name'],
                                    style: TextStyle(fontSize: 20)),
                              )),
                        ),
                      ),
                    ],
                  );
                });
          }),
    );
  }
}
