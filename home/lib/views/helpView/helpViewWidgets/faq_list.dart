import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../text_styles.dart';

TextStyle questionStyle() {
  // Defines the FAQ Question Header style
  return TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 28,
    color: Colors.grey[900],
    letterSpacing: 0.5,
    wordSpacing: 1,
  );
}

TextStyle responseStyle() {
  return TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
    wordSpacing: 2,
  );
}

Card faqListItem(String question, String response){
  // A function which adds an item to the FAQ list. It takes in 2 String values when called.
  return Card(
    elevation: 2,
    child: new Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),

      child: Column(
        children: <Widget>[

          new Row(
            children: <Widget>[
              new Padding(padding: EdgeInsets.only(right: 1.0)),
              new Expanded(
                  child: new Text(
                      question, style: questionStyle()
                  )
              ),
            ],
          ),

          new Row(
            children: <Widget>[
              new Padding(padding: EdgeInsets.only(right: 1.0)),
              new Expanded(
                  child: new Text(
                      response, style: responseStyle()
                  )
              ),
            ],
          ),

        ],
      ),
    ),

  );
}

class FAQList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          SizedBox(
            height: 10,
          ),

          Text(
            "FAQ",
            style: headerStyle1(),
          ),

          SizedBox(
            height: 10,
          ),

          Divider(
            height: 10,
            color: Colors.black,
          ),

          SizedBox(
            height: 10,
          ),

    // TODO Fix overflow and make this list scrollable
          Expanded(child:
            SingleChildScrollView(
            scrollDirection: Axis.vertical,

              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: <Widget>[
                  faqListItem("How do I make a post?",
                        "Simply click the +1 New Post Button."),
                  SizedBox(
                    height: 10,
                  ),

                  faqListItem("How do I know which electorate I am in?",
                      "Please visit the 'Electorate' tab."),

                  SizedBox(
                    height: 10,
                  ),

                  faqListItem("What happens if I forget my password?",
                      "You can access the forgot password feature of the application from the login screen. "
                          "If you are logged in, you can 'logout' through the settings menu, "
                          "from there you can access the 'forgot password feature."),

                  SizedBox(
                    height: 10,
                  ),

                  faqListItem("What if someone is saying something hateful on the app?",
                      "You can report behaviour which you believe is not in accordance with our "
                          "community guidelines. A moderator will review your report and remove the content "
                          "if it contravenes the guidelines."),

                  SizedBox(
                    height: 10,
                  ),

                  faqListItem("Can I trust the information on the app?",
                      "Post which have a tick next to them are verified - which means they have been "
                          "created by the Citizen Tasmania team. We always advise conducting your own "
                          "research on a topic, but you can rest assured the claims made in those posts"
                          "are well researched."),

                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

