import 'package:citizenpower/AppHome.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'ProfilePage.dart';
import 'registration.dart';
import 'constants.dart';
import 'leader.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  var _formKey = GlobalKey<FormState>();
  String email = "citizentasmania@gmail.com";
  @override
  Widget build(BuildContext context) {
    //Start of widget tree
    return new Scaffold(
      backgroundColor: Colors.white,
      //Prevents pixels error
      resizeToAvoidBottomInset: false,
      appBar: topAppBarLayout('Citizen Power'),
      //Q: Any particular reason for using a stack rather than a column here? -Jack
      body: SafeArea(
        child: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Form(
              key: _formKey,
              child: new Theme(
                data: new ThemeData(
                  brightness: Brightness.light,
                ),
                child: new Container(
                  padding: const EdgeInsets.only(top: 25),
                  height: 160,
                  width: 100,
                  child: new Column(
                    children: <Widget>[
                      new TextFormField(
                        decoration: new InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 25.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0)),
                            hintStyle: TextStyle(color: Colors.white),
                            errorStyle: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 15.0,
                            ),
                            labelText: "Email",
                            hintText: "Enter Email address"),
                        keyboardType: TextInputType.emailAddress,
                        validator: (String val) {
                          if (val != (email)) {
                            return "Invalid email address";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          new TextFormField(
                            decoration: new InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              errorStyle: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 15,
                              ),
                              labelText: "Password",
                              hintText: "Insert password",
                            ),
                            keyboardType: TextInputType.text,
                            validator: (val) =>
                                val.length < 6 ? 'Invalid Password' : null,
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 80),
                      ),
                      Center(
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20.0),
                          color: darkGold,
                          child: new MaterialButton(
                              textColor: Colors.white,
                              child: new Text("LOGIN"),
                              onPressed: () {
                                if (_formKey.currentState.validate())
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AppHome()),
                                  );
                              }),
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                      ),
                      Center(
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20.0),
                          color: darkGold,
                          child: new MaterialButton(
                              textColor: Colors.white,
                              minWidth: 150,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.padded,
                              child: new Text("REGISTER"),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  // If the form is valid, display a Snackbar.
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text('Processing Data')));
                                }
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Registration()),
                                );
                              }),
                        ),
                      ),

                      //Contains Citizen logo in column
                      Center(
                        child: Container(
                          height: 200,
                          padding: EdgeInsets.only(top: 150),
                          child: new Text("Together We Stand"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
