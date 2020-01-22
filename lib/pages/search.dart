import 'package:flutter/material.dart';

enum SearchTypes {
  repos,
  users,
}

class GitmeRebornSearchDelegate extends SearchDelegate {
  SearchTypes _searchType = SearchTypes.repos;

  @override
  ThemeData appBarTheme(BuildContext context) => Theme.of(context);

  @override
  List<Widget> buildActions(BuildContext context) {
    // AppBar 右側
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
      PopupMenuButton(
        onSelected: (SearchTypes type) {
          _searchType = type;
          showSuggestions(context);
        },
        itemBuilder: (BuildContext context) {
          return [
            CheckedPopupMenuItem<SearchTypes>(
              value: SearchTypes.repos,
              checked: _searchType == SearchTypes.repos,
              child: const Text("Search Repos"),
            ),
            CheckedPopupMenuItem<SearchTypes>(
              value: SearchTypes.users,
              checked: _searchType == SearchTypes.users,
              child: const Text("Search Users"),
            ),
          ];
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchRepoResult();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == "") {
      switch (_searchType) {
        case SearchTypes.repos:
          return Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  "Search Repos",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context).textSelectionColor,
                  ),
                ),
              ],
            ),
          );
        case SearchTypes.users:
          return Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  "Search Users",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context).textSelectionColor,
                  ),
                ),
              ],
            ),
          );
        default:
      }
    }
    return Center(child: Text("Search for $query ..."));
  }
}

class SearchRepoResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}