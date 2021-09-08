import 'dart:io';

import 'package:app/common/http.dart';
import 'package:app/pages/agreement.dart';
import 'package:app/pages/page.dart';
import 'package:app/pages/register.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget with BasePage {
  static const route = '/login';

  @override
  State<StatefulWidget> createState() => _LoginPageState();

  @override
  String get title => '登录';
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();
  bool _pwdShow = false;
  bool _checkbox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          TextButton(
            child: Text(
              '注册',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () =>
                Navigator.of(context).pushNamed(RegisterPage.route),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  maxLength: 16,
                  decoration: InputDecoration(
                    labelText: '用户名',
                    hintText: '请输入用户名',
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (v) {
                    if (v != null) {
                      return v.trim().isNotEmpty ? null : '用户名不能为空';
                    }
                    return '用户名错误';
                  },
                ),
                TextFormField(
                  controller: _pwdController,
                  maxLength: 20,
                  decoration: InputDecoration(
                      labelText: '密码',
                      hintText: '请输入密码',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                            _pwdShow ? Icons.visibility_off : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _pwdShow = !_pwdShow;
                          });
                        },
                      )),
                  obscureText: !_pwdShow,
                  validator: (v) {},
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Row(
                    children: [
                      Checkbox(
                        value: _checkbox,
                        onChanged: (v) {
                          setState(() {
                            _checkbox = v ?? false;
                          });
                        },
                      ),
                      Text('同意'),
                      TextButton(
                        child: Text(
                          '用户协议',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                        onPressed: () => Navigator.of(context).pushNamed(
                            AgreementPage.route,
                            arguments: AgreementType.USER),
                      ),
                      Text('和'),
                      TextButton(
                        child: Text(
                          '隐私政策',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                        onPressed: () => Navigator.of(context).pushNamed(
                            AgreementPage.route,
                            arguments: AgreementType.PRIVACY),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 32),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 55),
                    child: ElevatedButton(
                      child: Text('登录'),
                      onPressed: _login,
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  void _login() async {
    print('login');
    if ((_formKey.currentState as FormState).validate()) {
      if (_checkbox) {
      } else {}

      var result = await Http.post(Request(Api.LOGIN,
          params: {
            'account': _nameController.text,
            'password': _pwdController.text
          }));
      print(result.data);
    }
  }
}
