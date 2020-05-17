import 'package:citizenpower/AppHome.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'ProfilePage.dart';
import 'registration.dart';
import 'constants.dart';

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
      appBar: AppBar(
        backgroundColor: brightOrange,
        iconTheme: IconThemeData(color: Colors.white),
        //Move around title as wanted, I think this looks best - Jack
        title: Center(
          child: Text(
            "Citizen Power",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
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
                  padding: const EdgeInsets.all(10.0),
                  height: 160,
                  width: 100,
                  child: new Column(
                    children: <Widget>[
                      Card(
                        margin: EdgeInsets.all(5.0),
                        color: ashGrey,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                          child: new TextFormField(
                            decoration: new InputDecoration(
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
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 20),
                      ),
                      Center(
                        child: new MaterialButton(
                            color: darkGold,
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
                      new Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                      ),
                      Center(
                        child: new MaterialButton(
                            color: darkGold,
                            textColor: Colors.white,
                            minWidth: 50,
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                            child: new Text("REGISTER"),
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
                      ),

                      //Contains Citizen logo in column
                      Center(
                        child: Container(
                          height: 200,
                          padding: EdgeInsets.only(top: 30),
                          child: Image(
                            image: AssetImage('assets/CitizenLogo.png'),
                          ),
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
