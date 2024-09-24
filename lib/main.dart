import 'package:flutter/material.dart';
import 'package:flutter_isolate/tutorial_app.dart';
import 'package:flutter_isolate/utils/app_utils.dart'; // for compute

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await portraitMode();
  runApp(TutorialApp());
}
