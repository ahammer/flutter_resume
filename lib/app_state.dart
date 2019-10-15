import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppState extends ChangeNotifier {
  String _theme = "Light";
  void setTheme(String theme) {
    _theme = theme;
    notifyListeners();
  }

  String getTheme() => _theme;
}

class AppStateWidget extends StatelessWidget {
  final Widget child;

  const AppStateWidget({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<AppState>(
        builder: (ctx) => AppState(),
        child: child,
      );
}
