import 'package:citizenpower/main.dart';
import 'package:citizenpower/navigator/navigator_pushes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app_home.dart';
import '../comments_page.dart';

//Generic Post widget to be used in all dashboard list building

Widget postWidget(BuildContext context, String text, String picLink,
    String name, String profilePicLink, String time) {
  return Container(
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
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Divider(
                  height: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CommentsScreen()));
                },
                child: Container(
                  child: Column(
                    children: [
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
                                    image: NetworkImage(profilePicLink),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    " " + name,
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
                                    time,
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
                        text,
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
                              image: NetworkImage(picLink), fit: BoxFit.cover),
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
                    ],
                  ),
                ),
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
}
