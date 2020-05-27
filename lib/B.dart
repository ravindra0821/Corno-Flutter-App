import 'package:flutter/material.dart';

import 'Fields.dart';


class B extends StatefulWidget{

  Fields bean;

  B ({Key key, @required this.bean}) : super(key: key); ////YOU WILL GET THE DATA HERE FROM THE CONSTRUCTOR , AND USE IT INSIDE THE CLASS LIKE "widget.bean"

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
     return _B ();

  }

}

class _B extends State<B> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: 'Screen A',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.red,
          accentColor: Color(0xFFFEF9EB),
        ),
        home: Scaffold(
            appBar: new AppBar(),
            body: Container(
              margin: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text("Screen B" ,style: TextStyle(fontSize: 20.0),),
                    )
                  ),
                   Text("Rating=>>>  ${widget.bean.rating}  and Title ${widget.bean.title} ")
                ],
              ),
            )));
  }
}
