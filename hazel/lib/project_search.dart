// ignore_for_file: prefer_const_constructors
import 'dart:async';

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
import 'login_valid.dart';

class ProjectSearch extends StatefulWidget {
  const ProjectSearch({Key? key}) : super(key: key);

  @override
  _ProjectSearchState createState() => _ProjectSearchState();
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

class _ProjectSearchState extends State<ProjectSearch> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  // final FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    User? currentUser = auth.currentUser;
    // getFavs(currentUser);
    // initialCheck = true;
    // print(favList);
    int projNum = 0;

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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProjectSearch()),
                      );
                      // getNameList();
                    }, //SHOULD TAKE THEM TO projects PAGE WHEN IMPLEMENTED
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: const Text("Login/Signup",
                        style: TextStyle(
                          color: Color(0xFF7C813F),
                        )),
                  ),
                ),
              ],
            ),
            body: Center(
              child: Container(
                  constraints: BoxConstraints.expand(),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/boatfilter.png'),
                          fit: BoxFit.cover)),
                  child: ListView(children: [
                    Align(
                        alignment: Alignment(0.0, -1.0),
                        child: Text('Projects',
                            style: TextStyle(
                                color: Color(0xFFF9F8F1),
                                fontSize: 70,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600))),
                    Container(
                        margin:
                            EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0),
                        height: 60.0,
                        width: 100.0,
                        color: Colors.transparent,
                        child: Container(
                            margin: EdgeInsets.only(bottom: 10.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  fillColor: Color(0xFFF9F8F1),
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0)),
                                  hintText: 'Search projects'),
                            ))),
                    Align(
                      alignment: Alignment(0.95, 0.0),
                      child: TextButton(
                        onPressed:
                            () {}, // should expand into search filters when pressed
                        child: const Text('Add Search Filters',
                            style: TextStyle(
                              color: Color(0xFFF9F8F1),
                              fontSize: 12,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w200,
                            )),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.all(20.0),
                        height: 215.0,
                        width: 270.0,
                        color: Colors.transparent,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFF0E346D),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0))),
                            child: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            ///HERE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

                                            child: ProjText(
                                              projNum: 1,
                                              isTitle: true,
                                            ),
                                          ),

                                          // Favorite button (still need to fill with right color & link to favorites)
                                          Ink(
                                            decoration: const ShapeDecoration(
                                                color: Color(
                                                    0xFFB9C24D), // not showing up ???
                                                shape: CircleBorder()),
                                            child: IconButton(
                                              onPressed: () async {
                                                setState(() {
                                                  favorite = !favorite;
                                                });
                                                projNum = 1;
                                                //change projNum according to database assigned num for each new proj on the search page
                                                addRemoveFavorite(
                                                    currentUser, projNum);
                                              },
                                              icon: Icon(
                                                //switch between icons on click
                                                (favorite == false)
                                                    ? Icons
                                                        .favorite_border_rounded
                                                    : Icons.favorite_rounded,
                                              ),
                                              iconSize: 30,
                                              color: Colors.white,
                                              splashColor: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 15.0, bottom: 5.0),
                                              child: ProjText(
                                                projNum: 1,
                                                isTitle: false,
                                              ))),
                                      TextButton(
                                          onPressed:
                                              () {}, // should go to individual project page when pressed
                                          child: const Text(
                                            'LEARN MORE ->',
                                            style: TextStyle(
                                              color: Color(0xFFB9C24D),
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w300,
                                            ),
                                            textAlign: TextAlign.left,
                                          )),
                                    ])))),
                    Container(
                        margin: EdgeInsets.all(20.0),
                        height: 215.0,
                        width: 270.0,
                        color: Colors.transparent,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFF0E346D),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0))),
                            child: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ProjText(
                                              projNum: 3,
                                              isTitle: true,
                                            ),
                                          ),

                                          // Favorite button (still need to fill with right color & link to favorites)
                                          Ink(
                                            decoration: const ShapeDecoration(
                                                color: Color(0xFFB9C24D),
                                                shape: CircleBorder()),
                                            child: IconButton(
                                              onPressed: () async {
                                                setState(() {
                                                  favorite = !favorite;
                                                });
                                                projNum = 3;
                                                //change projNum according to database assigned num for each new proj on the search page
                                                addRemoveFavorite(
                                                    currentUser, projNum);
                                              },
                                              icon: Icon(
                                                //switch between icons on click
                                                (favorite == false)
                                                    ? Icons
                                                        .favorite_border_rounded
                                                    : Icons.favorite_rounded,
                                              ),
                                              iconSize: 30,
                                              color: Colors.white,
                                              splashColor: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 15.0, bottom: 5.0),
                                              child: ProjText(
                                                projNum: 3,
                                                isTitle: false,
                                              ))),
                                      TextButton(
                                          onPressed:
                                              () {}, // should go to individual project page when pressed
                                          child: const Text(
                                            'LEARN MORE ->',
                                            style: TextStyle(
                                              color: Color(0xFFB9C24D),
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w300,
                                            ),
                                            textAlign: TextAlign.left,
                                          )),
                                    ])))),
                    Container(
                        margin: EdgeInsets.all(20.0),
                        height: 215.0,
                        width: 270.0,
                        color: Colors.transparent,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFF0E346D),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0))),
                            child: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ProjText(
                                              projNum: 7,
                                              isTitle: true,
                                            ),
                                          ),

                                          // Favorite button (still need to fill with right color & link to favorites)
                                          Ink(
                                            decoration: const ShapeDecoration(
                                                color: Color(0xFFB9C24D),
                                                shape: CircleBorder()),
                                            child: IconButton(
                                              onPressed: () async {
                                                setState(() {
                                                  favorite = !favorite;
                                                });
                                                projNum = 7;
                                                //change projNum according to database assigned num for each new proj on the search page
                                                addRemoveFavorite(
                                                    currentUser, projNum);
                                                // print(isFavorite(projNum));
                                              },
                                              icon: Icon(
                                                //switch between icons on click
                                                (favorite == false)
                                                    ? Icons
                                                        .favorite_border_rounded
                                                    : Icons.favorite_rounded,
                                              ),
                                              iconSize: 30,
                                              color: Colors.white,
                                              splashColor: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 15.0, bottom: 5.0),
                                              child: ProjText(
                                                projNum: 7,
                                                isTitle: false,
                                              ))),
                                      TextButton(
                                          onPressed:
                                              () {}, // should go to individual project page when pressed
                                          child: const Text(
                                            'LEARN MORE ->',
                                            style: TextStyle(
                                              color: Color(0xFFB9C24D),
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w300,
                                            ),
                                            textAlign: TextAlign.left,
                                          )),
                                    ])))),
                  ])),
            )));
  }
}

