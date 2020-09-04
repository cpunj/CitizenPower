import 'package:citizenpower/Layouts/GenericLayouts.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override   
  _SearchScreenState createState() => _SearchScreenState();

}

class _SearchScreenState extends State<SearchScreen>{
  @override   
  Widget build(BuildContext context){
    return Scaffold(
      appBar:topAppBarLayout("Search"),
      body:Container(
        child: Column(children: 
        [
          Container(
            color:Color(0x54FFFFFF),
            padding:EdgeInsets.symmetric(horizontal:24,vertical:16),
            child:
          Row(children: [
          Expanded(
            child:TextField(
              style:TextStyle(
                color:Colors.white
              ),
              decoration: new InputDecoration(
                hintText:"Search username",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              hintStyle: TextStyle(
                                color: Colors.white54,
                              ),
              )
            ),
          ), 
   
          Image.asset("assets/download.png",
          height:70,
          width:70)],
          ),
          ),
        ],) ,
      )
      
    );
  }
}