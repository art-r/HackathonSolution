import 'package:flutter/material.dart';

//stellt die aktuellen aufträge für das jeweilige restaurant dar -> ListViewBuilder, fast gleich wie lieferantlist

class LieferantList extends StatefulWidget {
  @override
  _LieferantListState createState() => _LieferantListState();
}

class _LieferantListState extends State<LieferantList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Active deliveries'),
        centerTitle: true,
      ),
      body: Container(child: Text('Test')),
      floatingActionButton: FloatingActionButton(
        child: Center(
            child: Text('+',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 25.0))),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.00),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Enter destination:',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: 'Target'),
                      ),
                      Text(
                        'Maximum number of reroutings:',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),
                      ),
                      MyStatefulWidget(), //DropDownButton, siehe Class unten
                      FlatButton.icon(
                        onPressed: () {
                          Navigator.of(context).maybePop();
                        },
                        icon: Icon(Icons.delivery_dining),
                        label: Text('finish'),
                        color: Colors.grey,
                        splashColor: Colors.blueGrey,
                      )
                    ],
                  ),
                );
              });
        },
        tooltip: 'increment',
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.blueGrey),
      underline: Container(
        height: 2,
        color: Colors.blueGrey,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['One', 'Two', 'Three', 'Four', 'Five']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
