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

import './home.dart';
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
// Controls visbility class (search filters)
bool showFilters = false;
bool showSearchResult = false;
List<int> allProjs = [4, 1, 3, 7, 8];
List<dynamic> sdgList = <dynamic>[];
List searchList = [-1];

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
  // bool favorite = false;
  String searchWord = "";

  @override
  Widget build(BuildContext context) {
    User? currentUser = auth.currentUser;

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
                    icon: Image.asset('assets/Google@3x.png'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                      //Scaffold.of(context).openDrawer();
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

///Get's all projects with the SGD to filter by. Populate global variable sgdList
///with list values. Currently hardcoded to find SGD 4.
void getSGDList(int SGDNum) async {
  var snapshot = await FirebaseFirestore.instance
      .collection("projects")
      .where("SDGLogo", arrayContainsAny: [SGDNum]).get();
  for (var i in snapshot.docs) {
    if (i.data()['title'] != "Support All Projects" &&
        !sdgList.contains(i.data()['projectnumber'])) {
      sdgList.insert(sdgList.length, i.data()['projectnumber']);
    }
  }
}

///Add and remove project from the User's 'selectedprojectnumber' doc field
void addRemoveProject(User? currentUser, int projNum) async {
  if (currentUser != null) {
    var users = FirebaseFirestore.instance.collection('users');
    DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore
        .instance
        .collection('users')
        .doc(currentUser.uid)
        .get();
    if (doc.exists) {
      if (doc['selectedprojectnumber'] == projNum) {
        selectedProjectNum = 0;
        users.doc(currentUser.uid).update({'selectedprojectnumber': 0});
      } else {
        selectedProjectNum = projNum;
        users.doc(currentUser.uid).update({'selectedprojectnumber': projNum});
      }
    }
  }
}

///Sets global var selectedProjectNum to the User's 'selectedprojectnumber' from the
///database.
void setSelectedProjectNum(User? currentUser) async {
  if (currentUser != null) {
    DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore
        .instance
        .collection('users')
        .doc(currentUser.uid)
        .get();
    selectedProjectNum = doc.data()!['selectedprojectnumber'];
  }
}

///Gets all data about a project
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
  final double fontSize;
  final FontWeight fontWeight;

  const ProjText(
      {required this.projNum,
      required this.isTitle,
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
            "  ",
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
  sdg,
  conservation,
  lessThanXFunded,
  greaterThanXFunded,
  noFilter,
}

class SearchFilter extends StatefulWidget {
  const SearchFilter({Key? key}) : super(key: key);

  @override
  _SearchFilterState createState() => _SearchFilterState();
}

SearchFilterProperties? selectedFilter = SearchFilterProperties.noFilter;

class _SearchFilterState extends State<SearchFilter> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showFilters,
      child: Container(
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
                  title: const Text('SDG 4'),
                  value: SearchFilterProperties.sdg,
                  groupValue: selectedFilter,
                  onChanged: (SearchFilterProperties? value) {
                    setState(() {
                      selectedFilter = value;
                    });
                  },
                  toggleable: true,
                ),
                RadioListTile<SearchFilterProperties>(
                  title: const Text('Conservation Projects'),
                  value: SearchFilterProperties.conservation,
                  groupValue: selectedFilter,
                  onChanged: (SearchFilterProperties? value) {
                    setState(() {
                      selectedFilter = value;
                    });
                  },
                  toggleable: true,
                ),
                RadioListTile<SearchFilterProperties>(
                  title: const Text('<x% Funded'),
                  value: SearchFilterProperties.lessThanXFunded,
                  groupValue: selectedFilter,
                  onChanged: (SearchFilterProperties? value) {
                    setState(() {
                      selectedFilter = value;
                    });
                  },
                  toggleable: true,
                ),
                RadioListTile<SearchFilterProperties>(
                  title: const Text('>x% Funded'),
                  value: SearchFilterProperties.greaterThanXFunded,
                  groupValue: selectedFilter,
                  onChanged: (SearchFilterProperties? value) {
                    setState(() {
                      selectedFilter = value;
                    });
                  },
                  toggleable: true,
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        showFilters = !showFilters;
                        showSearchResult = false;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProjectSearch()));
                    },
                    child: const Text('Update',
                        style: TextStyle(
                          color: Color(0xFFB9C24D),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ))),
              ],
            )),
      ),
    );
  }
}

class ProjList extends StatefulWidget {
  final SearchFilterProperties whichFilter;
  final User? currentUser;
  ProjList(this.currentUser, this.whichFilter);
  @override
  _ProjListState createState() => _ProjListState(currentUser, whichFilter);
}

class _ProjListState extends State<ProjList> {
  SearchFilterProperties? whichFilter;
  User? currentUser;

  _ProjListState(this.currentUser, this.whichFilter);
  @override
  Widget build(BuildContext context) {
    if (whichFilter != null && whichFilter == SearchFilterProperties.sdg) {
      // print("here 1");
      selectedFilter = SearchFilterProperties.noFilter;
      searchList[0] = 0;
      showSearchResult = false;
      return ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: sdgList.length,
          itemBuilder: (BuildContext context, int index) {
            return ProjContainer(sdgList[index],
                (sdgList[index] == selectedProjectNum), currentUser);
          });
    } else if (showSearchResult) {
      reloadCount += 1;
      if (reloadCount >= 3) {
        reloadCount = 0;
        showSearchResult = false;
      }
      return ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: searchList[0] == 0 ? 0 : 1,
          itemBuilder: (BuildContext context, int index) {
            return ProjContainer(searchList[index],
                (searchList[index] == selectedProjectNum), currentUser);
          });
    } else {
      // print("here 3");
      // print("---");
      searchList[0] = 0;
      showSearchResult = false;
      return ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: allProjs.length,
          itemBuilder: (BuildContext context, int index) {
            return ProjContainer(allProjs[index],
                (allProjs[index] == selectedProjectNum), currentUser);
          });
    }
  }
}

class ProjContainer extends StatefulWidget {
  final int projNum;
  final bool favorite;
  final User? currentUser;
  ProjContainer(this.projNum, this.favorite, this.currentUser);

  @override
  _ProjContainerState createState() =>
      _ProjContainerState(projNum, favorite, currentUser);
}

class _ProjContainerState extends State<ProjContainer> {
  int projNum;
  bool favorite;
  User? currentUser;

  _ProjContainerState(this.projNum, this.favorite, this.currentUser);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    getSGDList(4);

    List<Widget> showHeartIcon() {
      List<Widget> widgetList = [];

      widgetList.add(
        Expanded(
          child: ProjText(
            projNum: projNum,
            isTitle: true,
            fontSize: 42,
            fontWeight: FontWeight.w500,
          ),
        ),
      );

      if (auth.currentUser != null) {
        setSelectedProjectNum(currentUser);

        widgetList.add(Ink(
          decoration: const ShapeDecoration(
              color: Color(0xFFB9C24D), // not showing up ???
              shape: CircleBorder()),
          child: IconButton(
            onPressed: () async {
              setState(() {
                favorite = !favorite;
              });
              addRemoveProject(currentUser, projNum);
            },
            icon: Icon(
              (favorite == false) ? Icons.add : Icons.done,
            ),
            iconSize: 30,
            color: Colors.white,
            splashColor: Colors.grey,
          ),
        ));
      }

      return widgetList;
    }

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
                        children: showHeartIcon(),
                      ),
                      Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(top: 15.0, bottom: 5.0),
                              child: ProjText(
                                projNum: projNum,
                                isTitle: false,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ))),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProjectPage(projNum: projNum)));
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
