// ignore_for_file: prefer_const_constructors
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hazel/nav_bar.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

import './private_home.dart';
import './public_home.dart';
import './user_settings.dart';
import './me_page.dart';
import './login_valid.dart';
import './nav_bar.dart';
import './project_page.dart';

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
// variable that controls visbility class (search filters)
bool showFilters = false;

class _ProjectSearchState extends State<ProjectSearch> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    User? currentUser = auth.currentUser;

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
              actions: <Widget>[NavBar()],
            ),
            body: Center(
              child: Container(
                  constraints: BoxConstraints.expand(),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/boatfilter.png'),
                          fit: BoxFit.cover)),
                  child: ListView(children: [
                    Padding(
                        padding: EdgeInsets.only(top: 25.0, bottom: 5.0),
                        child: Text(
                          'Projects',
                          style: TextStyle(
                              color: Color(0xFFF9F8F1),
                              fontSize: 70,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        )),
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
                    Column(
                      children: [
                        Align(
                          alignment: Alignment(0.95, 0.0),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                showFilters = !showFilters;
                              });
                            },
                            child: showFilters
                                ? Text('Hide Search Filters',
                                    style: TextStyle(
                                      color: Color(0xFFF9F8F1),
                                      fontSize: 12,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w200,
                                    ))
                                : Text('Show Search Filters',
                                    style: TextStyle(
                                      color: Color(0xFFF9F8F1),
                                      fontSize: 12,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w200,
                                    )),
                          ),
                        ),
                        Visibility(
                          visible: showFilters,
                          child: SearchFilter(),
                        )
                      ],
                    ),
                    // Expanded(
                    //     child: showThis != 0
                    //         ? ListView.builder(
                    //             itemCount: favoriteList.length,
                    //             itemBuilder: (BuildContext context, int index) {
                    //               return ProjContainer(showThis, favorite,
                    //                   currentUser, " ", " ");
                    //             })
                    //         : ProjContainer(1, favorite, currentUser,
                    //             "tempTitle", "tempBrief")),
                    ProjContainer(
                        1,
                        favorite,
                        currentUser,
                        "SOLD OUT: Rimba Raya Reserve",
                        "Preserve carbon-rich lowland habitat"),
                    ProjContainer(
                        3,
                        favorite,
                        currentUser,
                        "SOLD OUT: Kasigau Sanctuary",
                        "Protect vital wildlife habitat between national parks."),
                    ProjContainer(
                        7,
                        favorite,
                        currentUser,
                        "Conservation: Southern Cardamom",
                        "Protect one of the highest conservation priorities on the planet."),
                  ])),
            )));
  }
}

List<dynamic> favoriteList = <dynamic>[];
List<dynamic> allProjects = <dynamic>[1, 3, 7];
int showThis = 0;

void _runFilter(String searchWord) {
  List<dynamic> results = [];
  if (searchWord.isEmpty) {
    results = allProjects;
  } else {
    searchProject(searchWord);
  }
}

void searchProject(String projName) async {
  var snapshot = await FirebaseFirestore.instance
      .collection('projects')
      .where('title', isEqualTo: projName)
      .get();

  if (snapshot.docs.isNotEmpty) {
  } else {
    showThis = snapshot.docs[0]['projectnumber'];
  }
}

//Conservation: Southern Cardamom
getFavoriteList(User? currentUser) async {
  if (currentUser != null) {
    var thing = await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser!.uid)
        .get();
    // print(thing.data()!['favoriteProjs']);
    favoriteList = thing.data()!['favoriteProjs'];
  }
}

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
          favoriteList.remove(projNum);
        } else {
          // favList.insert(favList.length, projNum);
          users.doc(currentUser.uid).update({
            'favoriteProjs': FieldValue.arrayUnion([projNum])
          });
          favoriteList.insert(favoriteList.length, projNum);
        }
      } else {
        //create favoriteProjs field if it doesn't exist
        // favList.insert(favList.length, projNum);
        users.doc(currentUser.uid).set({
          'favoriteProjs': [projNum]
        }, SetOptions(merge: true));
        favoriteList.insert(favoriteList.length, projNum);
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
  final String tempText;
  final double fontSize;
  final FontWeight fontWeight;

  const ProjText(
      {required this.projNum,
      required this.isTitle,
      required this.tempText,
      required this.fontSize,
      required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: getProjectData(projNum),
      builder:
          (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.hasError) return CircularProgressIndicator();
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text(
            tempText,
            style: TextStyle(
                color: Color(0xFFF9F8F1),
                fontSize: fontSize,
                fontFamily: 'Roboto',
                fontWeight: fontWeight),
            textAlign: TextAlign.left,
          );
        }
        String displayText = snapshot.data!['title'];
        if (!isTitle) {
          displayText = snapshot.data!['brief'];
        }
        return Text(
          displayText,
          style: TextStyle(
              color: Color(0xFFF9F8F1),
              fontSize: fontSize,
              fontFamily: 'Roboto',
              fontWeight: fontWeight),
          textAlign: TextAlign.left,
        );
      },
    );
  }
}

