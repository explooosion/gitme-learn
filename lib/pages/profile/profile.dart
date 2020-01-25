import "package:flutter/material.dart";
import 'package:my_app/components/profile/profile_info.dart';
import 'package:my_app/pages/repo.dart';
import 'package:my_app/pages/profile/follow.dart';
import 'package:my_app/pages/profile/star.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  title: Text("RobbyWu"),
                  pinned: true,
                  expandedHeight: 250.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        ProfileInfo(
                          avatarUrl:
                              "https://avatars2.githubusercontent.com/u/13682994?s=80&v=4",
                          name: "Robby Wu",
                          location: "Taichung City, Taiwan",
                        ),
                        SizedBox(height: 8.0),
                        TabBar(
                          labelPadding: EdgeInsets.zero,
                          tabs: <Widget>[
                            Tab(text: "Repos"),
                            Tab(text: "Stars"),
                            Tab(text: "Followers"),
                            Tab(text: "Following"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  bottom: TabBar(
                    labelPadding: EdgeInsets.zero,
                    tabs: <Widget>[
                      Tab(text: "Repos"),
                      Tab(text: "Stars"),
                      Tab(text: "Followers"),
                      Tab(text: "Following"),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: <Widget>[
                RepoPage(),
                StarRepoPage(),
                FollowerPage(),
                FollowingPage(),
              ],
            )),
      ),
      length: 4,
    );
  }
}
