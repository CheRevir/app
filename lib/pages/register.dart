import 'package:app/pages/page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget with BasePage {
  static const route = '/register';

  @override
  State<StatefulWidget> createState() => _RegisterPageState();

  @override
  String get title => '注册';
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
