import 'package:citizenpower/layouts/generic_layouts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Layouts/generic_layouts.dart';
import 'comments_page.dart';
import 'constants.dart';

class AppHome extends StatefulWidget {
  const AppHome({Key key, @required this.user}) : super(key: key);
  //Stores the logged in user
  final FirebaseUser user;

  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  Widget get homeDrawer => new Drawer(
        //List view used to build navigation pushes most effectively
        child: new ListView(
          children: <Widget>[
            //UserAccountsDrawerHeader() used to show limited Citizen Tasmania info
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
            //1st ListTile() navigates to About Citizen view
            new ListTile(
              title: new Text("About Citzen "),
              onTap: () => Navigator.of(context).pushNamed("/e"),
            ),
            //2nd ListTile() navigates to Settings view
            new ListTile(
              title: new Text("Settings"),
              onTap: () => Navigator.of(context).pushNamed("/d"),
            ),
            new ListTile(
              title: new Text("Help"),
              onTap: () => Navigator.of(context).pushNamed("/c"),
            ),
          ],
        ),
      );

  Widget get homeTools => Container(
        height: 60,
        padding: EdgeInsets.only(top: 0, right: 10, left: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            //Expanded() needed when using TextField() in Row()
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
            //Provides padding
            SizedBox(
              width: 30,
            ),
            //Will provide access to notifications views
            //TODO: Get working
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: darkGold,
                size: 35,
              ),
              onPressed: () {
                ScaffoldState sState = Scaffold.of(context);
                sState.showSnackBar(SnackBar(content: Text("Notifications")));
              },
            ),
          ],
        ),
      );

  Widget get post => Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            //TODO: Left margin padding needed as well
            margin: EdgeInsets.only(right: 10, left: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //Post widget
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  //Padding
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
                  //Padding between buttons and actual post
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
      );

  //Used to in BottomNavBar function, prevents pushing to the same view over and over again.
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    //All views start with a scaffold
    return Scaffold(
      //Drawer provides limited ElectNow information
      //As well as access to AboutCitizen view and Settings view
      endDrawer: homeDrawer,
      appBar: new AppBar(
        //TODO: Move to left side for consistency between all views?
        title: Text(
          "                    " 'Home',
          textAlign: TextAlign.center,
        ),
        //TODO: Is this neccessary? Profile button in BottomNavBar leads to the same view.
        leading: Container(
          padding: EdgeInsets.all(12.0),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 5.0,
            backgroundImage: AssetImage("assets/Wilkie.jpeg"),
          ),
        ),
      ),
      //SingleChildScrollView() prevents yellow/black line errors occurring vertically and allows infinite scrolling
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Provides height and padding for the TextField()
            homeTools,
            //Provides padding
            SizedBox(
              width: 10,
              height: 10,
            ),
            post,
            post,
            post,
            post,
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
