//@dart=2.9
import 'package:cap_foundation/helpers/auth.dart';
import 'package:cap_foundation/pages/categorypage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'inventory.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffbb86fc),
      body: Stack(
        children: [
          Container(
            color: Color(0xffbb86fc),
            height: size.height,
            width: size.width,
          ),
          Positioned(
            top: size.height * 0.2,
            left: size.width * 0.23,
            child: Container(
              height: size.height * 0.25,
              width: size.width * 0.55,
              decoration: BoxDecoration(
                  color: Colors.purple[100],
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryPage()));
                    },
                    child: Container(
                      height: size.height * 0.2,
                      width: size.width * 0.4,
                      child: Image(
                        image: AssetImage('assets/dog1.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.001,
                  ),
                  Text(
                    'CATEGORIES',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              top: size.height * 0.55,
              left: size.width * 0.23,
              child: Container(
                height: size.height * 0.25,
                width: size.width * 0.55,
                decoration: BoxDecoration(
                    color: Colors.purple[100],
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoryPage()));
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InventoryPage()));
                        },
                        child: Container(
                          height: size.height * 0.2,
                          width: size.width * 0.4,
                          child: Image(
                            image: AssetImage('assets/inventory.png'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.001,
                    ),
                    Text(
                      'INVENTORY',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    )
                  ],
                ),
              )),
          Positioned(
            top: size.height * 0.06,
            right: size.width * 0.07,
            child: IconButton(
                onPressed: () {
                  context.read<AuthenticationService>().signOut();
                },
                icon: Icon(Icons.logout),
                iconSize: 30,
                color: Colors.white),
          ),
          Positioned(
            top: size.height * 0.075,
            left: size.width * 0.07,
            child: Text(
              "Welcome Volunteer!",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ],
      ),
      // body: SafeArea(
      //   child: Center(
      //     child: Column(
      //       children: [
      //         ElevatedButton(
      //             child: Text('Category'),
      //             onPressed: () {
      //               Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) => CategoryPage()));
      //             }),
      //         ElevatedButton(
      //             child: Text('Inventory'),
      //             onPressed: () {
      //               Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) => InventoryPage()));
      //             }),
      //         IconButton(
      //             onPressed: () {
      //               context.read<AuthenticationService>().signOut();
      //             },
      //             icon: Icon(Icons.logout))
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
