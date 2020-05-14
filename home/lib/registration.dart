import 'package:flutter/material.dart';


//hello
class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Register ",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.blueGrey,
      body: new Stack(
        children: <Widget>[
          new Form(
            child: new Theme(
              data: new ThemeData(
                brightness: Brightness.dark,
              ),
              child: new Container(
                padding: const EdgeInsets.all(10.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new TextFormField(
                      decoration: new InputDecoration(
                          labelText: "Name ",
                          hintText: "Enter Your Full name "),
                      keyboardType: TextInputType.text,
                    ),
                    new TextFormField(
                      decoration: new InputDecoration(
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
                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Enter Password",
                        hintText: " Password",
                      ),
                      keyboardType: TextInputType.text,
                      validator: (val) =>
                          val.length < 6 ? 'Please Insert password' : null,
                      obscureText: true,
                    ),
                    new Padding(padding: const EdgeInsets.only(top: 10.0)),
                    Flex(direction: Axis.horizontal),
                    new MaterialButton(
                        color: Colors.tealAccent,
                        textColor: Colors.black,
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
