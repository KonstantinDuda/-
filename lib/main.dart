import 'package:flutter/material.dart';
import 'package:journal/MyDialog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Журнал событий'),
      // initialRoute: '/',
      // routes: {
      //   '/': (BuildContext context) => MyJournal(),
      //   '/Calendar': (BuildContext context) => MyCalendar()),
      // },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        title: Text(widget.title),
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
