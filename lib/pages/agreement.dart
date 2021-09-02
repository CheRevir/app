import 'package:app/pages/page.dart';
import 'package:flutter/material.dart';

class AgreementPage extends StatelessWidget with BasePage {
  static const route = '/agreement';

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)?.settings.arguments;
    if (arg is AgreementType) {
      if (arg == AgreementType.USER) {}
    }
    return Scaffold();
  }

  @override
  String get title => '协议';
}

enum AgreementType { USER, PRIVACY }
