// ignore_for_file: prefer_const_constructors
import 'dart:math';

import 'package:flutter/material.dart';

import 'impact_product_object.dart';
import 'impact_shopping.dart';
import './routing/route_names.dart';
import './locator.dart';
import './navigation_service.dart';

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

class Cart extends StatefulWidget {
  final List<Product> _cart;

  Cart(this._cart);

  @override
  _CartState createState() => _CartState(this._cart);
}

class _CartState extends State<Cart> {
  _CartState(this._cart);

  List<Product> _cart;
  double cartTotalPrice = totalPrice;
  int cartTotalCoins = totalCoins;
  double cartTotalTrees = totalTrees;
  String roundedTotal = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
                child: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(
                      color: Colors.lime[50], // page background color
                    ),
                    child: ListView(children: [
                      Container(
                          // Cart page return button box
                          margin: EdgeInsets.only(top: 20.0),
                          height: 1000.0,
                          width: 1023.0,
                          color: Colors.transparent,
                          child: Container(
                              margin:
                                  EdgeInsets.only(left: 100.0, right: 100.0),
                              decoration: BoxDecoration(
                                  color:
                                      Colors.lime[50], //box 1 background color
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: ListView(
                                    children: [
                                      Container(
                                        // Continue Shopping
                                        padding: EdgeInsets.only(
                                            top: 15.0, right: 15.0),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.arrow_back_ios,
                                            ),
                                            iconSize: 20,
                                            color: Colors.grey,
                                            splashColor: Colors.purple,
                                            onPressed: () {
                                              setState(() {
                                                if (_cart.isEmpty) {
                                                  cartTotalPrice = 0.0;
                                                  totalPrice = 0.0;
                                                  totalCoins = 0;
                                                  totalTrees = 0.0;
                                                }
                                              });
                                              locator<NavigationService>()
                                                  .navigateTo(ImpactRoute);
                                            },
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // Shopping Cart
                                        padding: EdgeInsets.only(
                                            top: 15.0, right: 15.0),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            width: 330.0,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10.0, bottom: 10.0),
                                              child: Text(
                                                "Shopping Cart",
                                                style: TextStyle(
                                                    color: Colors.teal[900],
                                                    fontSize: 30,
                                                    fontFamily: 'Roboto',
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 300,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15.0, horizontal: 100.0),
                                        child: _buildCartList(),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(
                                              left: 30.0,
                                              right: 30.0,
                                              top: 50.0,
                                              bottom: 50.0),
                                          width: 400.0,
                                          decoration: BoxDecoration(
                                              color: Color(0xFF70762C),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0))),
                                          child: Column(children: [
                                            Container(
                                                margin: EdgeInsets.only(
                                                    top: 30.0, bottom: 10.0),
                                                child: Text(
                                                  "Summary",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          top: 10.0,
                                                          bottom: 10.0,
                                                          left: 30.0,
                                                          right: 30.0),
                                                      child: Text(
                                                        "Total",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        top: 10.0,
                                                        bottom: 10.0,
                                                        left: 30.0,
                                                        right: 30.0),
                                                    child: Text(
                                                      "\$${cartTotalPrice.toStringAsFixed(2)}",
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          top: 10.0,
                                                          bottom: 10.0,
                                                          left: 30.0,
                                                          right: 30.0),
                                                      child: Text(
                                                        "Hazel Coins Earned",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        top: 10.0,
                                                        bottom: 10.0,
                                                        left: 30.0,
                                                        right: 30.0),
                                                    child: Text(
                                                      "$cartTotalCoins",
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    )),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          top: 10.0,
                                                          bottom: 30.0,
                                                          left: 30.0,
                                                          right: 30.0),
                                                      child: Text(
                                                        "Hazel Trees Earned",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        top: 10.0,
                                                        bottom: 30.0,
                                                        left: 30.0,
                                                        right: 30.0),
                                                    child: Text(
                                                      "$cartTotalTrees",
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    )),
                                              ],
                                            ),
                                            Container(
                                                height: 45.0,
                                                width: 190.0,
                                                margin:
                                                    EdgeInsets.only(bottom: 30),
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFB9C24D),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                25.0))),
                                                child: OutlinedButton(
                                                    child: const Text(
                                                        'CHECK OUT',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontFamily: 'Roboto',
                                                        )),
                                                    onPressed: () {}))
                                          ]))
                                    ],
                                  ))))
                    ])))));
  }

  ListView _buildCartList() {
    return ListView.builder(
        itemCount: _cart.length,
        itemBuilder: (context, index) {
          var item = _cart[index];
          return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
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
                            child: Icon(
                              Icons.remove_circle,
                              color: Colors.red,
                            ),
                            onTap: () {
                              setState(() {
                                cartTotalPrice -= item.price;
                                cartTotalCoins -= item.coins;
                                cartTotalTrees -= item.trees;
                                _cart.remove(item);
                              });
                            })
                      ],
                    )),
              ));
        });
  }
}
