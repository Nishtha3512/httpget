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
  String _searchText = "";
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
    t1.addListener(() {

      _printLatestValue();
    });
    getData();
  }

  final TextEditingController t1=TextEditingController();
  _printLatestValue(){
    print("Text field:+$userData");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /*title: TextField(
          controller: t1,
          decoration: InputDecoration
            (hintText: "Search here"),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white,), onPressed: () {},)
        ],*/
        title: Text("search.."),
      ),
      body: ListView.builder(//itemCount: userData == null ? 0: userData.length,

      itemBuilder: (BuildContext context,int index){
        return index==0 ? _searchBar() :
          Card(
            child: Column(
              children: [
                Text("${userData[index]["first_name"]}",style: TextStyle(fontSize: 20),),
                Text("${userData[index]["last_name"]}",style: TextStyle(fontSize: 20),),
                //print("${userData[index]["first_name"]}");
              ],
            ),

        );
      },
        itemCount: userData.length,
       ),
    );
  }
  _searchBar(){
    return TextField(
      decoration: InputDecoration(
        hintText: "Search....."
      ),
      onChanged: (text){

      },
    );
  }
}
