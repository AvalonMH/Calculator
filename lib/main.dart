import 'package:flutter/material.dart';

//flutter_app_calculator

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Calculator",
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: MyHomePage(title: "Calculator"));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //create text controllers
  final myTextController1 = TextEditingController();
  final myTextController2 = TextEditingController();
  final myTextController3 = TextEditingController();

//variables
  double num1 = 0.0;
  double num2 = 0.0;
  double ans = 0.0;

  int operation = -1;
  String myAns = "Answer";

  void MyMath() {
    num1 = double.parse(myTextController1.text);
    num2 = double.parse(myTextController2.text);

    if (operation == 1) {
      ans = num1 + num2;
    } else if (operation == 2) {
      ans = num1 - num2;
    } else if (operation == 3) {
      ans = num1 * num2;
    } else if (operation == 4) {
      ans = num1 / num2;
    }

    myTextController3.text = ans.toString();
  }

  @override
  void dispose() {
    myTextController1.dispose();
    myTextController2.dispose();
    myTextController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("My Calculator")),
        body: ListView(padding: EdgeInsets.all(20.0), children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("First Entry"),
                Container(
                    width: 100.0,
                    height: 30.0,
                    margin: EdgeInsets.all(20.0),
                    child: TextField(
                        enabled: true,
                        controller: myTextController1,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.orange[200],
                            hintText: "Enter a number",
                            hintStyle: TextStyle(fontSize: 10.0)
                        )
                    )
                )
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Second Entry"),
                Container(
                    width: 100.0,
                    height: 30.0,
                    margin: EdgeInsets.all(20.0),
                    child: TextField(
                        enabled: true,
                        controller: myTextController2,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.orange[200],
                            hintText: "Enter a number",
                            hintStyle: TextStyle(fontSize: 10.0)
                        )
                    )
                )
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(myAns),
                Container(
                    width: 100.0,
                    height: 30.0,
                    margin: EdgeInsets.all(20.0),
                    child: TextField(
                        enabled: false,
                        controller: myTextController3,
                        decoration: InputDecoration(
                            filled: true, fillColor: Colors.white)
                    )
                )
              ]),
          Row(children: <Widget>[
            Container(
                width: 60.0,
                height: 60.0,
                margin: EdgeInsets.all(5.0),
                child: FloatingActionButton(
                    backgroundColor: Colors.purple[900],
                    foregroundColor: Colors.white,
                    onPressed: () {
                      operation = 1;
                      MyMath();
                    },
                    child: Text("+",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)
                    )
                )
            ),
            Container(
                width: 60.0,
                height: 60.0,
                margin: EdgeInsets.all(5.0),
                child: FloatingActionButton(
                    backgroundColor: Colors.purple[900],
                    foregroundColor: Colors.white,
                    onPressed: () {
                      operation = 2;
                      MyMath();
                    },
                    child: Text("-",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)
                    )
                )
            ),
            Container(
                width: 60.0,
                height: 60.0,
                margin: EdgeInsets.all(5.0),
                child: FloatingActionButton(
                    backgroundColor: Colors.purple[900],
                    foregroundColor: Colors.white,
                    onPressed: () {
                      operation = 3;
                      MyMath();
                    },
                    child: Text("*",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)
                    )
                )
            ),
            Container(
                width: 60.0,
                height: 60.0,
                margin: EdgeInsets.all(5.0),
                child: FloatingActionButton(
                    backgroundColor: Colors.purple[900],
                    foregroundColor: Colors.white,
                    onPressed: () {
                      operation = 4;
                      MyMath();
                    },
                    child: Text("/",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)
                    )
                )
            ),
          ])
        ]
        )
    );
  }
}



