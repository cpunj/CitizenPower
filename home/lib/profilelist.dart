import 'package:citizenpower/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AppHome extends StatefulWidget{
  @override  
  State<AppHome> createState(){
    return new AppState();
  }
}

class AppState extends State<AppHome>{
  List<String> Names=['Harry Fawcett','Salman Md Farsy','Ejaz Ahmed','Jianyi Li','Khern','Chandan Punj','Jack Lennard'];
  @override  
  Widget build(BuildContext context){
    return new Scaffold(
      appBar:AppBar(
        backgroundColor: brightOrange,
        iconTheme: IconThemeData(color: Colors.black),
        title:new Text("Connections",
          style:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
      ),
      body:new Container(
        child:new ListView.builder(
          reverse:true,
          itemBuilder:(_,int index)=>EachList(this.Names[index]),
          itemCount:this.Names.length,
        ),
        ),
    );
  }
}

class EachList extends StatelessWidget{
  final String name;
  EachList(this.name);
  @override  
  Widget build(BuildContext context){
    return new Card(
      child:new Container(
        padding:EdgeInsets.all(8.0),
        child:new Row(
          children:<Widget>[
            new CircleAvatar(child:new Text(name[0]),),
            new Padding(padding:EdgeInsets.only(right:10.0)),
            new Text(name,style:TextStyle(fontSize:20.0),)
          ],
        ),
        ),
      );
}
}