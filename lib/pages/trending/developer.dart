import 'package:flutter/material.dart';

class TrendingDevelopers extends StatefulWidget {
  @override
  _TrendingDevelopersState createState() => _TrendingDevelopersState();
}

class _TrendingDevelopersState extends State<TrendingDevelopers> {
  List trendDeveloperList = [
    {
      "username": "google",
      "name": "Google",
      "type": "organization",
      "url": "https://github.com/google",
      "avatar": "https://avatars0.githubusercontent.com/u/1342004",
      "repo": {
        "name": "traceur-compiler",
        "description":
            "Traceur is a JavaScript.next-to-JavaScript-of-today compiler",
        "url": "https://github.com/google/traceur-compiler"
      }
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: RefreshIndicator(
        child: ListView.separated(
          padding: EdgeInsets.all(0.0),
          itemCount: trendDeveloperList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(trendDeveloperList[index]["avatar"]),
                radius: 28.0,
              ),
              title: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(trendDeveloperList[index]["name"]),
                  SizedBox(width: 16.0),
                  Text(trendDeveloperList[index]["username"]),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 8.0),
                  Text("🔥 ${trendDeveloperList[index]["repo"]["name"]}"),
                  SizedBox(height: 8.0),
                  Text(trendDeveloperList[index]["repo"]["description"]),
                ],
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              onTap: () {},
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(height: 0.0),
        ),
        onRefresh: () async {
          return Future.delayed(Duration(seconds: 2), () {});
        },
      ),
    );
  }
}
