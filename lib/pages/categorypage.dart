//@dart=2.9
import 'package:cap_foundation/helpers/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cat-1.dart';
import 'cat-2.dart';
import 'cat-3.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.read<AuthenticationService>().signOut();
                Navigator.pop(context);
              },
              icon: Icon(Icons.logout))
        ],
        centerTitle: true,
        title: Text('Categories'),
        elevation: 0.7,
        backgroundColor: Color(0xffbb86fc),
        bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(text: "Category 1"),
              Tab(text: "Category 2"),
              Tab(text: "Category 3"),
            ]),
      ),
      body: TabBarView(controller: _tabController, children: <Widget>[
        Category1Page(),
        Category2Page(),
        Category3Page(),
      ]),
    );
  }
}
