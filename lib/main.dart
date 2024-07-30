import 'package:cadeau_app/screens/login.dart';
import 'package:cadeau_app/screens/main_screen.dart';
import 'package:cadeau_app/services/cache_helper.dart';
import 'package:flutter/material.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.cacheInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // textTheme: GoogleFonts.jostTextTheme(
        //   Theme.of(context).textTheme,
        // ),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple), // Set the background color to white

        useMaterial3: true,
      ),
      home: FutureBuilder<String?>(
    future: CacheHelper.getToken(),
    builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
    return const CircularProgressIndicator();
    } else if (snapshot.hasData && snapshot.data != null) {
    return const MainScreen();
    } else {
    return const LoginScreen();
    }
    },
    ));
  }
}