enum SearchFilterProperties {
  favorites,
  conservation,
  lessThanXFunded,
  greaterThanXFunded
}

class SearchFilter extends StatefulWidget {
  const SearchFilter({Key? key}) : super(key: key);

  @override
  _SearchFilterState createState() => _SearchFilterState();
}

SearchFilterProperties? whichFilter = SearchFilterProperties.favorites;

class _SearchFilterState extends State<SearchFilter> {
  SearchFilterProperties? _selectedFilter = SearchFilterProperties.favorites;

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.all(15.0),
      height: 270,
      width: 470,
      color: Colors.transparent,
      child: Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(218, 249, 248, 241),
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
                child: Text(
                  'Search Filters',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              RadioListTile<SearchFilterProperties>(
                title: const Text('Favorites'),
                value: SearchFilterProperties.favorites,
                groupValue: _selectedFilter,
                onChanged: (SearchFilterProperties? value) {
                  setState(() {
                    _selectedFilter = value;
                  });
                },
                toggleable: true,
              ),
              RadioListTile<SearchFilterProperties>(
                title: const Text('Conservation Projects'),
                value: SearchFilterProperties.conservation,
                groupValue: _selectedFilter,
                onChanged: (SearchFilterProperties? value) {
                  setState(() {
                    _selectedFilter = value;
                  });
                },
                toggleable: true,
              ),
              RadioListTile<SearchFilterProperties>(
                title: const Text('<x% Funded'),
                value: SearchFilterProperties.lessThanXFunded,
                groupValue: _selectedFilter,
                onChanged: (SearchFilterProperties? value) {
                  setState(() {
                    _selectedFilter = value;
                  });
                },
                toggleable: true,
              ),
              RadioListTile<SearchFilterProperties>(
                title: const Text('>x% Funded'),
                value: SearchFilterProperties.greaterThanXFunded,
                groupValue: _selectedFilter,
                onChanged: (SearchFilterProperties? value) {
                  setState(() {
                    _selectedFilter = value;
                  });
                },
                toggleable: true,
              ),
              TextButton(
                  onPressed: () {
                    // update project listings when pressed
                    whichFilter = _selectedFilter;
                    print(whichFilter);
                  },
                  child: const Text('Update',
                      style: TextStyle(
                        color: Color(0xFFB9C24D),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ))),
            ],
          )),
    );
  }
}

class ProjContainer extends StatefulWidget {
  final int projNum;
  final bool favorite;
  final User? currentUser;
  final String tempTitle;
  final String tempBrief;
  ProjContainer(this.projNum, this.favorite, this.currentUser, this.tempTitle,
      this.tempBrief);

  @override
  _ProjContainerState createState() =>
      _ProjContainerState(projNum, favorite, currentUser, tempTitle, tempBrief);
}

class _ProjContainerState extends State<ProjContainer> {
  int projNum;
  bool favorite;
  User? currentUser;
  String tempTitle;
  String tempBrief;

  _ProjContainerState(this.projNum, this.favorite, this.currentUser,
      this.tempTitle, this.tempBrief);

  @override
  Widget build(BuildContext context) {
    getFavoriteList(currentUser);
    print(favoriteList);

    return Container(
        margin: EdgeInsets.all(20.0),
        height: 215.0,
        width: 270.0,
        color: Colors.transparent,
        child: Container(
            decoration: BoxDecoration(
                color: Color(0xFF0E346D),
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ProjText(
                              projNum: projNum,
                              isTitle: true,
                              tempText: tempTitle,
                              fontSize: 42,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          // Favorite button (still need to fill with right color & link to favorites)
                          Ink(
                            decoration: const ShapeDecoration(
                                color: Color(0xFFB9C24D), // not showing up ???
                                shape: CircleBorder()),
                            child: IconButton(
                              onPressed: () async {
                                setState(() {
                                  favorite = !favorite;
                                });
                                addRemoveFavorite(currentUser, projNum);
                              },
                              icon: Icon(
                                //switch between icons on click
                                (favorite == false)
                                    ? Icons.favorite_border_rounded
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
                              padding: EdgeInsets.only(top: 15.0, bottom: 5.0),
                              child:
                                  // FavoriteList(
                                  //   currentUser: currentUser,
                                  // )

                                  ProjText(
                                projNum: projNum,
                                isTitle: false,
                                tempText: tempBrief,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ))),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProjectPage()));
                          }, // should go to individual project page when pressed
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
                    ]))));
  }
}