// var favList = List<int>.generate(1, (index) => 0, growable: true);
// bool initialCheck = false;
// getFavs(User? currentUser) async {
//   if (currentUser != null && !initialCheck) {
//     DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore
//         .instance
//         .collection('users')
//         .doc(currentUser.uid)
//         .get();

//     if (doc.exists) {
//       if (doc.data()!.containsKey('favoriteProjs')) {
//         //Check favoriteProjs exists add proj
//         List favProjs = doc['favoriteProjs'];
//         for (int i = 0; i < favProjs.length; i++) {
//           favList.insert(i, favProjs[i]);
//         }
//       }
//     }
//   }
// }

void addRemoveFavorite(User? currentUser, int projNum) async {
  if (currentUser != null) {
    var users = FirebaseFirestore.instance.collection('users');
    DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore
        .instance
        .collection('users')
        .doc(currentUser.uid)
        .get();

    if (doc.exists) {
      if (doc.data()!.containsKey('favoriteProjs')) {
        //Check favoriteProjs exists add proj
        List favProjs = doc['favoriteProjs'];
        if (favProjs.contains(projNum) == true) {
          // favList.removeWhere((element) => element == projNum);
          users.doc(currentUser.uid).update({
            'favoriteProjs': FieldValue.arrayRemove([projNum])
          });
        } else {
          // favList.insert(favList.length, projNum);
          users.doc(currentUser.uid).update({
            'favoriteProjs': FieldValue.arrayUnion([projNum])
          });
        }
      } else {
        //create favoriteProjs field if it doesn't exist
        // favList.insert(favList.length, projNum);
        users.doc(currentUser.uid).set({
          'favoriteProjs': [projNum]
        }, SetOptions(merge: true));
      }
    }
    // print(favList);
  }
}

Future<Map<String, dynamic>> getProjectData(int projNum) async {
  QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
      .instance
      .collection('projects')
      .where('projectnumber', isEqualTo: projNum)
      .get();
  return snapshot.docs[0].data();
}

class ProjText extends StatelessWidget {
  final int projNum;
  final bool isTitle;

  const ProjText({required this.projNum, required this.isTitle});

  @override
  Widget build(BuildContext context) {
    if (isTitle) {
      return FutureBuilder<Map<String, dynamic>>(
        future: getProjectData(projNum),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.hasError) return CircularProgressIndicator();
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("");
          }

          return Text(
            snapshot.data!['title'],
            style: TextStyle(
                color: Color(0xFFF9F8F1),
                fontSize: 42,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.left,
          );
        },
      );
    } else {
      return FutureBuilder<Map<String, dynamic>>(
        future: getProjectData(projNum),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.hasError) return CircularProgressIndicator();
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("");
          }

          return Text(
            snapshot.data!['brief'],
            style: TextStyle(
                color: Color(0xFFF9F8F1),
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400),
            textAlign: TextAlign.left,
          );
        },
      );
    }
  }
}


// // ///Search if a project is in the favorites
// bool isFavorite(int projNum) {
//   if (favList.contains(projNum)) {
//     return true;
//   }
//   return false;
// }
