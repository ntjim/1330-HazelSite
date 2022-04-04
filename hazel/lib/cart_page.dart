// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import './routing/route_names.dart';
import './locator.dart';
import './navigation_service.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
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

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            color: Colors.lime[50], // page background color
          ),
          child: ListView(
            children: [
              Container(
                // Cart page return button box
                margin: EdgeInsets.only(top: 20.0),
                height: 1000.0,
                width: 1023.0,
                color: Colors.transparent,
                child: Container(
                  margin: EdgeInsets.only(left: 100.0, right: 100.0),
                  decoration: BoxDecoration(
                      color: Colors.lime[50], //box 1 background color
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Align(
                    alignment: Alignment.center,
                    child: ListView(children: [
                      Container(
                        // Continue Shopping
                        padding: EdgeInsets.only(top: 15.0, right: 15.0),
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
                              locator<NavigationService>()
                                  .navigateTo(ImpactRoute);
                            },
                          ),
                        ),
                      ),
                      Container(
                        // Shopping Cart
                        padding: EdgeInsets.only(top: 15.0, right: 15.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 330.0,
                            child: Padding(
                              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                              child: Text(
                                "Shopping Cart",
                                style: TextStyle(
                                    color: Colors.teal[900],
                                    fontSize: 30,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                          // Shopping Cart description
                          margin: EdgeInsets.only(left: 50.0, right: 20.0),
                          child: Column(
                            children: [
                              Container(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(bottom: 10.0),
                                      child: Text(
                                        "Description",
                                        style: TextStyle(color: Colors.black),
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(
                                          top: 10.0, bottom: 10.0, left: 100),
                                      child: Text(
                                        "Quantity",
                                        style: TextStyle(color: Colors.black),
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(
                                          top: 10.0, bottom: 10.0, right: 60.0),
                                      child: Text(
                                        "Price",
                                        style: TextStyle(color: Colors.black),
                                      ))
                                ],
                              )),
                              Divider(color: Colors.black),
                              Container(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(
                                          top: 30.0, bottom: 30.0),
                                      child: Column(children: [
                                        Text(
                                          "150% impact",
                                          style: TextStyle(
                                              color: Color(0xFF1B4223),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Lorem ipsum dolor sit amet,",
                                          style: TextStyle(
                                              color: Color(0xFF1B4223)),
                                        ),
                                      ])),
                                  Container(
                                      margin: EdgeInsets.only(
                                          top: 30.0, bottom: 30.0, left: 50),
                                      child: Text(
                                        "1",
                                        style: TextStyle(color: Colors.black),
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(
                                          top: 30.0, bottom: 30.0, right: 60.0),
                                      child: Text(
                                        "\$18.99",
                                        style:
                                            TextStyle(color: Color(0xFF1B4223)),
                                      )),
                                ],
                              )),
                              Divider(color: Colors.black),
                              Container(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(
                                          top: 30.0, bottom: 30.0),
                                      child: Column(children: [
                                        Text(
                                          "2-hour Air Travel",
                                          style: TextStyle(
                                              color: Color(0xFF1B4223),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Lorem ipsum dolor sit amet,",
                                          style: TextStyle(
                                              color: Color(0xFF1B4223)),
                                        ),
                                      ])),
                                  Container(
                                      margin: EdgeInsets.only(
                                          top: 30.0, bottom: 30.0, left: 50),
                                      child: Text(
                                        "1",
                                        style: TextStyle(color: Colors.black),
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(
                                          top: 30.0, bottom: 30.0, right: 60.0),
                                      child: Text(
                                        "\$3.99",
                                        style:
                                            TextStyle(color: Color(0xFF1B4223)),
                                      )),
                                ],
                              )),
                              Divider(color: Colors.black),
                              Container(
                                height: 100,
                                width: 1200,
                                alignment: Alignment.centerLeft,
                                child: PurchaseRadioList(),
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
                                              fontWeight: FontWeight.bold),
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
                                                        FontWeight.bold),
                                              )),
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(
                                                top: 10.0,
                                                bottom: 10.0,
                                                left: 30.0,
                                                right: 30.0),
                                            child: Text(
                                              "\$22.98",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
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
                                                    color: Colors.white),
                                              )),
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(
                                                top: 10.0,
                                                bottom: 10.0,
                                                left: 30.0,
                                                right: 30.0),
                                            child: Text(
                                              "14,000",
                                              textAlign: TextAlign.right,
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
                                                    color: Colors.white),
                                              )),
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(
                                                top: 10.0,
                                                bottom: 30.0,
                                                left: 30.0,
                                                right: 30.0),
                                            child: Text(
                                              "4",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            )),
                                      ],
                                    ),
                                    Container(
                                        height: 45.0,
                                        width: 190.0,
                                        margin: EdgeInsets.only(bottom: 30),
                                        decoration: BoxDecoration(
                                            color: Color(0xFFB9C24D),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25.0))),
                                        child: OutlinedButton(
                                            child: const Text('CHECK OUT',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontFamily: 'Roboto',
                                                )),
                                            onPressed: () {}))
                                  ]))
                            ],
                          )),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum PurchaseRadioListProperties { one, two }

class PurchaseRadioList extends StatefulWidget {
  const PurchaseRadioList({Key? key}) : super(key: key);

  @override
  _PurchaseRadioListState createState() => _PurchaseRadioListState();
}

class _PurchaseRadioListState extends State<PurchaseRadioList> {
  PurchaseRadioListProperties? _selectedPurchase =
      PurchaseRadioListProperties.one;

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.all(15.0),
      height: 270,
      width: 470,
      color: Colors.transparent,
      child: Container(
          child: Column(
        children: [
          RadioListTile<PurchaseRadioListProperties>(
            title: const Text("One-Time Purchase: \$22.98",
                style: TextStyle(color: Colors.black)),
            value: PurchaseRadioListProperties.one,
            groupValue: _selectedPurchase,
            activeColor: Color(0xFFB9C24D),
            onChanged: (PurchaseRadioListProperties? value) {
              setState(() {
                _selectedPurchase = value;
              });
            },
            toggleable: true,
          ),
          RadioListTile<PurchaseRadioListProperties>(
            title: const Text("Monthly Purchase: \$22.98/month",
                style: TextStyle(color: Colors.black)),
            value: PurchaseRadioListProperties.two,
            groupValue: _selectedPurchase,
            activeColor: Color(0xFFB9C24D),
            onChanged: (PurchaseRadioListProperties? value) {
              setState(() {
                _selectedPurchase = value;
              });
            },
            toggleable: true,
          ),
        ],
      )),
    );
  }
}
