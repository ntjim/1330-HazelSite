// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import './locator.dart';
import './navigation_service.dart';
import './project_search.dart';
import './routing/route_names.dart';

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

enum SearchFilterProperties {
  sdg,
  conservation,
  lessThanXFunded,
  greaterThanXFunded,
  noFilter,
}

class SearchFilter extends StatefulWidget {
  const SearchFilter({Key? key}) : super(key: key);

  @override
  _SearchFilterState createState() => _SearchFilterState();
}

SearchFilterProperties? selectedFilter = SearchFilterProperties.noFilter;

class _SearchFilterState extends State<SearchFilter> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showFilters,
      child: Container(
        height: 270,
        width: 470,
        color: Colors.transparent,
        child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(218, 249, 248, 241),
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
                  child: Text(
                    'Search Filters',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                FilterRadioTile('SDG 4', SearchFilterProperties.sdg),
                FilterRadioTile('Conservation Projects',
                    SearchFilterProperties.conservation),
                FilterRadioTile(
                    '<x% Funded', SearchFilterProperties.lessThanXFunded),
                TextButton(
                    onPressed: () {
                      setState(() {
                        showFilters = !showFilters;
                        showSearchResult = false;
                      });
                      locator<NavigationService>()
                          .navigateTo(ProjectSearchRoute);
                    },
                    child: const Text('Update',
                        style: TextStyle(
                          color: Color(0xFFB9C24D),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ))),
              ],
            )),
      ),
    );
  }
}

class FilterRadioTile extends StatefulWidget {
  final String title;
  final SearchFilterProperties value;

  FilterRadioTile(this.title, this.value);
  @override
  _FilterRadioTileState createState() => _FilterRadioTileState(title, value);
}

class _FilterRadioTileState extends State<FilterRadioTile> {
  String title;
  SearchFilterProperties value;

  _FilterRadioTileState(this.title, this.value);
  @override
  Widget build(BuildContext context) {
    return RadioListTile<SearchFilterProperties>(
      title: Text(title),
      value: value,
      groupValue: selectedFilter,
      onChanged: (SearchFilterProperties? filter) {
        setState(() {
          selectedFilter = filter;
        });
      },
      toggleable: true,
    );
  }
}
