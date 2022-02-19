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
}
