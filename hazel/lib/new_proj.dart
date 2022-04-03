// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './search_filter.dart';
import './project_container.dart';
import './project_search.dart';

class ProjList extends StatefulWidget {
  final SearchFilterProperties whichFilter;
  final User? currentUser;
  ProjList(this.currentUser, this.whichFilter);
  @override
  _ProjListState createState() => _ProjListState(currentUser, whichFilter);
}

Future<QuerySnapshot<Map<String, dynamic>>> getSearchedList(
    {required SearchFilterProperties? filterType, int? SDGNum}) async {
  if (filterType == SearchFilterProperties.sdg && SDGNum != null) {
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection("projects")
        .where("SDGLogo", arrayContainsAny: [SDGNum]).get();
    filterList = [];
    for (var i in snapshot.docs) {
      if (i.data()['title'] != "Support All Projects" &&
          !filterList.contains(i.data()['projectnumber'])) {
        filterList.add(i.data()['projectnumber']);
      }
    }
    return snapshot;
  } else {
    //get all projects now but other filters can be added here
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('projects')
        .where('title', isNotEqualTo: '')
        .get();
    filterList = [];
    for (var i in snapshot.docs) {
      filterList.add(i.data()['projectnumber']);
    }
    filterList.sort();
    return snapshot;
  }
}

//modify sdg list to be filterlist from the container
class _ProjListState extends State<ProjList> {
  SearchFilterProperties? whichFilter;
  User? currentUser;

  _ProjListState(this.currentUser, this.whichFilter);
  @override
  Widget build(BuildContext context) {
    print(showSearchResult);
    //sdg filter
    if (whichFilter != null && whichFilter == SearchFilterProperties.sdg) {
      showSearchResult = false;
      return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
          future: getSearchedList(filterType: whichFilter, SDGNum: 4),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasError) return CircularProgressIndicator();
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            return ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: filterList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProjContainer(filterList[index],
                      filterList[index] == selectedProjectNum, currentUser);
                });
          });
      //search
    } else if (showSearchResult) {
      showSearchResult = false;
      return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
          future: getSearchedList(filterType: whichFilter),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasError) return CircularProgressIndicator();
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            return ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: filterList[0] == 0 ? 0 : 1,
                itemBuilder: (BuildContext context, int index) {
                  print(filterList);
                  return ProjContainer(filterList[index],
                      filterList[index] == selectedProjectNum, currentUser);
                });
          });
      //no filter
    } else {
      showSearchResult = false;
      return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
          future: getSearchedList(filterType: whichFilter, SDGNum: 4),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasError) return CircularProgressIndicator();
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            return ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: filterList[0].length,
                itemBuilder: (BuildContext context, int index) {
                  return ProjContainer(filterList[index],
                      filterList[index] == selectedProjectNum, currentUser);
                });
          });
    }
  }
}


// // ignore_for_file: prefer_const_constructors
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import './project_search.dart';
// import './project_page.dart';
// import './project_text.dart';
// import './search_filter.dart';

// List<dynamic> filterList = [];

// class ProjContainer extends StatefulWidget {
//   final int projNum;
//   final bool favorite;
//   final User? currentUser;
//   ProjContainer(this.projNum, this.favorite, this.currentUser);

//   @override
//   _ProjContainerState createState() =>
//       _ProjContainerState(projNum, favorite, currentUser);
// }

// class _ProjContainerState extends State<ProjContainer> {
//   int projNum;
//   bool favorite;
//   User? currentUser;

//   _ProjContainerState(this.projNum, this.favorite, this.currentUser);
//   Future<QuerySnapshot<Map<String, dynamic>>> getSearchedList(
//       {required SearchFilterProperties filterType, int? SDGNum}) async {
//     if (filterType == SearchFilterProperties.sdg) {
//       QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
//           .instance
//           .collection("projects")
//           .where("SDGLogo", arrayContainsAny: [SDGNum]).get();
//       return snapshot;
//     } else {
//       //get all projects now but other filters can be added here
//       QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
//           .instance
//           .collection('projects')
//           .where('title', isNotEqualTo: '')
//           .get();
//       return snapshot;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     List<Widget> showHeartIcon() {
//       List<Widget> widgetList = [];

//       widgetList.add(
//         Expanded(
//           child: ProjText(
//             projNum: projNum,
//             isTitle: true,
//             fontSize: 42,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       );

//       if (auth.currentUser != null) {
//         // setSelectedProjectNum(currentUser);//////////////////need to change
//         widgetList.add(Ink(
//           decoration: const ShapeDecoration(
//               color: Color(0xFFB9C24D), // not showing up ???
//               shape: CircleBorder()),
//           child: FavIcon(projNum, favorite),
//         ));
//       }

