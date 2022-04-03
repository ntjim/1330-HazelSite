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
    {required SearchFilterProperties? filterType,
    int? SDGNum,
    String? projName}) async {
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
  } else if (projName != null) {
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection("projects")
        .where("title", isEqualTo: projName)
        .get();
    filterList = [];
    if (snapshot.docs.isNotEmpty) {
      filterList.add(snapshot.docs[0].data()['projectnumber']);
    } else {
      filterList.add(0);
    }
    return snapshot;
  } else {
    //get all projects now but other filters can be added here
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('projects')
        .where('title', isNotEqualTo: '')
        .get();
    allProjList = [];
    for (var i in snapshot.docs) {
      if (i.data()['projectnumber'] == 4) {
        //move support all projects to top of list
        allProjList.insert(0, 4);
      } else {
        allProjList.add(i.data()['projectnumber']);
      }
    }

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
          future:
              getSearchedList(filterType: whichFilter, projName: searchWord),
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
                itemCount: allProjList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProjContainer(allProjList[index],
                      allProjList[index] == selectedProjectNum, currentUser);
                });
          });
    }
  }
}

// // ignore_for_file: prefer_const_constructors
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import './search_filter.dart';
// import './project_container.dart';
// import './project_search.dart';

// class ProjList extends StatefulWidget {
//   final SearchFilterProperties whichFilter;
//   final User? currentUser;
//   ProjList(this.currentUser, this.whichFilter);
//   @override
//   _ProjListState createState() => _ProjListState(currentUser, whichFilter);
// }

// //modify sdg list to be filterlist from the container
// class _ProjListState extends State<ProjList> {
//   SearchFilterProperties? whichFilter;
//   User? currentUser;

//   _ProjListState(this.currentUser, this.whichFilter);
//   @override
//   Widget build(BuildContext context) {
//     if (whichFilter != null && whichFilter == SearchFilterProperties.sdg) {
//       selectedFilter = SearchFilterProperties.noFilter;
//       searchList[0] = 0;
//       showSearchResult = false;
//       return ListView.builder(
//           physics: ClampingScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: sdgList.length,
//           itemBuilder: (BuildContext context, int index) {
//             return ProjContainer(sdgList[index],
//                 (sdgList[index] == selectedProjectNum), currentUser);
//           });
//     } else if (showSearchResult) {
//       reloadCount += 1;

//       ///TO-DO: Fix counting to reload
//       if (reloadCount >= 3) {
//         reloadCount = 0;
//         showSearchResult = false;
//       }
//       return ListView.builder(
//           physics: ClampingScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: searchList[0] == 0 ? 0 : 1,
//           itemBuilder: (BuildContext context, int index) {
//             return ProjContainer(searchList[index],
//                 (searchList[index] == selectedProjectNum), currentUser);
//           });
//     } else {
//       searchList[0] = 0;
//       showSearchResult = false;
//       return ListView.builder(
//           physics: ClampingScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: allProjs.length,
//           itemBuilder: (BuildContext context, int index) {
//             return ProjContainer(allProjs[index],
//                 (allProjs[index] == selectedProjectNum), currentUser);
//           });
//     }
//   }
// }
