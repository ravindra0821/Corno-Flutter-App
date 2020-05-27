import 'package:flutter/material.dart';
import 'package:flutterlearningapp/home_page.dart';
import 'package:flutterlearningapp/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                color: Colors.blue,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.59,
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.3),
                  child: Container(
                    margin: EdgeInsets.only(top: 70.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Enter your username')),
                        TextFormField(
                            decoration: InputDecoration(labelText: 'Password')),
                        SizedBox(
                          height: 20.0,
                        ),
                        RaisedButton(
                          color: Colors.yellow,
                          child: Text("Submit",
                              style: TextStyle(color: Colors.blue)),
                          onPressed: () {

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePageScreen()),
                            );

                          },
                        ),
                      ],
                    ),
                  )),
              Center(
                child: Card(
                  color: Colors.yellow,
                  elevation: 8,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .25),
                  child: Container(
                    child: Center(
                        child: Text(
                      "Radhe",
                      style: TextStyle(color: Colors.blue, fontSize: 20.0),
                    )),
                    height: MediaQuery.of(context).size.height * .1,
                    width: MediaQuery.of(context).size.width * .3,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
