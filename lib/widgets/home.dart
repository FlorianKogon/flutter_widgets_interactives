import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //Items needed for datepicker
  DateTime date;
  TimeOfDay time;

  //Items needed for slider
  double sliderDouble = 0.0;

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
            children: [
              FlatButton(
                onPressed: showDate,
                child: Text(date == null ? 'Cliquez ici' : date.toString())),
              FlatButton(
                onPressed: showTime,
                child: Text(time == null ? 'Cliquez ici' : time.toString()))
            ],
            //SLIDER
            /*
            children: [
              Text("Valeur du slider = $sliderDouble"),
              Slider(
                divisions: 10,
                inactiveColor: Colors.grey,
                activeColor: Colors.green,
                value: sliderDouble,
                min: 0.0,
                max: 10.0,
                onChanged: (double d) {
                  setState(() {
                    sliderDouble = d;
                  });
                })
            ],
             */
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

  Future<Null> showDate() async {
    DateTime choice = await showDatePicker(
        context: context,
        initialDatePickerMode: DatePickerMode.year,
        initialDate: DateTime.now(),
        firstDate: DateTime(1980),
        lastDate: DateTime(2045));
    if (choice != null) {
      setState(() {
        date = choice;
      });
    }
  }

  Future<Null> showTime() async {
    TimeOfDay hour = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now());
    if (hour != null) {
      setState(() {
        time = hour;
      });
    }
  }
}