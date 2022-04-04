// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './project_search.dart';
import './project_page.dart';
import './project_text.dart';
import './search_filter.dart';

List<dynamic> filterList = [];
List<int> allProjList = [];

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
        widgetList.add(Ink(
          decoration: const ShapeDecoration(
              color: Color(0xFFB9C24D), shape: CircleBorder()),
          child: FavIcon(projNum, favorite),
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

class FavIcon extends StatefulWidget {
  final int projNum;
  final bool favorite;

  FavIcon(this.projNum, this.favorite);
  @override
  _FavIconState createState() => _FavIconState(projNum, favorite);
}

class _FavIconState extends State<FavIcon> {
  int projNum;
  bool favorite;
  _FavIconState(this.projNum, this.favorite);

  Future<DocumentSnapshot<Map<String, dynamic>>> addRemoveProject(
      User? currentUser, int projNum) async {
    var users = FirebaseFirestore.instance.collection('users');
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('users')
        .doc(currentUser!.uid)
        .get();
    if (snapshot.exists) {
      //un-favorite project
      if (snapshot['selectedprojectnumber'] == projNum) {
        users.doc(currentUser.uid).update({'selectedprojectnumber': 0});
        //favorite project
      } else {
        selectedProjectNum = projNum;
        users.doc(currentUser.uid).update({'selectedprojectnumber': projNum});
      }
    }
    return snapshot;
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? currentUser = auth.currentUser;

    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      future: addRemoveProject(currentUser, projNum),
      builder: (BuildContext context,
          AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasError) return CircularProgressIndicator();
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        return IconButton(
          onPressed: () async {
            setState(() {
              favorite = !favorite;
            });
            selectedProjectNum = snapshot.data!['selectedprojectnumber'];
            addRemoveProject(currentUser, projNum);
          },
          icon: Icon(
            (favorite == false) ? Icons.add : Icons.done,
          ),
          iconSize: 30,
          color: Colors.white,
          splashColor: Colors.grey,
        );
      },
    );
  }
}
