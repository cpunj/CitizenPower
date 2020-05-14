import 'package:flutter/material.dart';
import 'main.dart';
import 'ProfilePage.dart';
import 'registration.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: brightOrange,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Login",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      backgroundColor: coolGrey,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Form(
            key: _formKey,
            child: new Theme(
              data: new ThemeData(
                brightness: Brightness.dark,
              ),
              child: new Container(
                padding: const EdgeInsets.all(5.0),
                height: 160,
                width: 100,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new TextFormField(
                      decoration: new InputDecoration(
                          errorStyle: TextStyle(
                            color: Colors.yellowAccent,
                            fontSize: 15.0,
                          ),
                          labelText: "Email",
                          hintText: "Enter Email address"),
                      keyboardType: TextInputType.emailAddress,
                      validator: (String val) {
                        if (val.isEmpty) {
                          return "please Insert a valid Email address";
                        }
                        return null;
                      },
                    ),
                    new TextFormField(
                      decoration: new InputDecoration(
                        errorStyle: TextStyle(
                          color: Colors.yellowAccent,
                          fontSize: 15,
                        ),
                        labelText: "Password",
                        hintText: " Enter Password",
                      ),
                      keyboardType: TextInputType.text,
                      validator: (val) => val.length < 6
                          ? 'Insert Password/Incorrect Password'
                          : null,
                      obscureText: true,
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 20),
                    ),
                    new MaterialButton(
                        color: Colors.green,
                        textColor: Colors.black87,
                        child: new Text("LOGIN"),
                        onPressed: () {
                          if (_formKey.currentState.validate())
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileScreen()),
                            );
                        }),
                    new Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                    ),
                    new MaterialButton(
                        color: Colors.indigo,
                        textColor: Colors.tealAccent,
                        minWidth: 50,
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        child: new Text("SIGN UP/REGISTER"),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            // If the form is valid, display a Snackbar.
                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text('Processing Data')));
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Registration()),
                          );
                        }),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}