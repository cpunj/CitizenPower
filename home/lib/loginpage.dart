import 'package:citizenpower/TextStyles.dart';
import 'package:citizenpower/databaseServices/database.dart';
import 'package:citizenpower/databaseServices/helperfunctions.dart';
import 'package:flutter/material.dart';
import 'registration.dart';
import 'constants.dart';
import 'AppHome.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  ProfileDatabaseMethods databaseMethods = new ProfileDatabaseMethods();
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
                          onSaved: (input) => emailController.text = input,
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
                            onSaved: (input) => passController.text = input,
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
                                signIn();
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
            )
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
        AuthResult result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text, password: passController.text);
        HelperFunctions.saveUserLoggedInSharedPreference(true);

        FirebaseUser user = result.user;

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => AppHome(user: user)));
        HelperFunctions.saveUserEmailSharedPreference(user.email);
      } catch (e) {
        print(e.message);
      }
    }
  }
}
