import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data;
  List userData;
  Future getData()async{
    http.Response response=await http.get("https://reqres.in/api/users?page=2");
    debugPrint(response.body);
    data = json.decode(response.body);
    setState(() {
      userData = data["data"];
    });
    //debugPrint(userData.toString());
  }

  @override
  void initState(){
    super.initState();
    getData();
  }

  final TextEditingController t1=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: t1,
          decoration: InputDecoration
            (hintText: "Search here"),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white,), onPressed: () {},)
        ],
      ),
      body: ListView.builder(itemCount: userData == null ? 0: userData.length,
      itemBuilder: (BuildContext context,int index){
        return Card(
          child: Column(
            children: [
              Text("${userData[index]["first_name"]}"),
              //print("${userData[index]["first_name"]}");
            ],
          ),
        );
      }
       ),

    );
  }
}
