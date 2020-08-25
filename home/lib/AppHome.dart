import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Layouts/GenericLayouts.dart';
import 'commentspage.dart';
import 'constants.dart';
import 'constants.dart';

class AppHome extends StatefulWidget {
  const AppHome({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Citizen Tasmania"),
              accountEmail: new Text("email: citizentasmania@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: darkGold,
                child: new Text(
                  "ElectNow",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ),
            new ListTile(
              title: new Text("About Citzen "),
              onTap: () => Navigator.of(context).pushNamed("/e"),
            ),
            new ListTile(
              title: new Text("Settings"),
              onTap: () => Navigator.of(context).pushNamed("/d"),
            )
          ],
        ),
      ),
      appBar: new AppBar(
        title: Text(
          "                    " 'Home',
          textAlign: TextAlign.center,
        ),
        leading: Container(
          padding: EdgeInsets.all(12.0),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 5.0,
            backgroundImage: AssetImage("assets/Wilkie.jpeg"),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 60,
              padding: EdgeInsets.only(top: 0, right: 10, left: 10, bottom: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white10),
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search, color: Colors.white),
                            hintText: "Search "),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.notifications,
                      color: darkGold,
                      size: 35,
                    ),
                    onPressed: () {
                      ScaffoldState sState = Scaffold.of(context);
                      sState.showSnackBar(
                          SnackBar(content: Text("Notifications")));
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
              height: 10,
            ),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage("assets/Wilkie.jpeg"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "" " Andrew Wilkie",
                                      style: TextStyle(
                                          color: Colors.grey[900],
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "1 hour ago",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.more_horiz,
                                size: 30,
                                color: Colors.grey[600],
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Hey there, My name is Ejaz Ahmed , I am currently studying at university of Tasmania. ",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[800],
                              height: 1.1,
                              letterSpacing: .6),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 210,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage("assets/Wilkie.jpeg"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            makeLike(),
                            Transform.translate(
                              offset: Offset(0, 10),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "400 comments",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "238 shares",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            makeSupportButton(),
                            makeCommentButton(),
                            makeShareButton(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage("assets/Wilkie.jpeg"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "" " Andrew Wilkie",
                                      style: TextStyle(
                                          color: Colors.grey[900],
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "1 hour ago",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.more_horiz,
                                size: 30,
                                color: Colors.grey[600],
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Hey there, My name is Ejaz Ahmed , I am currently studying at university of Tasmania. ",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[800],
                              height: 1.1,
                              letterSpacing: .6),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 210,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage("assets/Wilkie.jpeg"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            makeLike(),
                            Transform.translate(
                              offset: Offset(0, 10),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "400 comments",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "238 shares",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            makeSupportButton(),
                            makeCommentButton(),
                            makeShareButton(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage("assets/Wilkie.jpeg"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "" " Ejaz Ahmed",
                                      style: TextStyle(
                                          color: Colors.grey[900],
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "1 hour ago",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.more_horiz,
                                size: 30,
                                color: Colors.grey[600],
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Hey there, My name is Ejaz Ahmed , I am currently studying at university of Tasmania. ",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[800],
                              height: 1.1,
                              letterSpacing: .6),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 210,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage("assets/Wilkie.jpeg"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            makeLike(),
                            Transform.translate(
                              offset: Offset(0, 10),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "400 comments",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "238 shares",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            makeSupportButton(),
                            makeCommentButton(),
                            makeShareButton(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage("assets/Wilkie.jpeg"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "" " Ejaz Ahmed",
                                      style: TextStyle(
                                          color: Colors.grey[900],
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "1 hour ago",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.more_horiz,
                                size: 30,
                                color: Colors.grey[600],
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Hey there, My name is Ejaz Ahmed , I am currently studying at university of Tasmania.",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[800],
                              height: 1.1,
                              letterSpacing: .6),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 210,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage("assets/Wilkie.jpeg"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            makeLike(),
                            Transform.translate(
                              offset: Offset(0, 10),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "400 comments",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "238 shares",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            makeSupportButton(),
                            makeCommentButton(),
                            makeShareButton(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: bottomNavBarItems(),
          onTap: (index) {
            setState(() {
              onTap(index, context, widget.user, currentIndex);
            });
          }

          //onTap: _onTap,
          ),
    );
  }
}

Widget makeLike() {
  return Container(
    width: 25,
    height: 25,
    decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white)),
    child: Center(
      child: Icon(Icons.thumb_up, size: 12, color: Colors.white),
    ),
  );
}

// ignore: camel_case_types
class makeSupportButton extends StatefulWidget {
  @override
  _makeSupportButtonState createState() => _makeSupportButtonState();
}

// ignore: camel_case_types
class _makeSupportButtonState extends State<makeSupportButton> {
  bool isActive = false;
  _pressed() {
    setState(() {
      isActive = !isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]),
        borderRadius: BorderRadius.circular(40),
      ),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(
                isActive ? Icons.thumbs_up_down : Icons.thumb_up,
                color: isActive ? Colors.blue : Colors.grey,
                size: 18,
              ),
              onPressed: () => _pressed(),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Support",
              style: TextStyle(color: isActive ? Colors.blue : Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class makeCommentButton extends StatefulWidget {
  @override
  _makeCommentButtonState createState() => _makeCommentButtonState();
}

// ignore: camel_case_types
class _makeCommentButtonState extends State<makeCommentButton> {
  _commentButtonPressed() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CommentsPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.chat, color: Colors.grey, size: 18),
              onPressed: () => _commentButtonPressed(),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Comment",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}

Widget makeShareButton() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey[200]),
      borderRadius: BorderRadius.circular(50),
    ),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.share,
              color: Colors.grey,
              size: 18,
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "Share",
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    ),
  );
}

// ignore: camel_case_types
class PageWrapper extends StatelessWidget {
  final Widget page;
  PageWrapper(this.page);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page,
    );
  }
}
