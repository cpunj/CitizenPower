import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new LoginPage(),
        theme: new ThemeData(primarySwatch: Colors.blue));
  }
}

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.white,
        iconTheme:IconThemeData(
          color:Colors.black
        ),
        title:Text(
          "Login",
          style:TextStyle(
            fontWeight:FontWeight.bold,
            color:Colors.black
        ),
        ),
      ),
      backgroundColor: Colors.blueGrey,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/img.PNG"),
            fit: BoxFit.cover,
          ),
          new Form(
            child: new Theme(
              data: new ThemeData(
                brightness: Brightness.dark,
              ),
              child: new Container(
                padding: const EdgeInsets.all(60.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new TextFormField(
                      decoration: new InputDecoration(
                          labelText: "Enter Email Address", hintText: "Email"),
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) {
                         if(!val.contains('@')){
                           return "Email is not correct";
                         }
                         return null;
                      },
                    ),
                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Enter Password",
                        hintText: " Password",
                      ),
                      keyboardType: TextInputType.text,
                      validator: (val) => val.length < 6
                          ? 'Password is too short,Enter a new one'
                          : null,
                      obscureText: true,
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                    ),
                    new MaterialButton(
                      
                      color: Colors.teal,
                      textColor: Colors.black87,
                      child: new Text("LOGIN"),
                      onPressed: ()  {
                        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
                        
                        );
                      }
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                    ),
                    new MaterialButton(
                        color: Colors.indigo,
                        textColor: Colors.tealAccent,
                        minWidth: 50,
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        child: new Text("SIGN UP/REGISTER"),
                       onPressed: ()  {
                        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Registration()),
                        
                        );
                      }
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
class ProfileScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.white,
        iconTheme:IconThemeData(
          color:Colors.black
        ),
        title:Text(
          "@Citizen.Tas",
          style:TextStyle(
            fontWeight:FontWeight.bold,
            color:Colors.black
        ),
        ),
        actions: <Widget>[
          Container(
            margin:EdgeInsets.only(left:10),
            child:Icon(Icons.more_vert),
          ),
        ],
      ),
      body:CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child:Container(
            margin: EdgeInsets.only(top:20),
            height:300,
            child:Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius:BorderRadius.all(
                    Radius.circular(20),
                  ),
                  child: Image.asset(
                    "assets/img.PNG",
                  height:200,
                  width:100,
                  fit:BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height:10,
            ),
            Text("Hobart|Citizen_TAS"),
            ],
            ),
            ),
          ),
          SliverToBoxAdapter(
            child:Container(
              margin:EdgeInsets.only(left:30,right:30),
              child:Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children:<Widget>[
                  Text(
                    "04",
                    style:TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize:20,
                    ),
                  ),
                  SizedBox(height:3,),
                  Text("Posts"),
                ],
                ),
            
                Divider(height:10,color:Colors.black,),
                Column(
                  children: <Widget>[
                    Text(
                      "213",
                      style:TextStyle(
                        fontWeight:FontWeight.bold,
                        fontSize:20,
                      ),
                    ),
                    SizedBox(
                      height:3,
                    ),
                    Text("Connections"),
                  ],
                ),
                Divider(
                  height:10,
                  color:Colors.black,
                ),
                Column(
                  children:<Widget>[
                    Text(
                      "1K",
                      style:TextStyle(
                        fontWeight:FontWeight.bold,
                        fontSize:20,
                      ),
                    ),
                    SizedBox(
                      height:3,
                    ),
                    Text("Linked To"),
                  ],
                ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child:Column(
                children:<Widget>[
                  Divider(height:10,color:Colors.black,),
                  Container(
                    margin:EdgeInsets.only(left:50,right:50,top:10),
                    child:Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
children: <Widget>[
  Icon(Icons.grid_on),
  Icon(Icons.list),
  Icon(Icons.tag_faces)
],
                  ),
                  ),
                  Divider(height:10,color:Colors.black,),

                ],
              ),
            ),
              SliverStaggeredGrid.count(
            crossAxisCount:2,
            mainAxisSpacing:10,
            crossAxisSpacing:10,
            staggeredTiles:[
              StaggeredTile.count(1,2),
              StaggeredTile.count(1,1),
              StaggeredTile.count(1,1),
            ],
            children:<Widget>[
              ClipRect(
              child:Image.asset("assets/img.png",fit:BoxFit.cover),
              ),
               ClipRect(
              child:Image.asset("assets/img.png",fit:BoxFit.cover),
              ),
               ClipRect(
              child:Image.asset("assets/img.png",fit:BoxFit.cover),
              ),



            ]
              )]
      ),
      bottomNavigationBar:BottomNavigationBar(items:[
        BottomNavigationBarItem(
          icon:Icon(Icons.home),
          title:Text("Dashboard"),
        ),
         BottomNavigationBarItem(
          icon:Icon(Icons.group),
          title:Text("Group"),
        ), BottomNavigationBarItem(
          icon:Icon(Icons.add),
          title:Text("Add"),
        ), BottomNavigationBarItem(
          icon:Icon(Icons.event),
          title:Text("Event"),
        ), BottomNavigationBarItem(
          icon:Icon(Icons.person),
          title:Text("profile"),
        ),

      ],),);
  
}}
//hello
class Registration extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.white,
        iconTheme:IconThemeData(
          color:Colors.black
        ),
        title:Text(
          "Register",
          style:TextStyle(
            fontWeight:FontWeight.bold,
            color:Colors.black
        ),
        ),
      ),
      backgroundColor: Colors.blueGrey,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/Wineglass-Bay-Tasmania-scaled.JPG"),
            fit: BoxFit.cover,
          ),
          new Form(
            child: new Theme(
              data: new ThemeData(
                brightness: Brightness.dark,
              ),
              child: new Container(
                padding: const EdgeInsets.all(60.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new TextFormField(
                      decoration: new InputDecoration(
                          labelText: "Enter Email Address", hintText: "Email"),
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) {
                         if(!val.contains('@')){
                           return "Email is not correct";
                         }
                         return null;
                      },
                    ),
                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Enter Password",
                        hintText: " Password",
                      ),
                      keyboardType: TextInputType.text,
                      validator: (val) => val.length < 6
                          ? 'Password is too short,Enter a new one'
                          : null,
                      obscureText: true,
                    ),
                    new TextFormField(
                      decoration: new InputDecoration(
                          labelText: "Phone number"),
                      keyboardType: TextInputType.number,
                    ),
                    new TextFormField(
                      decoration: new InputDecoration(
                          labelText: "Male or female", hintText: "Gender"),
                      keyboardType: TextInputType.text,
                      ),
                      ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

