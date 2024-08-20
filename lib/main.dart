import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mahfazty/core/routing/routing.dart';
import 'package:mahfazty/firebase_options.dart';
import 'package:mahfazty/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp(routing: Routing()));
}