//       return widgetList;
//     }

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
//                         children: showHeartIcon(),
//                       ),
//                       Expanded(
//                           child: Padding(
//                               padding: EdgeInsets.only(top: 15.0, bottom: 5.0),
//                               child: ProjText(
//                                 projNum: projNum,
//                                 isTitle: false,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w400,
//                               ))),
//                       TextButton(
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         ProjectPage(projNum: projNum)));
//                           }, // should go to individual project page when pressed
//                           child: const Text(
//                             'LEARN MORE ->',
//                             style: TextStyle(
//                               color: Color(0xFFB9C24D),
//                               fontSize: 14,
//                               fontFamily: 'Roboto',
//                               fontWeight: FontWeight.w300,
//                             ),
//                             textAlign: TextAlign.left,
//                           )),
//                     ]))));
//   }
// }

// class FavIcon extends StatefulWidget {
//   final int projNum;
//   final bool favorite;

//   FavIcon(this.projNum, this.favorite);
//   @override
//   _FavIconState createState() => _FavIconState(projNum, favorite);
// }

// class _FavIconState extends State<FavIcon> {
//   int projNum;
//   bool favorite;
//   _FavIconState(this.projNum, this.favorite);

//   Future<DocumentSnapshot<Map<String, dynamic>>> addRemoveProject(
//       User? currentUser, int projNum) async {
//     var users = FirebaseFirestore.instance.collection('users');
//     DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
//         .instance
//         .collection('users')
//         .doc(currentUser!.uid)
//         .get();
//     if (snapshot.exists) {
//       //un-favorite project
//       if (snapshot['selectedprojectnumber'] == projNum) {
//         users.doc(currentUser.uid).update({'selectedprojectnumber': 0});
//         //favorite project
//       } else {
//         selectedProjectNum = projNum;
//         users.doc(currentUser.uid).update({'selectedprojectnumber': projNum});
//       }
//     }
//     return snapshot;
//   }

//   @override
//   Widget build(BuildContext context) {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User? currentUser = auth.currentUser;

//     return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//       future: addRemoveProject(currentUser, projNum),
//       builder: (BuildContext context,
//           AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
//         if (snapshot.hasError) return CircularProgressIndicator();
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         }
//         return IconButton(
//           onPressed: () async {
//             setState(() {
//               favorite = !favorite;
//             });
//             selectedProjectNum = snapshot.data!['selectedprojectnumber'];
//             addRemoveProject(currentUser, projNum);
//           },
//           icon: Icon(
//             (favorite == false) ? Icons.add : Icons.done,
//           ),
//           iconSize: 30,
//           color: Colors.white,
//           splashColor: Colors.grey,
//         );
//       },
//     );
//   }
// }


// // ignore_for_file: prefer_const_constructors
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:hazel/nav_bar.dart';

// import './nav_bar.dart';
// import 'home.dart';
// import './search_filter.dart';
// import './project_list.dart';

// Map<int, Color> color = {
//   50: Color.fromRGBO(179, 180, 61, .1),
//   100: Color.fromRGBO(179, 180, 61, .2),
//   200: Color.fromRGBO(179, 180, 61, .3),
//   300: Color.fromRGBO(179, 180, 61, .4),
//   400: Color.fromRGBO(179, 180, 61, .5),
//   500: Color.fromRGBO(179, 180, 61, .6),
//   600: Color.fromRGBO(179, 180, 61, .7),
//   700: Color.fromRGBO(179, 180, 61, .8),
//   800: Color.fromRGBO(179, 180, 61, .9),
//   900: Color.fromRGBO(179, 180, 61, 1),
// };

// MaterialColor navColor = MaterialColor(0xFFB3B43D, color);
// // Controls visbility class (search filters)
// bool showFilters = false;
// bool showSearchResult = false;
// List<int> allProjs = [4, 1, 3, 7, 8];
// List<dynamic> sdgList = <dynamic>[];
// List<int> searchList = [-1];

// // User's "favorited" project
// int selectedProjectNum = 0;
// // Number associated with the project being searched for
// int searchedProject = 0;

// /// Number of times the page has been reloaded. Used to fix reloading after search.
// /// TO-DO: do something so this counter can be deleted
// int reloadCount = 0;

// class ProjectSearch extends StatefulWidget {
//   const ProjectSearch({Key? key}) : super(key: key);

//   @override
//   _ProjectSearchState createState() => _ProjectSearchState();
// }

// class _ProjectSearchState extends State<ProjectSearch> {
//   final FirebaseAuth auth = FirebaseAuth.instance;
//   final searchController = TextEditingController();
//   String searchWord = "";

