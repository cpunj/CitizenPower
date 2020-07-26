import 'package:citizenpower/loginpage.dart';
import 'package:flutter/material.dart';
import 'Layouts/GenericLayouts.dart';
import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'TextStyles.dart';
import 'database.dart';

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
      appBar: topAppBarLayout('Registration Page'),
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
                          decoration: textFormDec(
                              label: 'Name', hint: 'Enter your name'),
                          onSaved: (text) => user.name = text),
                      Padding(padding: const EdgeInsets.only(top: 30.0)),
                      new TextFormField(
                          decoration: textFormDec(
                              label: 'Phone', hint: 'Enter your phone number'),
                          onSaved: (text) => user.mobile = text),
                      Padding(padding: const EdgeInsets.only(top: 30.0)),
                      new TextFormField(
                          decoration: textFormDec(
                              label: 'Email', hint: 'Enter your email address'),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (text) => user.email = text),
                      Padding(padding: const EdgeInsets.only(top: 30.0)),
                      new TextFormField(
                        decoration: textFormDec(
                            label: 'Password', hint: 'Enter password'),
                        keyboardType: TextInputType.text,
                        onSaved: (text) => user.pass = text,
                        validator: (val) => val.length < 6
                            ? 'Password should be longer than 6 characters'
                            : null,
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
                              materialTapTargetSize:
                                  MaterialTapTargetSize.padded,
                              child: new Text("REGISTER"),
                              onPressed: () {
                                save();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              }),
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
