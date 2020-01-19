import 'package:flutter/material.dart';
import 'package:my_app/pages/activity.dart';
import 'package:my_app/pages/issue.dart';
import 'package:my_app/pages/repo.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: TabBar(
            labelPadding: EdgeInsets.zero,
            tabs: <Widget>[
              Tab(text: 'Home'),
              Tab(text: 'Repo'),
              Tab(text: 'Activity'),
              Tab(text: 'Issues'),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        body: TabBarView(children: <Widget>[
          HomePage(),
          RepoPage(),
          ActivityPage(),
          IssuePage(),
        ]),
        drawer: Drawer(
          child: ListView(
            // padding: EdgeInsets.zero,
            children: <Widget>[
              ListTile(
                title: Text('sign out'),
                onTap: () async {
                  await showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => AlertDialog(
                      content: Text("Are you sure to exit current account."),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("Cancel"),
                          onPressed: () => Navigator.pop(context),
                        ),
                        FlatButton(
                          child: Text("OK"),
                          onPressed: () => Navigator.pushNamedAndRemoveUntil(
                              context, "/login", ModalRoute.withName('/')),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Container(
            child: Divider(
              height: 8.0,
              color: Colors.grey[200],
            ),
            color: Colors.grey[200],
          ),
          ListTile(
            dense: true,
            title: Text('Hackernews Top'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
          Divider(
            height: 0,
          ),
          ListTile(
            title: Text(
                "Pre-industrial workers had a shorter workweek than today's"),
            subtitle: Text("by jammygit 2 hours ago | 18 comments"),
            onTap: () {},
          ),
          ListTile(
            title: Text("MisterBooo / LeetCodeAnimation"),
            subtitle: Text("Java   38,443   6,483"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
