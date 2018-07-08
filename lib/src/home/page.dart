import 'package:flutter/material.dart';
import 'package:yuefou_flutter/src/global_state.dart';
import 'package:yuefou_flutter/src/home/navigation_drawer.dart';

class Page extends StatefulWidget {
  Page({Key key, this.title, this.body}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  static const String ACTIVE_ROUTE_PATH = 'active-route-path';

  final String title;
  final Widget body;

  @override
  State<StatefulWidget> createState() => _PageState();
}

class _PageState extends State<Page> {
  GlobalState _globalState = GlobalState.instance;

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      drawer: NavigationDrawer(
        activeRouteName: _globalState.get(Page.ACTIVE_ROUTE_PATH),
        onSelected: (String selectedPath) {
          _globalState.set(Page.ACTIVE_ROUTE_PATH, selectedPath);
        },
      ),
      body: widget.body,
    );
  }
}
