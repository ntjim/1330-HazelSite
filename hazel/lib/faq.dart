// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

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

class FaqPage extends StatefulWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  //bool _tileExpanded = false;

  @override
  Widget build(BuildContext context) {
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
              color: Colors.lime[50], //page background color
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // Back button
                        padding:
                            EdgeInsets.only(left: 25.0, top: 15.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                            ),
                            iconSize: 20,
                            color: Colors.grey,
                            splashColor: Colors.purple,
                            onPressed: () {
                              locator<NavigationService>()
                                  .navigateTo(AccountRoute);
                            },
                          ),
                        ),
                      ),
                      // Page title
                      Expanded(
                        child: Align(
                          alignment: Alignment(-0.08, 0.0),
                          child: Padding(
                              padding: EdgeInsets.only(top: 50.0, bottom: 20.0),
                              child: Text(
                                "Frequently Asked Questions",
                                style: TextStyle(
                                    color: Colors.teal[900],
                                    fontSize: 36.0,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                    ],
                  ),
                  // Question 1
                  ExpansionTile(
                    title: Text('How does Hazel work?',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        )),
                    children: [
                      ListTile(
                          title: Text(
                              'Hazel is designed to be a simple way for you to have an impact on climate change, without needing to understand the details of climate science or calculate difficult metrics.',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ))),
                      ListTile(
                        title: Text(
                          'In Hazel, you pick your project, pick your impact and watch your metrics grow!',
                          style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                          ))),
                    ],
                  ),
                  // Question 2
                  ExpansionTile(
                    title: Text('What does ‘picking a project’ mean?',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        )),
                    children: [
                      ListTile(
                          title: Text(
                              'Hazel has multiple hand-selected carbon removal projects that we’ve partnered with, all of which directly remove carbon from the atmosphere. Your starting point is picking which project you want to support–maybe it’s a reforestation project in the northeastern US, or a conservation project in south Asia? Whichever you decide to support, your money is making the maximum climate impact.',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ))),
                      ListTile(
                          title: Text(
                              'Can’t decide? Select “Support All Projects” to fund all of them!',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ))),
                    ],
                  ),
                  // Question 3
                  ExpansionTile(
                    title: Text('What does ‘picking an impact’ mean?',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        )),
                    children: [
                      ListTile(
                          title: Text(
                              'Once you’ve selected the project you want to support, pick what type of climate impact you want to make. Maybe you want to eliminate the negative climate impact of a specific action, like buying a tank of gas or flying across the country? Or maybe you want to fund the equivalent of an average consumer’s monthly impact on the planet?  You can pick any of these–and other ways to have an impact–in Hazel!',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ))),
                    ],
                  ),
                  // Question 4
                  ExpansionTile(
                    title: Text('How does Hazel select projects?',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        )),
                    children: [
                      ListTile(
                          title: Text(
                              'In partnership with our scientific advisory board, we’ve hand-picked the projects that are listed in Hazel for their carbon impact per dollar–maximizing your carbon impact. All of our projects are monitored and verified by third party bodies, and their carbon removal work is done to standards set forth by the United Nations and others. When you make a purchase through Hazel, you can be assured of the impact you’re making. ',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ))),
                      ListTile(
                        title: Text(
                          'Hazel’s goal is to have a wide diversity of types of projects, so whether you’re interested in reforestation efforts, farming work, conservation, ocean projects or more cutting edge projects, we’ll have a top project in that category for you. Every month we’re adding new projects!',
                          style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                          ))),
                    ],
                  ),
                  // Question 5
                  ExpansionTile(
                    title: Text(
                        'Aren’t carbon offsets just paying someone not to pollute? Why should I buy that?',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        )),
                    children: [
                      ListTile(
                          title: Text(
                              'It’s true, there are offsets that are basically paying someone not to release carbon dioxide into the atmosphere. Called “Avoidance Offsets”, they make up 90%+ of the offset market. The classic example are landfill gas capture projects. Trash, as it decomposes in landfills, releases lots of nasty stuff–including carbon monoxide, a particularly bad greenhouse gas. Some landfills employ technologies that capture these gasses, which enables them to generate these avoidance offsets, which they can sell to fund their capture work. ',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ))),
                    ],
                  ),
                  // Question 6
                  ExpansionTile(
                    title: Text(
                        'I’ve read about carbon footprints. Shouldn’t I be worried about that?',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        )),
                    children: [
                      ListTile(
                          title: Text(
                              'Many of our competitors are fixed on making you feel guilty for living a modern lifestyle. Once you feel bad, they then make you calculate how much carbon you produce every month (this is your carbon footprint), and then they try to sell you offsets to eliminate your footprint. We think that all of that is unnecessary, and you probably have enough to be worried and feel guilty about without us adding to it! If you’re reading this, you’re a good person! You care enough about the climate to read the FAQs! You want to make a difference – and that’s what we’re here to help with!',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ))),
                      ListTile(
                          title: Text(
                            'Instead of worrying about some made-up number, just pick how you want to help the climate. Maybe you want to eliminate the 3 tanks of gas you buy each month– that’s wonderful! We’re here to empower you to do that!  However you want to help solve climate change, we love and support. It’s totally up to you–we’re just here to make it easy for you to do so.',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ))),
                    ],
                  ),
                  // Question 7
                  ExpansionTile(
                    title: Text(
                        'I have a great idea for a new feature, or I want to tell you about a project you should support. How do I reach out?',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        )),
                    children: [
                      ListTile(
                          title: Text(
                              'We’d love to hear from you! Email us – info@412technology.com. We read every email we get!',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ))),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
