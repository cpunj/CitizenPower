import 'package:flutter/material.dart';
import 'constants.dart';

//hello
class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: brightOrange,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Register ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: new Stack(
        children: <Widget>[
          new Form(
            child: new Theme(
              data: new ThemeData(
                brightness: Brightness.light,
              ),
              child: new Container(
                padding: const EdgeInsets.all(10.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      margin: EdgeInsets.all(5),
                      color: ashGrey,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                        child: new TextFormField(
                          decoration: new InputDecoration(
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              labelText: " First Name ",
                              hintText: "Enter Your first name "),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.all(5),
                      color: ashGrey,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                        child: new TextFormField(
                          decoration: new InputDecoration(
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              labelText: " Last Name ",
                              hintText: "Enter Last name "),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.all(5),
                      color: ashGrey,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                        child: new TextFormField(
                          decoration: new InputDecoration(
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              labelText: "Email/phone",
                              hintText: "Enter Email address"),
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if (val.isEmpty) {
                              return "please insert valid email";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.all(5),
                      color: ashGrey,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                        child: new TextFormField(
                          decoration: new InputDecoration(
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            labelText: "Enter Password",
                            hintText: " Password",
                          ),
                          keyboardType: TextInputType.text,
                          validator: (val) =>
                              val.length < 6 ? 'Please Insert password' : null,
                          obscureText: true,
                        ),
                      ),
                    ),
                    new Padding(padding: const EdgeInsets.only(top: 10.0)),
                    Flex(direction: Axis.horizontal),
                    new MaterialButton(
                        color: darkGold,
                        textColor: Colors.white,
                        child: new Text("SUBMIT"),
                        onPressed: () {})
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