//   @override
//   Widget build(BuildContext context) {
//     User? currentUser = auth.currentUser;

//     Future<QuerySnapshot<Map<String, dynamic>>> getSearchedList(
//         String searchWord, BuildContext context) async {
//       QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
//           .instance
//           .collection('projects')
//           .where('title', isEqualTo: searchWord)
//           .get();
//       return snapshot;
//     }

//     return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
//         future: getSearchedList(searchWord, context),
//         builder: (BuildContext context,
//             AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
//           if (snapshot.hasError) return CircularProgressIndicator();
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           }
//           return MaterialApp(
//               theme: ThemeData(fontFamily: 'Roboto', primarySwatch: navColor),
//               home: Scaffold(
//                   appBar: AppBar(
//                     leading: Builder(
//                       builder: (BuildContext context) {
//                         return IconButton(
//                           icon: Image.asset('Google@3x.png'),
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => HomePage()),
//                             );
//                           },
//                           tooltip: MaterialLocalizations.of(context)
//                               .openAppDrawerTooltip,
//                         );
//                       },
//                     ),
//                     title: Text("Hazel", style: TextStyle(color: Colors.white)),
//                     actions: <Widget>[NavBar()],
//                   ),
//                   body: Center(
//                     child: Container(
//                         constraints: BoxConstraints.expand(),
//                         decoration: BoxDecoration(
//                             image: DecorationImage(
//                                 image: AssetImage('boatfilter.png'),
//                                 fit: BoxFit.cover)),
//                         child: ListView(children: [
//                           Padding(
//                               padding: EdgeInsets.only(top: 25.0, bottom: 5.0),
//                               child: Text(
//                                 'Projects',
//                                 style: TextStyle(
//                                     color: Color(0xFFF9F8F1),
//                                     fontSize: 70,
//                                     fontFamily: 'Roboto',
//                                     fontWeight: FontWeight.w600),
//                                 textAlign: TextAlign.center,
//                               )),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               //Search Bar//////////////////
//                               Expanded(
//                                 child: Container(
//                                     margin: EdgeInsets.only(
//                                         left: 20.0, right: 10.0, top: 15.0),
//                                     color: Colors.transparent,
//                                     child: Container(
//                                         margin: EdgeInsets.only(bottom: 10.0),
//                                         child: TextField(
//                                           controller: searchController,
//                                           decoration: InputDecoration(
//                                               fillColor: Color(0xFFF9F8F1),
//                                               filled: true,
//                                               border: OutlineInputBorder(
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           8.0)),
//                                               hintText: 'Search projects'),
//                                         ))),
//                               ),
//                               Container(
//                                 // Search Button  ///////////
//                                 margin: EdgeInsets.only(right: 20),
//                                 child: CircleAvatar(
//                                     radius: 20,
//                                     backgroundColor: Colors.lightGreen[400],
//                                     child: IconButton(
//                                       icon: Icon(Icons.search,
//                                           color: Colors.white),
//                                       onPressed: () async {
//                                         searchWord = searchController.text;
//                                         // getSearchedList(searchWord, context);
//                                         if (searchWord.isEmpty) {
//                                           setState(() {
//                                             showSearchResult = false;
//                                           });
//                                         } else {
//                                           setState(() {
//                                             showSearchResult = true;
//                                           });
//                                         }
//                                         // reloadCount += 1;
//                                         Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     ProjectSearch()));
//                                       },
//                                     )),
//                               ),
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               Align(
//                                 alignment: Alignment(0.95, 0.0),
//                                 child: TextButton(
//                                   onPressed: () {
//                                     setState(() {
//                                       showFilters = !showFilters;
//                                       selectedFilter =
//                                           SearchFilterProperties.noFilter;
//                                     });
//                                   },
//                                   child: showFilters
//                                       ? Text('Hide Search Filters',
//                                           style: TextStyle(
//                                             color: Color(0xFFF9F8F1),
//                                             fontSize: 12,
//                                             fontFamily: 'Roboto',
//                                             fontWeight: FontWeight.w200,
//                                           ))
//                                       : Text('Show Search Filters',
//                                           style: TextStyle(
//                                             color: Color(0xFFF9F8F1),
//                                             fontSize: 12,
//                                             fontFamily: 'Roboto',
//                                             fontWeight: FontWeight.w200,
//                                           )),
//                                 ),
//                               ),
//                               SearchFilter(),
//                             ],
//                           ),
//                           ProjList(currentUser, selectedFilter!),
//                         ])),
//                   )));
//         });
//   }
// }
