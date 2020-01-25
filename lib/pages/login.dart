import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:my_app/services/github_api.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<StatefulWidget> {
  bool isHidden = true;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void _toggleVisibility() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      backgroundColor: Colors.black87,
      textStyle: TextStyle(
        fontSize: 14,
        color: Colors.white70,
        decoration: TextDecoration.none,
      ),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('Login'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Column(
                children: <Widget>[
                  // Image.asset(
                  //   "assets/images/avatar.png",
                  //   width: MediaQuery.of(context).size.width / 4,
                  // ),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    child: TextField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: 'Name：',
                        hintText: 'Your github account username',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(isHidden
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: _toggleVisibility,
                        ),
                        labelText: 'Password：',
                        hintText: 'Your github account password',
                      ),
                      obscureText: isHidden,
                    ),
                  ),
                  SizedBox(height: 52),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 48,
                    height: 48,
                    child: RaisedButton(
                      child: Text('Login'),
                      onPressed: () {
                        final progress = ProgressHUD.of(context);
                        progress.showWithText('Loading...');
                        FocusScope.of(context).requestFocus(new FocusNode());

                        Future.delayed(Duration(milliseconds: 500), () async {
                          try {
                            githubClient = gitGithubApiClient(
                              username: usernameController.text,
                              password: passwordController.text,
                            );
                            await githubClient.users.getCurrentUser();
                            Navigator.pushReplacementNamed(context, "/home");
                            progress.dismiss();
                          } catch (e) {
                            print(e);
                          }
                          progress.dismiss();
                        });
                        // FocusScope.of(context).unfocus();

                        // Future.delayed(Duration(seconds: 2), () {
                        //   Navigator.pushReplacementNamed(context, "/home");
                        //   progress.dismiss();
                        // });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
