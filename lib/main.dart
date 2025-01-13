import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/app/bloc/app_bloc_observer.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await DIContainer.configureServices(env: "test");
  Bloc.observer = const AppBlocObserver();
  runApp(const AppPage());
}
