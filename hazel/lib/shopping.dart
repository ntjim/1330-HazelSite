// ignore_for_file: prefer_const_constructors
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hazel/cart_page.dart';
import 'package:hazel/nav_bar.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

import './home.dart';
import './user_settings.dart';
import './me_page.dart';
import './login_valid.dart';
import './nav_bar.dart';
import './project_page.dart';

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

class Product {
  String id;
  int coincount;
  String header;
  String description;
  String imageicon;
  String imagetext;
  double price;
  String productType;
  int productlineOrder;
  bool showProduct;
  int treecount;

  Product({
    this.id = '',
    this.coincount = 0,
    this.header = '',
    this.description = '',
    this.imageicon = '',
    this.imagetext = '',
    this.price = 0,
    this.productType = '',
    this.productlineOrder = 0,
    this.showProduct = false,
    this.treecount = 0,
  });
}

class Shopping extends StatefulWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Roboto',
          primarySwatch: navColor,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text("Hazel", style: TextStyle(color: Colors.white)),
              actions: <Widget>[NavBar()],
            ),
            body: Center(
                child: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('forestroad.png'),
                            fit: BoxFit.cover)),
                    child: ListView(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 25.0, bottom: 5.0),
                            child: Text(
                              'Individual Impact',
                              style: TextStyle(
                                  color: Color(0xFFF9F8F1),
                                  fontSize: 80,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            )),

                        // Container(
                        //   margin: EdgeInsets.all(12.0),
                        //   height: 500,
                        //   width: 500,
                        //   color: Color(0xFFF9F8F1),
                        //   child: ProductList(),
                        // ),

                        Container(
                          margin: EdgeInsets.all(20.0),
                          height: 1000,
                          width: 1000,
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              Bundle(),
                              SizedBox(
                                height: 15.0,
                                width: 100.0,
                              ),
                              Individual(),
                              SizedBox(
                                height: 15.0,
                                width: 100.0,
                              ),
                              Container(
                                height: 60.0,
                                width: 150.0,
                                decoration: BoxDecoration(
                                    color: Color(0xFFB9C24D),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CartPage()));
                                    }, // should route to cart page
                                    child: Text('CHECKOUT',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800,
                                        ))),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )))));
  }
}

// Seperation of bundles and individual product types
enum impactAmount { impact100, impact150, impact200, impact300 }

class Bundle extends StatefulWidget {
  const Bundle({Key? key}) : super(key: key);

  @override
  _BundleState createState() => _BundleState();
}

class _BundleState extends State<Bundle> {
  impactAmount? _selectedFilter;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0),
        height: 300.0,
        width: 750.0,
        //color: Color(0xFFF9F8F1),
        decoration: BoxDecoration(
            color: Color(0xFFF9F8F1),
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Bundle',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore...',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),

            // Products hard-coded in ...
            SizedBox(
              height: 30.0,
              width: 300.0,
              child: RadioListTile(
                title: const Text('100% Impact               \$13.99'),
                value: impactAmount.impact100,
                groupValue: _selectedFilter,
                onChanged: (impactAmount? value) {
                  setState(() {
                    _selectedFilter = value;
                  });
                },
                toggleable: true,
              ),
            ),
            SizedBox(
              height: 30.0,
              width: 300.0,
              child: RadioListTile(
                title: const Text('150% Impact               \$22.99'),
                value: impactAmount.impact150,
                groupValue: _selectedFilter,
                onChanged: (impactAmount? value) {
                  setState(() {
                    _selectedFilter = value;
                  });
                },
                toggleable: true,
              ),
            ),
            SizedBox(
              height: 30.0,
              width: 300.0,
              child: RadioListTile(
                title: const Text('200% Impact               \$34.99'),
                value: impactAmount.impact200,
                groupValue: _selectedFilter,
                onChanged: (impactAmount? value) {
                  setState(() {
                    _selectedFilter = value;
                  });
                },
                toggleable: true,
              ),
            ),
            SizedBox(
              height: 30.0,
              width: 300.0,
              child: RadioListTile(
                title: const Text('300% Impact               \$45.99'),
                value: impactAmount.impact300,
                groupValue: _selectedFilter,
                onChanged: (impactAmount? value) {
                  setState(() {
                    _selectedFilter = value;
                  });
                },
                toggleable: true,
              ),
            ),
          ],
        ));
  }
}

enum airTravel { hour1, hour2, hour3 }

class Individual extends StatefulWidget {
  const Individual({Key? key}) : super(key: key);

  @override
  _IndividualState createState() => _IndividualState();
}

class _IndividualState extends State<Individual> {
  airTravel? _selectedFilter;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0),
        height: 400.0,
        width: 750.0,
        //color: Color(0xFFF9F8F1),
        decoration: BoxDecoration(
            color: Color(0xFFF9F8F1),
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 8.0),
              child: Text(
                'Individual',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore...',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 500.0,
              child: ExpansionTile(
                title: Text('Air Travel (round trip)'),
                children: [
                  RadioListTile(
                    title: const Text('1 Hour \$0.99'),
                    value: airTravel.hour1,
                    groupValue: _selectedFilter,
                    onChanged: (airTravel? value) {
                      setState(() {
                        _selectedFilter = value;
                      });
                    },
                    toggleable: true,
                  ),
                  RadioListTile(
                    title: const Text('2 Hours \$3.99'),
                    value: airTravel.hour2,
                    groupValue: _selectedFilter,
                    onChanged: (airTravel? value) {
                      setState(() {
                        _selectedFilter = value;
                      });
                    },
                    toggleable: true,
                  ),
                  RadioListTile(
                    title: const Text('3 Hours \$6.99'),
                    value: airTravel.hour3,
                    groupValue: _selectedFilter,
                    onChanged: (airTravel? value) {
                      setState(() {
                        _selectedFilter = value;
                      });
                    },
                    toggleable: true,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class GettingData {
  List productList = [];
  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection("products");

  Future getData() async {
    try {
      await collectionRef.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          productList.add(result.data());
        }
      });

      return productList;
    } catch (e) {
      debugPrint("Error = $e");
      return null;
    }
  }
}

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List dataList = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GettingData().getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text(
              "Something went wrong...",
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            dataList = snapshot.data as List;

            return buildItems(dataList);
          }

          return Center(child: CircularProgressIndicator());
        });
  }
}

Widget buildItems(dataList) => ListView.separated(
      padding: const EdgeInsets.all(8.0),
      itemCount: dataList.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          tileColor: Color(0xFFF9F8F1),
          selectedTileColor: Color(0xFFF9F8F1),
          title: Text(
            dataList[index]['imagetext'],
          ),
          subtitle: Text(
            dataList[index]['header'],
          ),
        );
      },
    );
