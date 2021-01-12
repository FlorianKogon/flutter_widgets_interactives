import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String changed;
  String submitted;

  Map check = {
    "Carottes" : false,
    "Bananes" : false,
    "Navets" : false,
    "Poireaux" : false,
    "Pommes" : false,
  };

  List<Widget> checkList() {
    List<Widget> l = [];
    check.forEach((key, value) {
      Row row = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(key),
          Checkbox(
            value: value,
            onChanged: (bool b) {
              setState(() {
                check[key] = b;
              });
            },
          ),
        ],
      );
      l.add(row);
    });
    return l;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: checkList(),
            /*
            TextField(
              keyboardType: TextInputType.text,
              onChanged: (String string) {
                setState(() {
                  changed = string;
                });
              },
              onSubmitted: (String string) {
                setState(() {
                  submitted = string;
                });
              },
              decoration: InputDecoration(
                  labelText: "Entrez votre nom"
              ),
            ),
            Text(changed ?? ''),
            Text(submitted ?? ''),
          ),*/
          ),
        ),
      ),
    );
  }
}