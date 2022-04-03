import './nav_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';

import 'firebase_options.dart';

import './home.dart';
import './user_settings.dart';
import './nav_bar.dart';

class TestMePage extends StatefulWidget {
  const TestMePage({Key? key, required this.projNum}) : super(key: key);
  final int projNum;

  @override
  _TestMePageState createState() => _TestMePageState(projNum);
}

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

class _TestMePageState extends State<TestMePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore fireDb = FirebaseFirestore.instance;
  int projNum = 0;

  _TestMePageState(projNum);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Roboto',
          primarySwatch: navColor,
        ),
        home: Scaffold(
          appBar: AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Image.asset('assets/Google@3x.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                    //Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            title: Text("Hazel", style: TextStyle(color: Colors.white)),
            actions: <Widget>[NavBar()],
          ),
          body: Test_Me_page(projNum: projNum),
        ));
  }
}

Future<Map<String, dynamic>> getProjectData(int projNum) async {
  QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
      .instance
      .collection('projects')
      .where('projectnumber', isEqualTo: projNum)
      .get();
  return snapshot.docs[0].data();
}

class Test_Me_page extends StatelessWidget {
  const Test_Me_page({Key? key, required this.projNum});
  final int projNum;

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore fireDb = FirebaseFirestore.instance;
    String? uid = auth.currentUser?.uid;
    User? currentUser = auth.currentUser;

