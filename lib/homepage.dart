import 'package:flutter/material.dart';
import 'package:splash_screen_trial/collapsingToolbar.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: TextBox(),
      ),
      body: Center(
          child: Text(
        "Implementing seach delegate property!! \n\n  😛 😝 😜 🤪 🤨",
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[700],
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CollapsingToolbar()));
        },
        child: Icon(Icons.sports_handball_sharp),
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        cursorHeight: 20,
        decoration: InputDecoration(
          hintText: 'Click me',
          hintStyle: TextStyle(
              color: Colors.white, fontSize: 21, fontWeight: FontWeight.w500),
          border: InputBorder.none,
        ),
        onTap: () {
          showSearch(context: context, delegate: Datasearch());
        },
      ),
    );
  }
}

class Datasearch extends SearchDelegate<String> {
  @override
  String get searchFieldLabel => "Search";
  final names = [
    'deepa',
    'deepa pandey',
    'deepapandey364@gmail.com',
    'qwertypool',
    'github/qwertypool',
    'flutter',
    'flutter_girlz',
    'flutter_coding',
    'Deepa Pandey',
    'dipapndey',
  ];
  final recentSearches = [
    'flutter_girlz',
    'dipapndey',
    'github/qwertypool',
    'flutter_coding',
    'Deepa Pandey',
  ];

  //Actions for our appbar
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ];
  }

// Implement leading icon on the left of the appbar
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
        size: 25,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

// Show some result on the basis of selections.
  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

//Show suggestions when someone searches for something
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentSearches
        : names.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.person_search),
        title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
              TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey))
            ])),
      ),
      itemCount: suggestionList.length,
    );
  }
}
