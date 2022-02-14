// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';

import 'firebase_options.dart';

import './private_home.dart';
import './public_home.dart';
import './user_settings.dart';
import './me_page.dart';

class ProjSearch extends StatefulWidget {
  const ProjSearch({Key? key}) : super(key: key);

  @override
  _ProjSearchState createState() => _ProjSearchState();
}

Map<int, Color> color = {
  50: Color.fromRGBO(179, 180, 61, .1),
  100: Color.fromRGBO(179, 180, 61, .2),
  200: Color.fromRGBO(179, 180, 61, .3),
  300: Color.fromRGBO(179, 180, 61, .4),
  400: Color.fromRGBO(179, 180, 61, .5),
  500: Color.fromRGBO(179, 180, 61, .6),
  600: Color.fromRGBO(179, 180, 61, .7),
  700: Color.fromRGBO(179, 180, 61, .8),
  800: Color.fromRGBO(179, 180, 61, .9),
  900: Color.fromRGBO(179, 180, 61, 1),
};

MaterialColor navColor = MaterialColor(0xFFB3B43D, color);

// Note: There are some hardocded values where in the future currentUser values will be
// right now our testing database it not fully populated and created
// but proof of connection to database and abiliy to use Authentication are in
// using the current user's email as their display name

bool favorite = false;

class _ProjSearchState extends State<ProjSearch> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  // CollectionReference users = FirebaseFirestore.instance.collection('users');
  // DocumentReference docRef =
  //     FirebaseFirestore.instance.collection('users').document();

  @override
  Widget build(BuildContext context) {
    User? currentUser = auth.currentUser;

    // if (currentUser != null) {
    //   final querySnapshot = await FirebaseFirestore.instance
    //       .collection('users')
    //       .where('email', isEqualTo: currentUser.email)
    //       .get();
    //   for (var doc in querySnapshot.docs) {

    //   }

    // }

    final ButtonStyle style =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Roboto',
          primarySwatch: navColor,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text("Hazel", style: TextStyle(color: Colors.white)),
              actions: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: TextButton(
                    style: style,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MePage()),
                      );
                    }, //SHOULD TAKE THEM TO ME PAGE WHEN IMPLEMENTED
                    child: const Text("Me",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                        )),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: TextButton(
                    style: style,
                    onPressed:
                        () {}, //SHOULD TAKE THEM TO COMMUNITY PAGE WHEN IMPLEMENTED
                    child: const Text("Community",
                        style: TextStyle(
                          color: Color(0xFF7C813F),
                        )),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: TextButton(
                    style: style,
                    onPressed:
                        () {}, //SHOULD TAKE THEM TO videos PAGE WHEN IMPLEMENTED
                    child: const Text("Videos",
                        style: TextStyle(
                          color: Color(0xFF7C813F),
                        )),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: TextButton(
                    style: style,
                    onPressed:
                        () {}, //SHOULD TAKE THEM TO COMMUNITY PAGE WHEN IMPLEMENTED
                    child: const Text("Impact",
                        style: TextStyle(
                          color: Color(0xFF7C813F),
                        )),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: TextButton(
                    style: style,
                    onPressed:
                        () {}, //SHOULD TAKE THEM TO projects PAGE WHEN IMPLEMENTED
                    child: const Text("Projects",
                        style: TextStyle(
                          color: Color(0xFF7C813F),
                        )),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: TextButton(
                    style: style,
                    onPressed:
                        () {}, //SHOULD TAKE THEM TO COMMUNITY PAGE WHEN IMPLEMENTED
                    child: const Text("Cart",
                        style: TextStyle(
                          color: Color(0xFF7C813F),
                        )),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: TextButton(
                    style: style,
                    onPressed: () {
                      auth.signOut();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PublicHomePage()),
                      );
                    },
                    child: const Text("Log Out",
                        style: TextStyle(
                          color: Color(0xFF7C813F),
                        )),
                  ),
                ),
              ],
            ),
            body: Center(
                //////where dis end
                child: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(
                      color: Colors.lime[50], //page background color
                    ),
                    child: ListView(
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                            height: 350.0,
                            width: 400.0,
                            color: Colors.transparent,
                            child: Container(
                                margin:
                                    EdgeInsets.only(left: 100.0, right: 100.0),
                                decoration: BoxDecoration(
                                    color: Colors.teal[900], //box 2 color
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Center(
                                    child: ListView(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 15.0, left: 15.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Project",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontFamily: 'Roboto')),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 85.0),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 15.0, bottom: 15.0),
                                          child: IconButton(
                                            onPressed: () async {
                                              setState(() {
                                                favorite = !favorite;
                                              });

                                              if (currentUser != null) {
                                                var users = FirebaseFirestore
                                                    .instance
                                                    .collection('users');
                                                DocumentSnapshot<
                                                        Map<String, dynamic>>
                                                    doc =
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection('users')
                                                        .doc(currentUser.uid)
                                                        .get();

                                                if (doc.exists) {
                                                  if (doc.data()!.containsKey(
                                                      'favoriteProjs')) {
                                                    //favoriteProjs exists add proj
                                                    List favProjs =
                                                        doc['favoriteProjs'];
                                                    if (favProjs.contains(1) ==
                                                        true) {
                                                      users
                                                          .doc(currentUser.uid)
                                                          .update({
                                                        'favoriteProjs':
                                                            FieldValue
                                                                .arrayRemove(
                                                                    [1])
                                                      });
                                                    } else {
                                                      users
                                                          .doc(currentUser.uid)
                                                          .update({
                                                        'favoriteProjs':
                                                            FieldValue
                                                                .arrayUnion([1])
                                                      });
                                                    }
                                                  } else {
                                                    //create favoriteProjs field if it doesn't exist
                                                    users
                                                        .doc(currentUser.uid)
                                                        .set({
                                                      'favoriteProjs': [1]
                                                    }, SetOptions(merge: true));
                                                  }
                                                }
                                              }
                                            },
                                            icon: Icon(
                                              (favorite == false)
                                                  ? Icons
                                                      .favorite_border_rounded
                                                  : Icons.favorite_rounded,
                                            ),
                                            iconSize: 30,
                                            color: Colors.white,
                                            splashColor: Colors.grey,
                                          ),
                                        )),
                                  ],
                                )))),
                      ],
                    )))));
  }
}
