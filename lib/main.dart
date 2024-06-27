import 'package:ass_minimal_shop/screens/splash/splash_screen.dart';
import 'package:ass_minimal_shop/services/cache_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'routes.dart';
import 'theme.dart';

void main() {
  runApp(mininalShopCacheApp());
}

Widget mininalShopCacheApp() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CacheLogic()),
    ],
    child: const LodingScreen(),
  );  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    int modeIndex = context.watch<CacheLogic>().modeIndex;

    ThemeMode themeMode = ThemeMode.light;

    switch (modeIndex) {
      case 1:
        themeMode = ThemeMode.light;
        break;
      case 2:
        themeMode = ThemeMode.dark;
        break;
      case 3:
        themeMode = ThemeMode.system;
        break;
      default:
        themeMode = ThemeMode.system;
    }
    return MaterialApp(
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      title: 'Minimal Shop',
      darkTheme: AppTheme.darkTheme(context),
      theme: AppTheme.lightTheme(context),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}

class LodingScreen extends StatelessWidget {
  const LodingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<CacheLogic>().initCache(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const MyApp();
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}