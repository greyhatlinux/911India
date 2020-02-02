import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'location.dart';

class Post {
  double lati;
  double longi;
  final String body;

  Post({this.lati, this.longi, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      lati: json['lat'],
      longi: json['lon'],
      body : json['msg'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["newvictimlat"] = lati.toString();
    map["newvictimlon"] = longi.toString();
    map["body"] = body;
    return map;
  }
}

Future<Post> createPost(String url, {Map body}) async {
  return http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;
    print(response.statusCode);
    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return Post.fromJson(json.decode(response.body));
  });
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  final Future<Post> post;

  MyApp({Key key, this.post}) : super(key: key);
  static final CREATE_POST_URL = 'https://nodesk.run-us-west2.goorm.io/addvictimlocation';

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController titleController = new TextEditingController();

  TextEditingController bodyController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "User_Request",
      theme: ThemeData(
        primaryColor: Colors.blue[600],
      ),
      home: Scaffold(
        backgroundColor: Colors.blue[100],
          appBar: AppBar(
            title: Text('911 INDIA'),
            centerTitle: true,
          ),
          body:  Center(
              child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/police.jpeg'),
              ),
              SizedBox(
                height: 50.0,
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 250.0,
                    width: 250.0,
                    child: FittedBox(
                      child: FloatingActionButton(
                        backgroundColor: Colors.red,
                        elevation: 20,
                        child: Text('HELP ME',style: TextStyle(color: Colors.white,fontSize: 8.0,),),
                        onPressed: () async {
                          Location l = new Location();
                          await l.getCurrentLocation();

                          Post newPost = new Post(
                              lati: l.latitude,
                              longi: l.longitude,
                              body: "instant help");
                          Post p = await createPost(MyApp.CREATE_POST_URL,
                              body: newPost.toMap());
                        },

                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70.0,
                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 90.0,
                        width: 90.0,
                        child: FittedBox(
                          child: FloatingActionButton(
                            backgroundColor: Colors.brown,
                            elevation: 10,
                            child: Text('ROAD',style: TextStyle(color: Colors.white,fontSize: 8.0),),
                            onPressed: () async {
                          Location l = new Location();
                          await l.getCurrentLocation();

                          Post newPost = new Post(
                              lati: l.latitude,
                              longi: l.longitude,
                              body: "Road Accident");
                          Post p = await createPost(MyApp.CREATE_POST_URL,
                              body: newPost.toMap());
                        },

                          ),
                        ),
                      ),
                      Container(
                        height: 90.0,
                        width: 90.0,
                        child: FittedBox(
                          child: FloatingActionButton(
                            backgroundColor: Colors.brown,
                            elevation: 10,
                            child: Text('MEDICAL',style: TextStyle(color: Colors.white,fontSize: 8.0),),
                            onPressed: () async {
                          Location l = new Location();
                          await l.getCurrentLocation();

                          Post newPost = new Post(
                              lati: l.latitude,
                              longi: l.longitude,
                              body: "Medical Assistance");
                          Post p = await createPost(MyApp.CREATE_POST_URL,
                              body: newPost.toMap());
                        },

                          ),
                        ),
                      ),

                      Container(
                        height: 90.0,
                        width: 90.0,
                        child: FittedBox(
                          child: FloatingActionButton(
                            backgroundColor: Colors.brown,
                            elevation: 10,
                            child: Text('FIRE',style: TextStyle(color: Colors.white,fontSize: 8.0),),
                            onPressed: () async {
                          Location l = new Location();
                          await l.getCurrentLocation();

                          Post newPost = new Post(
                              lati: l.latitude,
                              longi: l.longitude,
                              body: "Fire Incident");
                          Post p = await createPost(MyApp.CREATE_POST_URL,
                              body: newPost.toMap());
                        },

                          ),
                        ),
                      ),
                    ],
                  ), 
                ],
              ),
          ],
        )
      ),
          floatingActionButton: FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.add,),
                elevation: 10.0,
                mini: false,
          ),

        ),
    );
  }
}

