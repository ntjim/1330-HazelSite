// ignore_for_file: prefer_const_constructors
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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

  ///Gets all data about a project
  Future<Map<String, dynamic>> getProjectData(int projNum) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('projects')
        .where('projectnumber', isEqualTo: projNum)
        .get();
    return snapshot.docs[0].data();
  }

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
