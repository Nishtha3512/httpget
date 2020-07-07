import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:itunes_api/search.dart';
import 'package:http_api/http_api.dart';

class Search extends StatefulWidget {

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: TextFormField(

        decoration: InputDecoration(
          hintText: "Search",

        ),
      ),
      actions: [
        IconButton(icon: Icon(Icons.search,color: Colors.white,),onPressed: (){},)
      ],
    ),
    );
  }
}


class DataSearch extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    //actions for appbar
    return[
      IconButton(icon: Icon(Icons.clear),onPressed: (){},)
    ];
    throw UnimplementedError();
  }

  @override
  Animation<double> get transitionAnimation {

  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    //icons on left
    return IconButton(icon: AnimatedIcon(icon:AnimatedIcons.menu_arrow,
    progress: transitionAnimation,),onPressed: (){},);
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults

    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions

    throw UnimplementedError();
  }

}