// void _runFilter(String enteredWord) {
//   List<dynamic> results = [];
//   if (enteredWord.isEmpty) {
//     results = allProjects;
//   } else {
//     results = allProjects.where(

//     ).toList();
//   }
// }



// class FavoriteButton extends StatefulWidget {
//   final User? currentUser;
//   const FavoriteButton(this.currentUser);

//   @override
//   _FavoriteButtonState createState() => _FavoriteButtonState(currentUser);
// }

// class _FavoriteButtonState extends State<FavoriteButton> {
//   User? currentUser;
//   _FavoriteButtonState(this.currentUser);
//   bool favorite = false;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: EdgeInsets.all(20.0),
//         height: 215.0,
//         width: 270.0,
//         color: Colors.transparent,
//         child: Container(
//             decoration: BoxDecoration(
//                 color: Color(0xFF0E346D),
//                 borderRadius: BorderRadius.all(Radius.circular(12.0))),
//             child: Padding(
//                 padding: EdgeInsets.all(15.0),
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Text(
//                               "tempText",
//                               style: TextStyle(
//                                   color: Color(0xFFF9F8F1),
//                                   fontSize: 42,
//                                   fontFamily: 'Roboto',
//                                   fontWeight: FontWeight.w500),
//                               textAlign: TextAlign.left,
//                             ),
//                           ),

//                           // Favorite button (still need to fill with right color & link to favorites)
//                           Ink(
//                             decoration: const ShapeDecoration(
//                                 color: Color(0xFFB9C24D), // not showing up ???
//                                 shape: CircleBorder()),
//                             child: IconButton(
//                               onPressed: () async {
//                                 setState(() {
//                                   favorite = !favorite;
//                                 });
//                                 addRemoveFavorite(currentUser, 1);
//                               },
//                               icon: Icon(
//                                 //switch between icons on click
//                                 (favorite == false)
//                                     ? Icons.favorite_border_rounded
//                                     : Icons.favorite_rounded,
//                               ),
//                               iconSize: 30,
//                               color: Colors.white,
//                               splashColor: Colors.grey,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ]))));
// return StreamBuilder(stream:FirebaseFirestore.instance.collection('users').doc(currentUser!.uid).snapshots(),
// builder:
//       (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
//     if (snapshot.hasError) return CircularProgressIndicator();
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return Text("");
//     }
//     IconButton(
//       onPressed: () async {
//         addRemoveFavorite(currentUser, projNum);
//       },
//       icon: Icon(
//         //switch between icons on click
//         (favorite == false)
//             ? Icons.favorite_border_rounded
//             : Icons.favorite_rounded,
//       ),
//       iconSize: 30,
//       color: Colors.white,
//       splashColor: Colors.grey,
//     );
//   }
//   }
// }





// Future<Map<String, dynamic>> getFavoriteList(User? currentUser) async {
//   DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
//       .instance
//       .collection('users')
//       .doc(currentUser!.uid)
//       .get();
//   // print(snapshot.data()!["favoriteProjs"]);
//   // print("---");
//   return snapshot.data()!["favoriteProjs"];
// }

// class FavoriteList extends StatelessWidget {
//   final User? currentUser;
//   final int projNum;
//   bool favorite = false;

//   const FavoriteList({required this.currentUser, required this.projNum});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Map<String, dynamic>>(
//       future: getFavoriteList(currentUser),
//       builder:
//           (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
//         if (snapshot.hasError) return CircularProgressIndicator();
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Text("");
//         }
//         IconButton(
//           onPressed: () async {
//             addRemoveFavorite(currentUser, projNum);
//           },
//           icon: Icon(
//             //switch between icons on click
//             (favorite == false)
//                 ? Icons.favorite_border_rounded
//                 : Icons.favorite_rounded,
//           ),
//           iconSize: 30,
//           color: Colors.white,
//           splashColor: Colors.grey,
//         );
//       },
//     );
//   }
// }
