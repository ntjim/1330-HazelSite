// ignore_for_file: prefer_const_constructors
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hazel/nav_bar.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

import './home.dart';
import './nav_bar.dart';

import 'impact_cart.dart';
import 'impact_product_object.dart';

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

double totalPrice = 0.0;
List<Product> cartList = [];

class ImpactShopping extends StatefulWidget {
  const ImpactShopping({Key? key}) : super(key: key);

  @override
  _ImpactShoppingState createState() => _ImpactShoppingState();
}

class _ImpactShoppingState extends State<ImpactShopping> {
  List<Product> _bundleProducts = [];
  List<Product> _individualProducts = [];


  @override
  void initState() {
    super.initState();
    _populateProducts();
  }

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
            body: Center(
                child: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/forestroad.png'),
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
                        Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 100.0),
                            width: 750.0,
                            height: 550.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFF9F8F1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                            child: ListView(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 25.0,
                                      bottom: 5.0,
                                      left: 10.0,
                                      right: 10.0),
                                  child: Text(
                                    'Bundles',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 32,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                    ),
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
                                Container(
                                    height: 300.0,
                                    width: 400.0,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 200.0),
                                    child: _buildListView(_bundleProducts)),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 25.0,
                                      bottom: 5.0,
                                      left: 10.0,
                                      right: 10.0),
                                  child: Text(
                                    'Individual',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 32,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                    ),
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
                                Container(
                                    height: 300.0,
                                    width: 400.0,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 200.0),
                                    child: _buildListView(_individualProducts)),
                                Container(
                                  height: 40.0,
                                  width: 150.0,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 400.0),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFB9C24D),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                  child: OutlinedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Cart(cartList)));
                                      }, // should route to cart page
                                      child: const Text('CHECKOUT',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                          ))),
                                ),
                              ],
                            )),
                      ],
                    )))));
  }

  ListView _buildListView(List<Product> list) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          var item = list[index];
          return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 2.0,
              ),
              child: Card(
                  elevation: 2.0,
                  child: ListTile(
                      //leading: Icon(),
                      title: Text(item.imageText),
                      trailing: Wrap(
                        spacing: 20,
                        children: [
                          Text('\$${item.price}'),
                          GestureDetector(
                            child: (!cartList.contains(item))
                                ? Icon(
                                    Icons.add_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                  ),
                            onTap: () {
                              setState(() {
                                if (!cartList.contains(item)) {
                                  totalPrice += item.price;
                                  cartList.add(item);
                                } else {
                                  totalPrice -= item.price;
                                  cartList.remove(item);
                                }
                              });
                            },
                          )
                        ],
                      ))));
        });
  }

  void _populateProducts() {
    var _bundleList = <Product>[
      Product(
        productType: 'bundle',
        price: 13.99,
        imageText: '100% Impact',
      ),
      Product(
        productType: 'bundle',
        price: 18.99,
        imageText: '150% Impact',
      ),
      Product(
        productType: 'bundle',
        price: 34.99,
        imageText: '200% Impact',
      ),
      Product(
        productType: 'bundle',
        price: 45.99,
        imageText: '300% Impact',
      ),
    ];

    var individualList = <Product>[
      Product(
        productType: 'individual',
        price: 0.99,
        imageText: '1 Hour of Air Travel',
      ),
      Product(
        productType: 'individal',
        price: 3.99,
        imageText: '2 Hours of Air Travel',
      ),
      Product(
        productType: 'individual',
        price: 6.99,
        imageText: '3 Hours of Air Travel',
      ),
      Product(
        productType: 'individual',
        price: 9.99,
        imageText: '4 Hours of Air Travel',
      ),
    ];

    setState(() {
      _bundleProducts = _bundleList;
      _individualProducts = individualList;
    });
  }
}
