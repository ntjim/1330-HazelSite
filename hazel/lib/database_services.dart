import 'package:cloud_firestore/cloud_firestore.dart';
import 'app_user.dart';
import 'dart:async';

class DatabaseServices {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getStream() {
    return db.collection('users').snapshots();
  }

  // Stream<AppUser> streamAppUser(String uid) {
  //   return db
  //       .collection('users')
  //       .doc(uid)
  //       .snapshots()
  //       .map((snap) => AppUser.fromFirestore(snap));
  // }
}
