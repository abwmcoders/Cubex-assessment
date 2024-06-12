import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'locator.dart';
import 'src/features/splash/splash.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized;
  initializer();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: allProviders,
      child: const MaterialApp(
        title: 'Assessment App',
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
