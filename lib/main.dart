// @dart=2.9
import 'package:cap_foundation/helpers/auth.dart';
import 'package:cap_foundation/helpers/collectionprovider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'pages/homepage.dart';
import 'pages/signin.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffold = GlobalKey();
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        ),
        ListenableProvider<CategoryProvider>(create: (_) => CategoryProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CAP',
        theme: ThemeData(
            primarySwatch: Colors.purple, primaryColor: Colors.purple[100]),
        home: Check(),
      ),
    );
  }
}

class Check extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Center(
            child: Text('Something went wrong'),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return AuthenticationWrapper();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Center(
          child: Text('Loading...'),
        );
      },
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return MyHomePage();
    }
    return SignInPage();
  }
}
