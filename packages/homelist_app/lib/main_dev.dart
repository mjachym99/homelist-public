import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:homelist/app.dart';
import 'package:homelist/application/core/preferences.dart';
import 'package:homelist/firebase_options.dart';
import 'package:homelist/getit_config.dart';
import 'package:homelist/helpers/emulator_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAuth.instance.useAuthEmulator(
    EmulatorConfig.auth.baseUrl,
    EmulatorConfig.auth.port,
  );

  FirebaseFirestore.instance.useFirestoreEmulator(
    EmulatorConfig.firestore.baseUrl,
    EmulatorConfig.firestore.port,
  );

  FirebaseFunctions.instance.useFunctionsEmulator(
    EmulatorConfig.functions.baseUrl,
    EmulatorConfig.functions.port,
  );

  await PreferencesController.initialise();

  setupGetIt();
  runApp(const HomeList());
}

// Passy
// admin@homelist.com
// admin
