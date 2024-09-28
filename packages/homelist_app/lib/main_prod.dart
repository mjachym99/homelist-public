import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:homelist/app.dart';
import 'package:homelist/application/core/preferences.dart';
import 'package:homelist/firebase_options.dart';
import 'package:homelist/getit_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await PreferencesController.initialise();

  if (kIsWeb) {
    await FirebaseAuth.instance.setPersistence(Persistence.NONE);
  }

  setupGetIt();

  runApp(const HomeList());
}

// Passy
// admin@homelist.com
// admin
