// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hazel/nav_bar.dart';

import './nav_bar.dart';
import 'home.dart';
import './search_filter.dart';
import './project_list.dart';

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
// Controls visbility class (search filters)
bool showFilters = false;
bool showSearchResult = false;
List<int> allProjs = [4, 1, 3, 7, 8];
List<dynamic> sdgList = <dynamic>[];
List<int> searchList = [-1];

// User's "favorited" project
int selectedProjectNum = 0;
// Number associated with the project being searched for
int searchedProject = 0;

/// Number of times the page has been reloaded. Used to fix reloading after search.
/// TO-DO: do something so this counter can be deleted
int reloadCount = 0;

class _ProjectSearchState extends State<ProjectSearch> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final searchController = TextEditingController();
  String searchWord = "";

  @override
  Widget build(BuildContext context) {
    User? currentUser = auth.currentUser;

    ///Retrieves project searched for (case sensitive and must be exact title).
    ///Sets global variable searched to corresponding project number or 0 if there's no match
    ///TO-DO: find a solution for forced reloading instead of waiting for the database to
    ///get the response
    void getSearchedList(String searchWord, BuildContext context) async {
      var snapshot = await FirebaseFirestore.instance
          .collection("projects")
          .where("title", isEqualTo: searchWord)
          .get();
      if (snapshot.docs.isNotEmpty) {
        searchedProject = snapshot.docs[0].data()['projectnumber'];
      } else {
        searchedProject = 0;
      }
      searchList[0] = searchedProject;
      // reloadCount += 1;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProjectSearch()));
    }

    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Roboto',
          primarySwatch: navColor,
        ),
        home: Scaffold(
            appBar: AppBar(
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: Image.asset('Google@3x.png'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
              ),
              title: Text("Hazel", style: TextStyle(color: Colors.white)),
              actions: <Widget>[NavBar()],
            ),
            body: Center(
              child: Container(
                  constraints: BoxConstraints.expand(),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('boatfilter.png'),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Search Bar//////////////////
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.only(
                                  left: 20.0, right: 10.0, top: 15.0),
                              color: Colors.transparent,
                              child: Container(
                                  margin: EdgeInsets.only(bottom: 10.0),
                                  child: TextField(
                                    controller: searchController,
                                    decoration: InputDecoration(
                                        fillColor: Color(0xFFF9F8F1),
                                        filled: true,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0)),
                                        hintText: 'Search projects'),
                                  ))),
                        ),
                        Container(
                          // Search Button  ///////////
                          margin: EdgeInsets.only(right: 20),
                          child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.lightGreen[400],
                              child: IconButton(
                                icon: Icon(Icons.search, color: Colors.white),
                                onPressed: () async {
                                  searchWord = searchController.text;
                                  getSearchedList(searchWord, context);
                                  if (searchWord.isEmpty) {
                                    setState(() {
                                      showSearchResult = false;
                                    });
                                  } else {
                                    setState(() {
                                      showSearchResult = true;
                                    });
                                  }
                                  // reloadCount += 1;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProjectSearch()));
                                },
                              )),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment(0.95, 0.0),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                showFilters = !showFilters;
                                selectedFilter =
                                    SearchFilterProperties.noFilter;
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
                        SearchFilter(),
                      ],
                    ),
                    ProjList(currentUser, selectedFilter!),
                  ])),
            )));
  }
}
