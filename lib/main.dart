import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shivapardaz_test/features/main/presentation/pages/main_page.dart';

import 'features/main/presentation/bloc/photo_bloc.dart';
import 'init_dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => serviceLocator<PhotoBloc>(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: MainPage(),
        ));
  }
}
