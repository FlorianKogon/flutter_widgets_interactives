import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //Items needed for switch
  bool interruptor;

  //Items needed for radiobuttons
  int itemSelected;

  List<Widget> radios() {
    List<Widget> l = [];
    for(int x = 0; x < 4; x++) {
      Row row = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Choix numéro : ${x + 1} '),
          Radio(value: x,
              groupValue: itemSelected,
              onChanged: (int i) {
                setState(() {
                  itemSelected = i;
                });
              }
          ),
        ],
      );
      l.add(row);
    }
    return l;
  }

  //Items needed for textfield
  String changed;
  String submitted;

  //Items needed for checkboxes
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
            // SWTICH
            /*
            children: [
              Text("Aimez-vous flutter ?"),
              Switch(value: interruptor,
                inactiveTrackColor: Colors.red,
                activeColor: Colors.green,
                onChanged: (bool b) {
                  setState(() {
                    interruptor = b;
                  });
              })
            ],
             */
            // RADIOBUTTONS
            //children: radios(),
            // CHECKBOXES
            //children: checkList(),
            /*
            TEXTFIELD
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