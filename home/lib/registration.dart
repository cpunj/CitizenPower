import 'package:citizenpower/loginpage.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  User user = User();
  GlobalKey<FormState> _formKey = GlobalKey();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  save() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.pass,
      );
    }
  }

  final emailcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final mobilecontroller = TextEditingController();
  final passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            "Registration Page",
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
                  padding: const EdgeInsets.all(30.0),
                  height: 160,
                  width: 100,
                  child: new Column(
                    children: <Widget>[
                      new TextFormField(
                          decoration: new InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              hintStyle: TextStyle(color: Colors.white),
                              errorStyle: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 15.0,
                              ),
                              labelText: "Name",
                              hintText: "Enter your name"),
                          onSaved: (text) => user.name = text),
                      Padding(padding: const EdgeInsets.only(top: 30.0)),
                      new TextFormField(
                          decoration: new InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              hintStyle: TextStyle(color: Colors.white),
                              errorStyle: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 15.0,
                              ),
                              labelText: "Phone",
                              hintText: "Enter your Phone Number"),
                          onSaved: (text) => user.mobile = text),
                      Padding(padding: const EdgeInsets.only(top: 30.0)),
                      new TextFormField(
                          decoration: new InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              hintStyle: TextStyle(color: Colors.white),
                              errorStyle: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 15.0,
                              ),
                              labelText: "Email",
                              hintText: "Enter Email address"),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (text) => user.email = text),
                      Padding(padding: const EdgeInsets.only(top: 30.0)),
                      new TextFormField(
                        decoration: new InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
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
                        onSaved: (text) => user.pass = text,
                        validator: (val) =>
                            val.length < 6 ? 'Invalid Password' : null,
                        obscureText: true,
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 30),
                      ),

                      Center(
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20.0),
                          color: darkGold,
                          child: new MaterialButton(
                            textColor: Colors.white,
                            minWidth: 50,
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                            child: new Text("REGISTER"),
                            onPressed: save,
                          ),
                        ),
                      ),

                      //Contains Citizen logo in column
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

class User {
  String email;
  String name;
  String mobile;
  String pass;
  User({
    this.email,
    this.name,
    this.mobile,
    this.pass,
  });
}

/*
class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: brightOrange,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Register ",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      backgroundColor: coolGrey,
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
                          labelText: " First Name ",
                          hintText: "Enter Your first name "),
                      keyboardType: TextInputType.text,
                    ),
                    new TextFormField(
                      decoration: new InputDecoration(
                          labelText: " Last Name ",
                          hintText: "Enter Last name "),
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
                        color: darkGold,
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

 */
