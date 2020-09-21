import 'package:flutter/material.dart';

import '../../constants.dart';

class DettailWidget extends StatefulWidget {
  @override
  DettailWidgetState createState() => new DettailWidgetState();
}

class DettailWidgetState extends State<DettailWidget>
    with WidgetsBindingObserver {
  bool isKeyboardActived = false;

  int _selectedIndex = 0;

  bool _isShow = false;

  var _inputList = [];

  FocusNode _focusNode = FocusNode();
  TextEditingController textCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail'),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
//          controller: ,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeaderWidget(),
                    _buildTabWidget(),
                    //  _inputList.length > 0  ? _buildCellWidget(_inputList.first) : _buildCellWidget(),

                    _selectedIndex == 0
                        ? Container()
                        : _inputList.length > 0
                            ? _buildCellWidget(_inputList.first)
                            : _buildCellWidget(),
                    _selectedIndex == 0 ? Container() : _buildCellWidget(),
                    _selectedIndex == 1 ? Container() : _buildshareWidget(),
                    _selectedIndex == 1 ? Container() : _buildshareWidget(),
                  ],
                ),
              )),
              _isShow ? _buildInputWidget() : _buildEditWidget()
            ],
          ),
        ));
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //
      if (isKeyboardActived) {
        setState(() {
          _isShow = false;
        });
      } else if (_isShow) {
        isKeyboardActived = true;
      }
    });
  }

  @override
  void dispose() {
    textCtr.dispose();
    _focusNode.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didUpdateWidget(DettailWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  Widget _buildHeaderWidget() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(_focusNode);
      },
      behavior: HitTestBehavior.translucent,
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
                    margin: EdgeInsets.only(
                      left: 12,
                      top: 10,
                    ),
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
            ],
          ),
          //Padding
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0),
            child: Text(
                "Hey there, My name is Ejaz Ahmed , I am currently studying at university of Tasmania. ",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[800],
                    height: 1.1,
                    letterSpacing: .6)),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 210,
            margin: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.2),
              image: DecorationImage(
                  image: AssetImage("assets/Wilkie.jpeg"), fit: BoxFit.cover),
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
        ],
      ),
    );
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

  Widget _buildTabWidget() {
    return Container(
//      color: Colors.red,
      width: 200,
      height: 46,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 44,
            child: Row(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                  child: Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text('Comment'),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                  child: Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 10),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text('Share')),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(left: _selectedIndex == 0 ? 25 : 105),
            height: 2,
            width: 50,
            decoration: BoxDecoration(
                color: brightOrange,
                borderRadius: BorderRadius.all(Radius.circular(1))),
          ))
        ],
      ),
    );
  }

  Widget _buildshareWidget([String textStr]) {
    return Column(
      children: <Widget>[
        Container(
          height: 60,
          child: Row(
            children: <Widget>[
              Container(
                height: 44,
                width: 44,
                margin: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                      image: AssetImage("assets/donate.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 5, top: 4),
                    child: Text(
                      "Jenny",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(textStr == null ? 'I love codding' : textStr),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, top: 4),
                    child: Text(
                      '02-02-2020',
                      style: TextStyle(fontSize: 10),
                    ),
                  )
                ],
              )),
            ],
          ),
        ),
        Container(
          height: 1,
          color: Colors.grey[300],
          margin: EdgeInsets.only(left: 15, right: 15),
        )
      ],
    );
  }

  Widget _buildCellWidget([String textStr]) {
    return Column(
      children: <Widget>[
        Container(
          height: 40,
          child: Row(
            children: <Widget>[
              Container(
                height: 33,
                width: 33,
                margin: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                      image: AssetImage("assets/grace.jpg"), fit: BoxFit.cover),
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 5, top: 15),
                    child: Text(
                      "Grace Shared in 02-02-2020",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
        Container(
          height: 1,
          color: Colors.grey[300],
          margin: EdgeInsets.only(left: 15, right: 15),
        )
      ],
    );
  }

  Widget _buildEditWidget() {
    return Container(
      height: 44,
      child: Row(
        children: <Widget>[
          Expanded(child: Container()),
          InkWell(
            onTap: () {},
            child: Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.thumb_up,
                        color: Colors.blue,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text('Support')),
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: Container()),
          InkWell(
            onTap: () {
              setState(() {
                isKeyboardActived = false;
                _isShow = true;
              });
            },
            child: Expanded(
              child: Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.comment,
                        color: Colors.blue,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text('Comment')),
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: Container()),
          InkWell(
            onTap: () {},
            child: Container(
              child: Row(
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.share,
                      color: Colors.blue,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 5), child: Text('Share')),
                ],
              ),
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }

  Widget _buildInputWidget() {
    return Container(
      height: 44,
      child: Row(
        children: <Widget>[
          Expanded(
              child: Container(
            height: 40,
            margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
            padding: EdgeInsets.only(left: 5, right: 5),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: new Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: TextField(
              onChanged: (String text) {},
              decoration: InputDecoration(
//                enabledBorder:InputBorder.none,
                border: InputBorder.none,
              ),
              controller: textCtr,
              focusNode: _focusNode,
              autofocus: true,
              style: TextStyle(),
            ),
          )),
          SizedBox(
            width: 60,
            height: 34,
            child: InkWell(
              onTap: () {
                FocusScope.of(context).requestFocus(_focusNode);
                _inputList = [textCtr.text];
                textCtr.text = '';
                setState(() {
                  _isShow = false;
                  isKeyboardActived = true;
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: 10),
                alignment: Alignment.center,
                color: Colors.blue,
                child: Text(
                  'Send',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
