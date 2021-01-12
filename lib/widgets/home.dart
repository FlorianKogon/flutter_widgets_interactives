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
            children: [
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
              Text(submitted ?? '')
            ],
          ),
        ),
      ),
    );
  }
}