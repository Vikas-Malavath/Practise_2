import 'package:flutter/material.dart';
import 'dart:convert';
//import 'json/movies.json';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
//  List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Movie Ratings'),
        backgroundColor: Colors.amber[500],
        centerTitle: true,
      ),
        body: Container(
          child: Center(
            child: FutureBuilder(
                future: DefaultAssetBundle
                    .of(context)
                    .loadString('json/movies.json'),
                builder: (context, snapshot) {
                  var new_data = json.decode(snapshot.data.toString());

                  return ListView.separated(
                    padding: EdgeInsets.all(8),
                    itemCount: new_data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: SizedBox(
                          height: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget> [
                                  Container(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '${new_data[index]['name']}',
                                        style: TextStyle(
                                          color: Colors.amberAccent,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        '${new_data[index]['rating']} / 5',
                                        style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '${new_data[index]['description']}',
                                style: TextStyle(
                                  color: Colors.grey[400],
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => const Divider(),
                  );
                }),
          ),
        ));
  }
}
