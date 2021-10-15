//@dart=2.9
import 'package:cap_foundation/helpers/collectionprovider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InventoryDetails extends StatefulWidget {
  const InventoryDetails({Key key}) : super(key: key);

  @override
  _InventoryDetailsState createState() => _InventoryDetailsState();
}

class _InventoryDetailsState extends State<InventoryDetails> {
  @override
  Widget build(BuildContext context) {
    String uid = Provider.of<CategoryProvider>(context, listen: false).uid;
    String name = Provider.of<CategoryProvider>(context, listen: false).name;
    var stream = FirebaseFirestore.instance
        .collection('inventory/$uid/inventory')
        .snapshots();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffbb86fc),
          title: Text(name),
        ),
        body: StreamBuilder(
          stream: stream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                  // ListTile(
                  //   leading: CircleAvatar(
                  //     child: Icon(Icons.account_circle),
                  //   ),
                  //   title: Text(snapshot.data.docs[i]['name']),
                  //   subtitle: Text(snapshot.data.docs[i]['quantity']),
                  // ),
                  // Divider(height: 30.0),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 100,
                      width: double.infinity - 50,
                      decoration: BoxDecoration(
                          color: Colors.purple[100],
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 18.0),
                              child: Container(
                                height: 50,
                                width: 50,
                                child: Image(
                                  image: AssetImage('assets/inventory.png'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(snapshot.data.docs[i]['name'],
                                  style: TextStyle(fontSize: 20)),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(snapshot.data.docs[i]['quantity'],
                                  style: TextStyle(fontSize: 15)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
