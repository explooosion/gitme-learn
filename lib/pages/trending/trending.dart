import 'package:flutter/material.dart';
import 'package:my_app/pages/trending/project.dart';
import 'package:my_app/pages/trending/developer.dart';

class Trending extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            tabs: <Widget>[
              Tab(text: "Project"),
              Tab(text: "Developer"),
            ],
          ),
          actions: <Widget>[
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text("Date range: daily"),
                  )
                ];
              },
            )
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            TrendingProjects(),
            TrendingDevelopers(),
          ],
        ),
      ),
    );
  }
}
