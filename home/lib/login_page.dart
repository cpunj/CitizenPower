import 'package:citizenpower/app_home.dart';
import 'package:citizenpower/databaseServices/database.dart';
import 'package:citizenpower/databaseServices/helperfunctions.dart';
import 'package:citizenpower/text_styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'registration.dart';
import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

//Adding this to master branch #1

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  ProfileDatabaseMethods databaseMethods = new ProfileDatabaseMethods();
  QuerySnapshot userSnapshot;
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
                    padding: const EdgeInsets.only(top: 25),
                    height: 160,
                    width: 100,
                    child: new Column(children: <Widget>[
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
                          GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                          child: Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 16, horizontal: 16),
                                              height: 250,
                                              child: Column(children: <Widget>[
                                                Text("Reset Password For...",
                                                    style: TextStyle(
                                                        fontSize: 20.0),
                                                    textAlign:
                                                        TextAlign.center),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 28,
                                                      horizontal: 16),
                                                  child: new TextFormField(
                                                      decoration: new InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets.fromLTRB(
                                                                  15.0,
                                                                  10.0,
                                                                  15.0,
                                                                  10.0),
                                                          border: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0)),
                                                          hintStyle: TextStyle(
                                                              color: Colors
                                                                  .white),
                                                          errorStyle:
                                                              errorTextStyle1(),
                                                          labelText: "Email",
                                                          hintText:
                                                              "Enter Email address"),
                                                      controller:
                                                          emailController,
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      validator: (val) {
                                                        if (val.isEmpty ||
                                                            !val.contains(
                                                                '@') ||
                                                            !val.contains(
                                                                '.') ||
                                                            val.length < 8) {
                                                          return "Please enter a valid email";
                                                        }
                                                        return null;
                                                      }),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 16,
                                                      horizontal: 16),
                                                  child: new MaterialButton(
                                                      color: darkGold,
                                                      textColor: Colors.white,
                                                      child: new Text("Reset"),
                                                      onPressed: () {
                                                        //TODO: firebase function for reset password
                                                      }),
                                                ),
                                              ])));
                                    });
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(color: Colors.red),
                              )),
                          new Padding(
                            padding: const EdgeInsets.only(top: 80),
                          ),
                          Center(
                            child: Material(
                              elevation: 5.0,
                              borderRadius: BorderRadius.circular(40.0),
                              color: darkGold,
                              child: new MaterialButton(
                                  textColor: Colors.white,
                                  minWidth: 150,
                                  child: new Text("LOGIN"),
                                  onPressed: () {
                                    signIn();
                                  }),
                            ),
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                          ),
                          Center(
                            child: Material(
                              elevation: 5.0,
                              borderRadius: BorderRadius.circular(40.0),
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
                                      Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                              content:
                                                  Text('Processing Data')));
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
                    ]),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      HelperFunctions.saveUserEmailSharedPreference(emailController.text);

      formState.save();
      try {
        databaseMethods.getUserbyUserEmail(emailController.text).then((val) {
          userSnapshot = val;
          HelperFunctions.saveUserNameSharedPreference(
              userSnapshot.documents[0].data["name"]);
        });
        AuthResult result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text, password: passController.text);
        FirebaseUser user = result.user;
        HelperFunctions.saveUserLoggedInSharedPreference(true);

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => AppHome(user: user)));
        HelperFunctions.saveUserEmailSharedPreference(user.email);
      } catch (e) {
        print(e.message);
      }
    }
  }
}
