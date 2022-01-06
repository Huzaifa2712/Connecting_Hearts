import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isAuth = false;

  login() {
    googleSignIn.signIn();
  }

  Widget buildAuthScreen() {
    return const Scaffold(
      body: Text('Hello'),
    );
  }

  Widget buildUnAuthScreen() {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).colorScheme.secondary
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              ' Connecting Hearts',
              style: TextStyle(
                fontFamily: 'DancingScript',
                fontSize: 100,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: login(),
              child: Container(
                width: 260,
                height: 60,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/google_signin_btn.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScreen() : buildUnAuthScreen();
  }
}
