import 'package:citizenpower/login_page.dart';
import 'package:flutter/material.dart';
import 'layouts/generic_layouts.dart';
import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'databaseServices/database.dart';
import 'layouts/generic_layouts.dart';
import 'text_styles.dart';
import 'database.dart';

ProfileDatabaseMethods profileDatabaseMethods = ProfileDatabaseMethods();

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //Does it matter that we're using variables not controllers? - Jack
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final passController = TextEditingController();

  Future<void> registerUser() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      Map<String, String> userInfoMap = {
        "name": nameController.text,
        "email": emailController.text,
      };

      formState.save();
      try {
        AuthResult result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passController.text);
        FirebaseUser user = result.user;
        profileDatabaseMethods.uploadRegistrationInfo(userInfoMap, user);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } catch (e) {
        print(e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      //Prevents pixels error
      resizeToAvoidBottomInset: false,
      appBar: topAppBarLayout('Registration Page'),
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
                        decoration:
                            textFormDec(label: 'Name', hint: 'Enter your name'),
                        controller: nameController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      new TextFormField(
                        decoration: textFormDec(
                            label: 'Phone', hint: 'Enter your phone number'),
                        controller: mobileController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      new TextFormField(
                        decoration: textFormDec(
                            label: 'Email', hint: 'Enter your email address'),
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      new TextFormField(
                        decoration: textFormDec(
                            label: 'Password', hint: 'Enter password'),
                        keyboardType: TextInputType.text,
                        controller: passController,
                        validator: (val) => val.length < 6
                            ? 'Password should be longer than 6 characters'
                            : null,
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 30,
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
                                registerUser();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              }),
                        ),
                      ),
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
