import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<StatefulWidget> {
  bool isHidden = true;

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
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                          isHidden ? Icons.visibility_off : Icons.visibility),
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
                    FocusScope.of(context).unfocus();

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
