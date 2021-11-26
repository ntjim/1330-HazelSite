import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Lora'),
        home: Scaffold(
            appBar: AppBar(title: Text('Set Full Screen Background Image')),
            body: Center(
                child: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/sc-delta-web.jpg'),
                            fit: BoxFit.cover)),
                    child: ListView(
                      children: [
                        Align(
                            alignment: Alignment(0.0, -0.9),
                            child: Text('Hazel',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 130,
                                    fontFamily: 'Lora'))),
                        Align(
                            alignment: Alignment(0.0, -0.85),
                            child: Text('Reversing Climate Change',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w100))),
                        Container(
                          margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          height: 200.0,
                          width: 400.0,
                          color: Colors.transparent,
                          child: Container(
                              margin:
                                  EdgeInsets.only(left: 100.0, right: 100.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: Center(
                                  child: Column(
                                children: [
                                  Center(
                                      child: Container(
                                          width: 330.0,
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 15.0, bottom: 15.0),
                                              child: Text(
                                                "Reduce your climate anxiety. Start reversing climate change today.",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 30,
                                                    fontFamily: 'Roboto'),
                                                textAlign: TextAlign.center,
                                              )))),
                                  Container(
                                      height: 30.0,
                                      width: 190.0,
                                      decoration: BoxDecoration(
                                          color: Colors.lightGreen[400],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0))),
                                      child: Center(
                                        child: Text(
                                          "DOWNLOAD APP",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily: 'Roboto'),
                                          textAlign: TextAlign.center,
                                        ),
                                      ))
                                ],
                              ))),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                            height: 200.0,
                            width: 400.0,
                            color: Colors.transparent,
                            child: Container(
                                margin:
                                    EdgeInsets.only(left: 100.0, right: 100.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Center(
                                    child: Wrap(
                                  alignment: WrapAlignment.center,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.0, right: 10.0),
                                        child: Text(
                                          '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "\n-- Hazel user',
                                          style: TextStyle(
                                              color: Colors.lightGreen[300],
                                              fontSize: 25,
                                              fontFamily: 'Roboto'),
                                          textAlign: TextAlign.center,
                                        ))
                                  ],
                                )))),
                        Container(
                            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                            height: 200.0,
                            width: 400.0,
                            color: Colors.transparent,
                            child: Container(
                                margin:
                                    EdgeInsets.only(left: 100.0, right: 100.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Center(
                                    child: ListView(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 15.0),
                                      child: Center(
                                        child: Text("ABOUT US",
                                            style: TextStyle(
                                                color: Colors.green[900],
                                                fontSize: 30,
                                                fontFamily: 'Roboto')),
                                      ),
                                    ),
                                    ExpansionTile(
                                        title: Text('What is Hazel?',
                                            style: TextStyle(
                                                color: Colors.lightGreen[300],
                                                fontSize: 22,
                                                fontFamily: 'Roboto')),
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15.0,
                                                  right: 10.0,
                                                  bottom: 10.0),
                                              child: Wrap(
                                                children: [
                                                  Text(
                                                      "An app that allows users to offset their carbon footprint by contributing to projects and have fun while doing so.",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontFamily: 'Roboto'))
                                                ],
                                              ))
                                        ]),
                                    ExpansionTile(
                                        title: Text('Why Hazel?',
                                            style: TextStyle(
                                                color: Colors.lightGreen[300],
                                                fontSize: 22,
                                                fontFamily: 'Roboto')),
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15.0,
                                                  right: 10.0,
                                                  bottom: 10.0),
                                              child: Wrap(
                                                children: [
                                                  Text(
                                                      "No calculators. No guessing. No complicated climate science. Hazel has calculated how much each of us would need to fund to start reversing global carbon levels - and climate change - today.",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontFamily: 'Roboto'))
                                                ],
                                              ))
                                        ]),
                                  ],
                                ))))
                      ],
                    )))));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
