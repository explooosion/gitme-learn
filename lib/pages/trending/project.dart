import "package:flutter/material.dart";
import 'package:my_app/utils.dart';

class TrendingProjects extends StatefulWidget {
  @override
  _TrendingProjectsState createState() => _TrendingProjectsState();
}

class _TrendingProjectsState extends State<TrendingProjects> {
  List trendProjectList = [
    {
      "author": "google",
      "name": "gvisor",
      "avatar": "https://github.com/google.png",
      "url": "https://github.com/google/gvisor",
      "description": "Container Runtime Sandbox",
      "language": "Go",
      "languageColor": "#3572A5",
      "stars": 3320,
      "forks": 118,
      "currentPeriodStars": 1624,
      "builtBy": [
        {
          "href": "https://github.com/viatsko",
          "avatar": "https://avatars0.githubusercontent.com/u/376065",
          "username": "viatsko"
        }
      ]
    },
    {
      "author": "google",
      "name": "gvisor",
      "avatar": "https://github.com/google.png",
      "url": "https://github.com/google/gvisor",
      "description": "Container Runtime Sandbox",
      "language": "Go",
      "languageColor": "#3572A5",
      "stars": 3320,
      "forks": 118,
      "currentPeriodStars": 1624,
      "builtBy": [
        {
          "href": "https://github.com/viatsko",
          "avatar": "https://avatars0.githubusercontent.com/u/376065",
          "username": "viatsko"
        },
        {
          "href": "https://github.com/viatsko",
          "avatar": "https://avatars0.githubusercontent.com/u/376065",
          "username": "viatsko"
        }
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: RefreshIndicator(
        child: ListView.separated(
          padding: EdgeInsets.all(0.0),
          itemCount: trendProjectList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(
                  "${trendProjectList[index]["author"]} / ${trendProjectList[index]["name"]}"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 8.0),
                  Text(
                      "★ ${trendProjectList[index]["currentPeriodStars"]} stars today"),
                  SizedBox(height: 8.0),
                  Text(trendProjectList[index]["description"]),
                  SizedBox(height: 8.0),
                  Row(
                    children: <Widget>[
                      Text("★ ${trendProjectList[index]["stars"]}"),
                      SizedBox(width: 16.0),
                      ...buildBuiltByList(trendProjectList[index]["builtBy"]),
                    ],
                  )
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "● ",
                    style: TextStyle(
                        color: hexToColor(
                            trendProjectList[index]["languageColor"]),
                        fontSize: 24.0),
                  ),
                  Text(trendProjectList[index]["language"]),
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

  List<Padding> buildBuiltByList(List builtByList) {
    List builtBys = builtByList.map((builtBy) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: CircleAvatar(
          radius: 10.0,
          backgroundImage: NetworkImage(builtBy["avatar"]),
        ),
      );
    }).toList();
    if (builtBys.length > 7) {
      return builtBys.sublist(0, 6);
    } else {
      return builtBys;
    }
  }
}
