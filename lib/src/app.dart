import 'package:flutter/material.dart';
import 'package:yuefou_flutter/src/home/page.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YueFou',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Page(title: '动态'),
      routes: <String, WidgetBuilder>{
        '/activity': (BuildContext context) => Page(title: '活动'),
        '/task': (BuildContext context) => Page(title: '任务'),
        '/recipe': (BuildContext context) => Page(title: '菜谱'),
        '/settings': (BuildContext context) => Page(title: '设置'),
      },
    );
  }
}