    return FutureBuilder<Map<String, dynamic>>(
        future: getProjectData(projNum),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.hasError) {
            return CircularProgressIndicator();
          } else if (!snapshot.hasData) {
            return Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator());
          } else {
            return Center(
                child: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(
                      color: Colors.lime[50], //page background color
                    ),
                    child: ListView(
                      children: [
                        Container(
                            //Me page user info box
                            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                            height: 300.0,
                            width: 1100.0,
                            color: Colors.transparent,
                            child: Container(
                              margin:
                                  EdgeInsets.only(left: 100.0, right: 100.0),
                              decoration: BoxDecoration(
                                  color:
                                      Colors.lime[50], //box 1 background color
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Center(
                                            child: Container(
                                                width: 330.0,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 25.0,
                                                      bottom: 15.0,
                                                      left: 60),
                                                  child: CircleAvatar(
                                                    //Profile Avatar
                                                    backgroundImage: AssetImage(
                                                        'assets/Google@3x.png'),
                                                    radius: 50,
                                                  ),
                                                ))),
                                      ),
                                      Container(
                                        //Settings button
                                        padding: EdgeInsets.only(
                                            top: 15.0, right: 15.0),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.settings_outlined,
                                            ),
                                            iconSize: 20,
                                            color: Colors.grey,
                                            splashColor: Colors.purple,
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        UserSettings()),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    child: //Profile name below profile picture
                                        Container(
                                            child: StreamBuilder(
                                                stream: fireDb
                                                    .collection('users')
                                                    .doc(uid)
                                                    .snapshots(),
                                                builder: (BuildContext context,
                                                    AsyncSnapshot<
                                                            DocumentSnapshot>
                                                        snapshot) {
                                                  if (!snapshot.hasData) {
                                                    return Container(
                                                        width: 330.0,
                                                        child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 5.0,
                                                                    bottom:
                                                                        5.0),
                                                            child: Text(
                                                              "",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                          .teal[
                                                                      900],
                                                                  fontSize: 15,
                                                                  fontFamily:
                                                                      'Roboto'),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            )));
                                                  }
                                                  return Column(
                                                    children: [
                                                      Container(
                                                          width: 330.0,
                                                          child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 5.0,
                                                                      bottom:
                                                                          15.0),
                                                              child: Text(
                                                                "${snapshot.data!['firstname']}",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                            .teal[
                                                                        900],
                                                                    fontSize:
                                                                        15,
                                                                    fontFamily:
                                                                        'Roboto'),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ))),
                                                      Container(
                                                          width: 500.0,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 10.0,
                                                                    bottom:
                                                                        15.0),
                                                            child: Text(
                                                              "${snapshot.data!['coinsCurrentAmount']}",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 30,
                                                                  fontFamily:
                                                                      'Roboto'),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          )),
                                                      Container(
                                                          child: Text(
                                                        //For time joined
                                                        "Hazel Coins",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .green[900],
                                                            fontSize: 15,
                                                            fontFamily:
                                                                'Roboto'),
                                                        textAlign:
                                                            TextAlign.center,
                                                      )),
                                                      Container(
                                                          child: Text(
                                                        //For time joined
                                                        "Get Coins ->",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors
                                                                .lime[600],
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'Roboto'),
                                                        textAlign:
                                                            TextAlign.center,
                                                      )),
                                                    ],
                                                  );
                                                })),
                                  ),
                                ],
                              ),
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                            height: 350.0,
                            width: 400.0,
                            color: Colors.transparent,
                            child: Container(
                                margin:
                                    EdgeInsets.only(left: 100.0, right: 100.0),
                                decoration: BoxDecoration(
                                    color: Colors.teal[900], //box 2 color
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Center(
                                    child: ListView(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 15.0, left: 15.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Your Impact",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontFamily: 'Roboto')),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.white,
                                    ),
                                    Container(
                                      child: //Current Amount of coins
                                          Container(
                                              child: StreamBuilder(
                                                  stream: fireDb
                                                      .collection('users')
                                                      .doc(uid)
                                                      .snapshots(),
                                                  builder: (BuildContext
                                                          context,
                                                      AsyncSnapshot<
                                                              DocumentSnapshot>
                                                          snapshot) {
                                                    if (!snapshot.hasData) {
                                                      return Container(
                                                          width: 330.0,
                                                          child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 5.0,
                                                                      bottom:
                                                                          5.0),
                                                              child: Text(
                                                                "",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                            .teal[
                                                                        900],
                                                                    fontSize:
                                                                        15,
                                                                    fontFamily:
                                                                        'Roboto'),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              )));
                                                    }
                                                    return Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Column(
                                                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 15.0,
                                                                      left:
                                                                          15.0),
                                                            ),
                                                            Text(
                                                                "${snapshot.data!['treesThisMonth']}",
                                                                //'263',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        40,
                                                                    fontFamily:
                                                                        'Roboto')),
                                                            Text(
                                                                'Hazel Trees earned \nthis month',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        15,
                                                                    fontFamily:
                                                                        'Roboto')),
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 15.0,
                                                                      left:
                                                                          15.0),
                                                            ),
                                                            Text(
                                                                "${snapshot.data!['totalTrees']}",
                                                                //'1,394',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        40,
                                                                    fontFamily:
                                                                        'Roboto')),
                                                            Text(
                                                                'Hazel Trees earned \n to date',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        15,
                                                                    fontFamily:
                                                                        'Roboto')),
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 15.0,
                                                                      left:
                                                                          15.0),
                                                            ),
                                                            Row(
                                                              children: [
                                                                //check amount to decide which arrow direction to use
                                                                Container(
                                                                    child: (int.parse("${snapshot.data!['treesThisMonth'] - snapshot.data!['lastMonthTree']}") >
                                                                            0)
                                                                        ? Icon(
                                                                            Icons.arrow_upward_rounded,
                                                                            color:
                                                                                Colors.lime[600],
                                                                          )
                                                                        : Icon(
                                                                            Icons.arrow_downward_rounded,
                                                                            color:
                                                                                Colors.red,
                                                                          )),
                                                                //check amount to decide if it needs to be multiplied
                                                                Container(
                                                                    child: (int.parse("${snapshot.data!['treesThisMonth'] - snapshot.data!['lastMonthTree']}") >
                                                                            0)
                                                                        ? Text(
                                                                            "${snapshot.data!['treesThisMonth'] - snapshot.data!['lastMonthTree']}",
                                                                            style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: 40,
                                                                                fontFamily: 'Roboto'))
                                                                        : Text((int.parse("${snapshot.data!['treesThisMonth'] - snapshot.data!['lastMonthTree']}") * -1).toString(), style: TextStyle(color: Colors.white, fontSize: 40, fontFamily: 'Roboto'))),
                                                              ],
                                                            ),
                                                            Text(
                                                                'vs Last Month',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        15,
                                                                    fontFamily:
                                                                        'Roboto')),
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 15.0,
                                                                      left:
                                                                          15.0),
                                                            ),
                                                            Text(
                                                                "${snapshot.data!['consecutiveMonths']}",
                                                                //'5',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        40,
                                                                    fontFamily:
                                                                        'Roboto')),
                                                            Text('Month Streak',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        15,
                                                                    fontFamily:
                                                                        'Roboto')),
                                                          ],
                                                        )
                                                      ],
                                                    );
                                                  })),
                                    ),
                                    SizedBox(height: 85.0),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 15.0, bottom: 15.0),
                                        child: TextButton(
                                          //button
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.lime[600]),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    side: BorderSide(
                                                        color: Colors
                                                            .transparent))),
                                            fixedSize:
                                                MaterialStateProperty.all(
                                                    const Size(300, 40)),
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            'EARN MORE TREES',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                                fontFamily: 'Roboto'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )))),
                        Container(
                            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                            height: 350.0,
                            width: 400.0,
                            color: Colors.transparent,
                            child: Container(
                                margin:
                                    EdgeInsets.only(left: 100.0, right: 100.0),
                                decoration: BoxDecoration(
                                    color: Colors.blue[800], //box 3 color
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Center(
                                    child: ListView(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 15.0, left: 15.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Community Impact",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontFamily: 'Roboto')),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.white,
                                    ),
                                    Container(
                                      child: //Current Amount of coins
                                          Container(
                                              child: StreamBuilder(
                                                  stream: fireDb
                                                      .collection('users')
                                                      .doc(uid)
                                                      .snapshots(),
                                                  builder: (BuildContext
                                                          context,
                                                      AsyncSnapshot<
                                                              DocumentSnapshot>
                                                          snapshot) {
                                                    if (!snapshot.hasData) {
                                                      return Container(
                                                          width: 330.0,
                                                          child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 5.0,
                                                                      bottom:
                                                                          5.0),
                                                              child: Text(
                                                                "",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                            .teal[
                                                                        900],
                                                                    fontSize:
                                                                        15,
                                                                    fontFamily:
                                                                        'Roboto'),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              )));
                                                    }
                                                    return Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Text('834',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        40,
                                                                    fontFamily:
                                                                        'Roboto')),
                                                            Text(
                                                                'New Community \nmembers in the \nlast 30 days',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        15,
                                                                    fontFamily:
                                                                        'Roboto')),
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 15.0,
                                                                      right:
                                                                          15.0),
                                                            ),
                                                            //SizedBox(width: 300.0),
                                                            Text('8',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        40,
                                                                    fontFamily:
                                                                        'Roboto')),
                                                            Text(
                                                                'Number of Friends \n'
                                                                "you've"
                                                                ' invited to date',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        15,
                                                                    fontFamily:
                                                                        'Roboto')),
                                                          ],
                                                        )
                                                      ],
                                                    );
                                                  })),
                                    ),
                                    SizedBox(height: 75.0),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                          'The more the merrier. Invite your friends to increase',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontFamily: 'Roboto')),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                          'your '
                                          "community's"
                                          ' impact.',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontFamily: 'Roboto')),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 15.0, bottom: 15.0),
                                        child: TextButton(
                                          //button
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.lime[600]),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    side: BorderSide(
                                                        color: Colors
                                                            .transparent))),
                                            fixedSize:
                                                MaterialStateProperty.all(
                                                    const Size(300, 40)),
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            'INVITE MORE FRIENDS',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                                fontFamily: 'Roboto'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )))),
                        Container(
                            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                            height: 350.0,
                            width: 400.0,
                            color: Colors.transparent,
                            child: Container(
                                margin:
                                    EdgeInsets.only(left: 100.0, right: 100.0),
                                decoration: BoxDecoration(
                                    color: Colors.lime[900], //box 4 color
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Center(
                                    child: ListView(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 15.0, left: 15.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Projects You Support",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontFamily: 'Roboto')),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 5.0),
                                    Container(
                                      child: //Current Amount of coins
                                          Container(
                                              child: StreamBuilder(
                                                  stream: fireDb
                                                      .collection('users')
                                                      .doc(uid)
                                                      .snapshots(),
                                                  builder: (BuildContext
                                                          context,
                                                      AsyncSnapshot<
                                                              DocumentSnapshot>
                                                          snapshot) {
                                                    if (!snapshot.hasData) {
                                                      return Container(
                                                          width: 330.0,
                                                          child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 5.0,
                                                                      bottom:
                                                                          5.0),
                                                              child: Text(
                                                                "",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                            .teal[
                                                                        900],
                                                                    fontSize:
                                                                        15,
                                                                    fontFamily:
                                                                        'Roboto'),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              )));
                                                    }
                                                    return Stack(
                                                      children: [
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Image.asset(
                                                              'assets/sc-delta-web.jpg',
                                                              height: 200,
                                                              width: 1200,
                                                              fit: BoxFit
                                                                  .fitWidth),
                                                        ),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 100,
                                                                  right: 100,
                                                                  top: 10),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                  child: Text(
                                                                "${snapshot.data!['title']}",
                                                                //"${snapshot.data!['selectedprojectnumber']}",
                                                                //' Conservation: Southern Cardamom',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
                                                                    fontFamily:
                                                                        'Roboto'),
                                                              )),
                                                              // Text(
                                                              //   //"${snapshot.data!['selectedprojectnumber']}"
                                                              //   ' Conservation: Southern Cardamom',
                                                              //   style: TextStyle(
                                                              //       color: Colors
                                                              //           .white,
                                                              //       fontSize:
                                                              //           20,
                                                              //       fontFamily:
                                                              //           'Roboto'),
                                                              // ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    'Learn More',
                                                                    style: TextStyle(
                                                                        color: Colors.lime[
                                                                            600],
                                                                        fontSize:
                                                                            20,
                                                                        fontFamily:
                                                                            'Roboto'),
                                                                  ),
                                                                  Icon(
                                                                    Icons
                                                                        .arrow_forward_rounded,
                                                                    color: Colors
                                                                            .lime[
                                                                        600],
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  })),
                                    ),
                                    //SizedBox(height: 20.0),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 15.0, bottom: 15.0),
                                        child: TextButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.lime[600]),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    side: BorderSide(
                                                        color: Colors
                                                            .transparent))),
                                            fixedSize:
                                                MaterialStateProperty.all(
                                                    const Size(300, 40)),
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            'SEE ALL PROJECTS',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                                fontFamily: 'Roboto'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))))
                      ],
                    )));
          }
        });
  }

  // getProjectData(int projNum) async {
  //   QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
  //       .instance
  //       .collection('projects')
  //       .where('projectnumber', isEqualTo: projNum)
  //       .get();
  //   return snapshot.docs[0].data();
  // }

// getProjectData(int projectNum) async {
//   QuerySnapshot querySnapshot =
//       await FirebaseFirestore.instance.collection("projects").get();
//   var project_list = querySnapshot.docs.toList();

//   for (int i = 0; i < project_list.length; i++) {
//     if (project_list[i].get('projectnumber') == projectNum) {
//       return project_list[i].get("title");
//     } else {
//       continue;
//     }
//   }
//   //print(project_list);
// }
}
