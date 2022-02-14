import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  int? coinsAllTime;
  int? coinsCurrentAmount;
  int? consecutiveMonths;
  int? createtimestamp;
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

  AppUser(
    int coinsAllTime,
    int coinsCurrentAmount,
    int consecutiveMonths,
    int createtimestamp,
    String firstname,
    int lastMonthTree,
    String lastname,
    int lastwritetimestamp,
    Timestamp prevMonthOfPurchase,
    String selectedProjectId,
    String selectedProjectTitle,
    int selectedprojectnumber,
    int totalMonths,
    int totalTrees,
    int treesThisMonth,
  ) {
    this.coinsAllTime = coinsAllTime;
    this.coinsCurrentAmount = coinsCurrentAmount;
    this.consecutiveMonths = consecutiveMonths;
    this.createtimestamp = createtimestamp;
    this.firstname = firstname;
    this.lastMonthTree = lastMonthTree;
    this.lastname = lastname;
    this.lastwritetimestamp = lastwritetimestamp;
    this.prevMonthOfPurchase = prevMonthOfPurchase;
    this.selectedProjectId = selectedProjectId;
    this.selectedProjectTitle = selectedProjectTitle;
    this.selectedprojectnumber = selectedprojectnumber;
    this.totalMonths = totalMonths;
    this.totalTrees = totalTrees;
    this.treesThisMonth = treesThisMonth;
  }
}
