import 'package:citizenpower/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String email = "";
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  "A link will be sent to your emails address to reset your password..",
                  style: TextStyle(fontSize: 20),
                ),
                Theme(
                  data: ThemeData(
                    hintColor: Colors.orangeAccent,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "please enter your Email address";
                        } else {
                          email = value;
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  BorderSide(color: Colors.orange, width: 1))),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),

                  child: RaisedButton(
                    
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        FirebaseAuth.instance
                            .sendPasswordResetEmail(email: email)
                            .then((value) => ThankYou());
                      }
                    },
                    color: darkGold,
                    child: Text("Send Email"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
ThankYou() {
  print(
      "Thank You. A Mail has been sent to your Email. Please check your Email");
}
