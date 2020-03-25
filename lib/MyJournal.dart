import 'package:flutter/material.dart';
import 'package:journal/MyDialog.dart';
import 'package:journal/MyElement.dart';

class MyJournal extends StatefulWidget {
  MyJournal({
    Key key,
    /*this.title*/
  }) : super(key: key);

  //final String title;

  @override
  _MyJournalState createState() => _MyJournalState();
}

class _MyJournalState extends State<MyJournal> {
  int counter = 0;
  List<MyElement> myElement = [];

  addElement(String value) {
    counter++;
    var hour = DateTime.now().hour.toString();
    var minute = DateTime.now().minute.toString();
    var nowTime = hour + " : " + minute;
    var year = DateTime.now().year;
    var month = DateTime.now().month;

    MyElement newElement = new MyElement(
      id: counter,
      time: nowTime, //DateTime.now().hour.toString(),
      text: value,
    );
    myElement.add(newElement);
  }

  heightCalculate(String value) {
    if (value.length > 100)
      return 100.0;
    else
      return 50.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Журнал"),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
              child: Expanded(
                  child: Container(
                      child: ListView.builder(
            itemCount: myElement.length,
            itemBuilder: (context, index) {
              return Container(
                height: heightCalculate(myElement[index].text),
                child: Card(
                  child: Row(
                    children: <Widget>[
                      Text(myElement[index].time.toString()),
                      Text(myElement[index].text),
                    ],
                  ),
                ),
              );
            },
          )))),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)),
                      color: Colors.blue,
                      child: Text("Шаблоны"),
                      onPressed: () async {
                        String value = await Navigator.push(
                            context,
                            PageRouteBuilder(
                                opaque: false,
                                pageBuilder: (context, _, __) => MyDialog()));
                        if (value != '') {
                          setState(() {
                            addElement(value);
                          });
                        }
                      }),
                ),
              ),
              Expanded(child: Container(),),
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
                          setState(() {
                            addElement(value);
                          });
                        }
                      }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
