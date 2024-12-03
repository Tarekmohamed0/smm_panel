import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smm_panel/firebase_options.dart';

import 'app.dart';
import 'src/core/utils/shared/flutter_secure.dart';
import 'src/core/utils/shared/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SecureStorageHelper();
  runApp(const RootApp());
}
