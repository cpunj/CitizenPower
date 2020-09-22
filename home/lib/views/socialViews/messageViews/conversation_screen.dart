import 'package:citizenpower/databaseServices/database.dart';
import '../../../constants.dart';
import 'file:///C:/Users/jackl/AndroidStudioProjects/CitizenPower/home/lib/views/genericWidgets/generic_layouts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ConversationScreen extends StatefulWidget {
  final String chatroomId;

  ConversationScreen(this.chatroomId);
  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  ProfileDatabaseMethods databaseMethods = new ProfileDatabaseMethods();
  TextEditingController messageController = new TextEditingController();
  Stream chatMessagesStream;
  Widget chatMessageList() {
    return StreamBuilder(
      stream: chatMessagesStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return MessageTile(
                      snapshot.data.documents[index].data["message"],
                      snapshot.data.documents[index].data["sendBy"] ==
                          Constants.myName);
                })
            : Container();
      },
    );
  }

  sendMessage() {
    if (messageController.text.isNotEmpty) {
      Map<String, dynamic> messageMap = {
        "message": messageController.text,
        "sendBy": Constants.myName,
        "time": DateTime.now().millisecondsSinceEpoch
      };
      databaseMethods.addConversationMessages(widget.chatroomId, messageMap);
      messageController.text = "";
    }
  }

  void initState() {
    databaseMethods.getConversationMessages(widget.chatroomId).then((value) {
      setState(() {
        chatMessagesStream = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBarLayout("Chat"),
      body: Container(
        child: Stack(
          children: [
            chatMessageList(),
            Container(
              alignment: Alignment.bottomCenter,
              color: Color(0x54FFFFFFF),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                        controller: messageController,
                        style: TextStyle(color: Colors.black38),
                        decoration: new InputDecoration(
                          hintText: "Message...",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          hintStyle: TextStyle(
                            color: Colors.black38,
                          ),
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      sendMessage();
                    },
                    child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              const Color(0x36FFFFFF),
                              const Color(0x0FFFFFFF)
                            ]),
                            borderRadius: BorderRadius.circular(40)),
                        padding: EdgeInsets.all(20),
                        child: Image.asset(
                            "assets/74-749231_png-file-svg-send-message-icon-png-transparent.png")),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String message;
  final bool isSendByMe;
  MessageTile(this.message, this.isSendByMe);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      alignment: isSendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: isSendByMe ? 0 : 24, vertical: isSendByMe ? 24 : 0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isSendByMe
                  ? [
                      const Color(0xFFFBE9E7),
                      const Color(0xFFFBE9E7),
                    ]
                  : [const Color(0xFFE0F2F1), const Color(0xFFE0F2F1)],
            ),
            borderRadius: isSendByMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23),
                    bottomLeft: Radius.circular(23))
                : BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23),
                    bottomRight: Radius.circular(23))),
        child: Text(
          message,
          style: TextStyle(color: Colors.black87, fontSize: 17),
        ),
      ),
    );
  }
}
