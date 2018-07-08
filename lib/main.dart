import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:yuefou_flutter/src/app.dart';
import 'package:flutter_stetho/flutter_stetho.dart';

void main() {
  HttpOverrides.global = new StethoHttpOverrides();

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });

  runApp(new MyApp());
}
