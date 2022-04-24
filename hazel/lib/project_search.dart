// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './routing/route_names.dart';
import './navigation_bar.dart';
import './locator.dart';
import './navigation_service.dart';
import './search_filter.dart';
import './project_list.dart';

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

// User's "favorited" project
int selectedProjectNum = 0;

String searchWord = "";

class ProjectSearch extends StatefulWidget {
  const ProjectSearch({Key? key}) : super(key: key);

  @override
  _ProjectSearchState createState() => _ProjectSearchState();
}

class _ProjectSearchState extends State<ProjectSearch> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    User? currentUser = auth.currentUser;
    return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(builder:
        (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
      if (snapshot.hasError) return CircularProgressIndicator();
      if (snapshot.connectionState == ConnectionState.waiting) {
        return CircularProgressIndicator();
      }
      return Scaffold(
          appBar: AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Image.asset('Google@3x.png'),
                  onPressed: () {
                    locator<NavigationService>().navigateTo(HomeRoute);
                  },
                );
              },
            ),
            centerTitle: false,
            title: Text("Hazel", style: TextStyle(color: Colors.white)),
            actions: <Widget>[NaviBar()],
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
                                //make sure filter is reset
                                selectedFilter =
                                    SearchFilterProperties.noFilter;
                                //set project that's being searched for
                                searchWord = searchController.text;
                                if (searchWord.isEmpty) {
                                  setState(() {
                                    showSearchResult = false;
                                  });
                                } else {
                                  setState(() {
                                    showSearchResult = true;
                                  });
                                }
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
                              selectedFilter = SearchFilterProperties.noFilter;
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
                  FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(builder:
                      (BuildContext context,
                          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                              snapshot) {
                    if (snapshot.hasError) return CircularProgressIndicator();
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    return ProjList(currentUser, selectedFilter!);
                  }),
                ])),
          ));
    });
  }
}
