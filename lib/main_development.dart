import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smm_panel/firebase_options.dart';

import 'app.dart';
import 'src/core/config/config.dart';
import 'src/core/utils/app_bloc_observer.dart';
import 'src/core/utils/shared/flutter_secure.dart';
import 'src/core/utils/shared/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  // bloc observer
  Bloc.observer = AppBlocObserver();
  Setup();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SecureStorageHelper();
  runApp(const RootApp());
}
