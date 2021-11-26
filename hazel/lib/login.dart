// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './private_home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

Map<int, Color> color =
{
50:Color.fromRGBO(179,180,61, .1),
100:Color.fromRGBO(179,180,61, .2),
200:Color.fromRGBO(179,180,61, .3),
300:Color.fromRGBO(179,180,61, .4),
400:Color.fromRGBO(179,180,61, .5),
500:Color.fromRGBO(179,180,61, .6),
600:Color.fromRGBO(179,180,61, .7),
700:Color.fromRGBO(179,180,61, .8),
800:Color.fromRGBO(179,180,61, .9),
900:Color.fromRGBO(179,180,61, 1),
};

MaterialColor navColor = MaterialColor(0xFFB3B43D, color);

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Roboto',
          primarySwatch: navColor,
          ),
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                "Hazel",
                style: TextStyle(color: Colors.white)
                ),
              actions: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: TextButton(
                    style: style,
                    onPressed:
                        () {}, //SHOULD TAKE THEM TO COMMUNITY PAGE WHEN IMPLEMENTED
                    child: const Text(
                      "Community",
                      style: TextStyle(color: Color(0xFF7C813F),)
                      ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: TextButton(
                    style: style,
                    onPressed:
                        () {}, //SHOULD TAKE THEM TO videos PAGE WHEN IMPLEMENTED
                    child: const Text(
                      "Videos",
                      style: TextStyle(color: Color(0xFF7C813F),)
                      ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: TextButton(
                    style: style,
                    onPressed:
                        () {}, //SHOULD TAKE THEM TO projects PAGE WHEN IMPLEMENTED
                    child: const Text(
                      "Projects",
                      style: TextStyle(color: Color(0xFF7C813F),)
                      ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: TextButton(
                    style: style,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: const Text(
                      "Login/Signup",
                      style: TextStyle(color: Color(0xFF7C813F),)
                      ),
                  ),
                ),
              ],
            ),
            body: Center(
                child: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/sc-delta-web.jpg'),
                            fit: BoxFit.cover)),
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          height: 200.0,
                          width: 400.0,
                          color: Colors.transparent,
                          child: OutlinedButton(
                            child: Text('Log In',
                                style: TextStyle(color: Colors.white)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PrivateHomePage()),
                              );
                            },
                          ),
                        )
                      ],
                    )))));
  }
}
