import 'package:app/pages/login.dart';
import 'package:app/pages/page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget with BasePage {
  static const route = '/my';

  @override
  State<StatefulWidget> createState() => _MyPageState();

  @override
  String get title => '我的';
}

class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('登录'),
          onPressed: () => Navigator.of(context).pushNamed(LoginPage.route),
        ),
      ),
    );
  }
}
