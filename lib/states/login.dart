import 'package:flutter/foundation.dart';

class Login with ChangeNotifier, DiagnosticableTreeMixin {
  bool _hasLogin = false;

  bool get hasLogin => _hasLogin;

  set hasLogin(bool hasLogin) {
    _hasLogin = hasLogin;
    notifyListeners();
  }
}
