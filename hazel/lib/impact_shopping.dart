// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import 'impact_cart.dart';
import 'impact_product_object.dart';
import './routing/route_names.dart';
import './navigation_bar.dart';
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

double totalPrice = 0.0;
int totalCoins = 0;
double totalTrees = 0.0;

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
    return Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Image.asset('assets/Google@3x.png'),
                onPressed: () {
                  locator<NavigationService>().navigateTo(HomeRoute);
                },
              );
            },
          ),
          centerTitle: false,
          title: Text("Hazel", style: TextStyle(color: Colors.white)),
          actions: <Widget>[NaviBar()],
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
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
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
                              'How much climate impact do you want to have?',
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              child: OutlinedButton(
                                  onPressed: () {
                                    // TODO: edit to nav service after fixing params errors
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
                ))));
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
                                  totalCoins += item.coins;
                                  totalTrees += item.trees;
                                  cartList.add(item);
                                } else {
                                  totalPrice -= item.price;
                                  totalCoins -= item.coins;
                                  totalTrees -= item.trees;
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
        price: 11.99,
        imageText: '75% Impact',
        coins: 4000,
        trees: 4.0,
      ),
      Product(
        productType: 'bundle',
        price: 19.99,
        imageText: '100% Impact',
        coins: 8800,
        trees: 5.5,
      ),
      Product(
        productType: 'bundle',
        price: 29.99,
        imageText: '150% Impact',
        coins: 13560,
        trees: 8.0,
      ),
      Product(
        productType: 'bundle',
        price: 49.99,
        imageText: '200% Impact',
        coins: 23090,
        trees: 13.5,
      ),
    ];

    var individualList = <Product>[
      Product(
        productType: 'individual',
        price: 8.49,
        imageText: '1 Hour of Air Travel',
        coins: 3090,
        trees: 2.25,
      ),
      Product(
        productType: 'individal',
        price: 25.99,
        imageText: '6 Hours of Air Travel',
        coins: 11770,
        trees: 7.5,
      ),
      Product(
        productType: 'individual',
        price: 74.99,
        imageText: '15 Hours of Air Travel',
        coins: 34590,
        trees: 23,
      ),
    ];

    setState(() {
      _bundleProducts = _bundleList;
      _individualProducts = individualList;
    });
  }
}
