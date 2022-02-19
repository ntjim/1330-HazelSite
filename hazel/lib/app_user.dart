// ignore_for_file: prefer_initializing_formals

import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  int? coinsAllTime;
  int? coinsCurrentAmount;
  int? consecutiveMonths;
  int? createtimestamp;
  List<int>? favProjs;
  String? firstname;
  int? lastMonthTree;
  String? lastname;
  int? lastwritetimestamp;
  Timestamp? prevMonthOfPurchase;
  String? selectedProjectId;
  String? selectedProjectTitle;
  int? selectedprojectnumber;
  int? totalMonths;
  int? totalTrees;
  int? treesThisMonth;

  // previous constructor based off of previous tutorial/guide
  // AppUser(
  //   this.coinsAllTime,
  //   this.coinsCurrentAmount,
  //   this.consecutiveMonths,
  //   this.createtimestamp,
  //   this.favProjs,
  //   this.firstname,
  //   this.lastMonthTree,
  //   this.lastname,
  //   this.lastwritetimestamp,
  //   this.prevMonthOfPurchase,
  //   this.selectedProjectId,
  //   this.selectedProjectTitle,
  //   this.selectedprojectnumber,
  //   this.totalMonths,
  //   this.totalTrees,
  //   this.treesThisMonth,
  // );

  // named constructor
  AppUser.fromMap(Map<String, dynamic> data) {
    coinsAllTime = data['coinsAllTime'];
    coinsCurrentAmount = data['coinsCurrentAmount'];
    consecutiveMonths = data['consecutiveMonths'];
    createtimestamp = data['createtimestamp'];
    favProjs = data['favProjs'];
    firstname = data['firstname'];
    lastMonthTree = data['lastMonthTree'];
    lastname = data['lastname'];
    lastwritetimestamp = data['lastwritetimestamp'];
    prevMonthOfPurchase = data['prevMonthOfPurchase'];
    selectedProjectId = data['selectedProjectId'];
    selectedProjectTitle = data['selectedProjectTitle'];
    selectedprojectnumber = data['selectedprojectnumber'];
    totalMonths = data['totalMonths'];
    totalTrees = data['totalTrees'];
    treesThisMonth = data['treesThisMonth'];
  }

  // previous function to retrieve/convert
  // factory AppUser.fromFirestore(DocumentSnapshot doc) {
  //   Map<String, dynamic> data = doc.data as Map<String, dynamic>;
  //   return AppUser(
  //       data['coinsAllTime'] ?? 0,
  //       data['coinsCurrentAmount'] ?? 0,
  //       data['consecutiveMonths'] ?? 0,
  //       data['createtimestamp'] ?? DateTime.now().millisecondsSinceEpoch,
  //       data['favProjs'] ?? [],
  //       data['firstname'] ?? '',
  //       data['lastMonthTree'] ?? 0,
  //       data['lastname'] ?? '',
  //       data['lastwritetimestamp'] ?? DateTime.now().millisecondsSinceEpoch,
  //       data['prevMonthOfPurchase'] ?? DateTime.now(),
  //       data['selectedProjectId'] ?? '',
  //       data['selectedProjectTitle'] ?? '',
  //       data['selectedprojectnumber'] ?? 0,
  //       data['totalMonths'] ?? 0,
  //       data['totalTrees'] ?? 0,
  //       data['treesThisMonth'] ?? 0);
  // }

}
