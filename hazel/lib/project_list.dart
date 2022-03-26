// ignore_for_file: prefer_const_constructors
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

class _ProjListState extends State<ProjList> {
  SearchFilterProperties? whichFilter;
  User? currentUser;

  _ProjListState(this.currentUser, this.whichFilter);
  @override
  Widget build(BuildContext context) {
    if (whichFilter != null && whichFilter == SearchFilterProperties.sdg) {
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

      ///TO-DO: Fix counting to reload
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
