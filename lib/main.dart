import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:homelist/app.dart';
import 'package:homelist/firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const HomeList());
}
