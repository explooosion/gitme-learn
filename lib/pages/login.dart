import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      backgroundColor: Colors.black87,
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('Login'),
          ),
          body: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: TextField(
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
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    labelText: 'Password：',
                    hintText: 'Your github account password',
                  ),
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
                    Future.delayed(Duration(seconds: 2), () {
                      Navigator.pushReplacementNamed(context, "/home");
                      progress.dismiss();
                    });
                  },
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
