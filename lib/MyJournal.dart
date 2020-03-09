import 'package:flutter/material.dart';
import 'package:journal/MyDialog.dart';

class MyJournal extends StatefulWidget {
  MyJournal({Key key, /*this.title*/}) : super(key: key);

  //final String title;

  @override
  _MyJournalState createState() => _MyJournalState();
}

class _MyJournalState extends State<MyJournal> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Журнал"),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Вы можете нажать на эту кнопку, для вызова диалогового окна',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            ),
          ),
          // Дальше написано повидение кнопки и его вид
          Container(
            margin: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.centerRight,
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                  color: Colors.blue,
                  child: Icon(Icons.add),
                  onPressed: () async {
                    String value = await Navigator.push(
                        context,
                        PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (context, _, __) => MyDialog()));
                    if (value != '') {
                      _incrementCounter();
                    }
                  }),
            ),
          )
        ],
      ),
    );
  }
}