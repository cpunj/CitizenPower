import 'package:citizenpower/controllers/login_controller.dart';
import 'package:citizenpower/databaseServices/database.dart';
import 'package:citizenpower/databaseServices/helper_functions.dart';
import 'package:citizenpower/views/loginViews/forgot_password.dart';
import 'package:citizenpower/text_styles.dart';
import 'package:citizenpower/views/genericWidgets/generic_layouts.dart';
import 'package:citizenpower/views/homeViews/homeDashboardView/app_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'registration.dart';
import '../../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

LoginController loginController = LoginController();

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //Stores the email data the user enters for login
  final emailController = TextEditingController();
  //Stores the password data the user enters for login
  final passController = TextEditingController();
  //Contains all database functions
  ProfileDatabaseMethods databaseMethods = new ProfileDatabaseMethods();
  //Intended store logging user's snapshot and use to store dat in Shared Preferences
  QuerySnapshot userSnapshot;

  @override
  Widget build(BuildContext context) {
    //Start of widget tree
    return new Scaffold(
      backgroundColor: Colors.white,
      //Prevents pixels error
      resizeToAvoidBottomInset: false,
      appBar: topAppBarLayout("Electnow"),
      //Q: Any particular reason for using a stack rather than a column here? -Jack
      body: SafeArea(
        child: new Stack(fit: StackFit.expand, children: <Widget>[
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
                                EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0)),
                            hintStyle: TextStyle(color: Colors.white),
                            errorStyle: errorTextStyle1(),
                            labelText: "Email",
                            hintText: "Enter Email address"),
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) {
                          if (val.isEmpty ||
                              !val.contains('@') ||
                              !val.contains('.') ||
                              val.length < 8) {
                            return "Please enter a valid email";
                          }
                          return null;
                        }),
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
                          controller: passController,
                          validator: (val) =>
                              val.length < 6 ? 'Invalid Password' : null,
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ForgotPasswordScreen()));
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.red),
                          ),
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
                            minWidth: 120,
                            child: new Text("LOGIN"),
                            onPressed: () {
                              loginController.signIn(context, _formKey,
                                  emailController.text, passController.text);
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
                            minWidth: 120,
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
                    ),
                    //Contains Citizen logo
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
          ),
        ]),
      ),
    );
  }
}
