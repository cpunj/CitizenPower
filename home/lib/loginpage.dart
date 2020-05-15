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
  @override
  Widget build(BuildContext context) {
    //Start of widget tree
    return new Scaffold(
      backgroundColor: Colors.white,
      //Prevents pixels error
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: brightOrange,
        iconTheme: IconThemeData(color: Colors.black),
        //Move around title as wanted, I think this looks best - Jack
        title: Center(
          child: Text(
            "Citizen Power",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
      //Q: Any particular reason for using a stack rather than a column here? -Jack
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Form(
            key: _formKey,
            child: new Theme(
              data: new ThemeData(
                brightness: Brightness.light,
              ),
              child: new Container(
                padding: const EdgeInsets.all(5.0),
                height: 160,
                width: 100,
                child: new Column(
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
                    Center(
                      child: new MaterialButton(
                          color: darkGold,
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
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                    ),
                    Center(
                      child: new MaterialButton(
                          color: darkGold,
                          textColor: Colors.black,
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
                        height: 320,
                        padding: EdgeInsets.only(top:30),
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
    );
  }
}
