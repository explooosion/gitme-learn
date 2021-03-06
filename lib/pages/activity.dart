import 'package:flutter/material.dart';

class ActivityPage extends StatelessWidget {
  final List repoList = [
    {
      "title": "BbsonLin/gitme_reborn",
      "description": "No description provided.\n\n★ 0",
      "lang": "● Dart"
    },
    {
      "title": "BbsonLin/ithome-ironman",
      "description": "No description provided.\n\n★ 0",
      "lang": ""
    },
    {
      "title": "BbsonLin/flask-request-logger",
      "description":
          "A Flask extension for recording requests and responses into database\n\n★ 3",
      "lang": "● Python"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        itemCount: repoList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(repoList[index]["title"]),
            subtitle: Text(repoList[index]["description"]),
            trailing: Text(repoList[index]["lang"]),
            isThreeLine: false,
            contentPadding: EdgeInsets.all(16),
            onTap: () {},
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 8);
        },
      ),
    );
  }
}
