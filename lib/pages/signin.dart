//@dart=2.9
import 'package:cap_foundation/helpers/auth.dart';
import 'package:cap_foundation/helpers/collectionprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              height: _height,
              width: _width,
              color: Color(0xffbb86fc),
            ),
            Positioned(
              top: _height * 0.15,
              left: _width * 0.37,
              child: Text("LOGIN",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic)),
            ),
            Positioned(
                top: _height * 0.25,
                left: _width * 0.09,
                child: Column(
                  children: [
                    TextFieldContainer(
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: "Enter your email",
                            labelText: "Email",
                            icon: Icon(Icons.person),
                            border: InputBorder.none),
                      ),
                    ),
                    // SizedBox(height: _height * 0.02),
                    TextFieldContainer(
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            hintText: "Enter your password",
                            icon: Icon(Icons.lock),
                            labelText: "Password",
                            border: InputBorder.none),
                        obscureText: true,
                      ),
                    ),
                    SizedBox(height: _height * 0.03),
                    GestureDetector(
                      onTap: () {
                        context.read<AuthenticationService>().signIn(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim());
                      },
                      child: Container(
                        height: _height * 0.06,
                        width: _width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.purple[800],
                        ),
                        child: Center(
                            child: Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                      ),
                    )
                  ],
                )),
            Positioned(
                bottom: _height * 0.1,
                child: Container(
                    height: _height * 0.3,
                    width: _width * 0.95,
                    child: Image(image: AssetImage('assets/dog.png')))),
            Positioned(
                top: _height * 0.9,
                left: _width * 0.16,
                child: Text('CAP FOUNDATION',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 30.0)))
          ],
        )
        //     body: SafeArea(
        //   child: Column(
        //     children: [
        //       TextField(
        //         controller: emailController,
        //         decoration: InputDecoration(labelText: "Email"),
        //       ),
        //       TextField(
        //         controller: passwordController,
        //         decoration: InputDecoration(labelText: "Password"),
        //       ),
        //       ElevatedButton(
        //           onPressed: () {
        //             context.read<AuthenticationService>().signIn(
        //                 email: emailController.text.trim(),
        //                 password: passwordController.text.trim());
        //           },
        //           child: Text("Sign In"))
        //     ],
        //   ),
        // )
        );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: Color(0xffdda0dd), borderRadius: BorderRadius.circular(29)),
      child: child,
    );
  }
}
