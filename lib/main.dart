import 'package:flutter/material.dart';
import 'package:todolist/presentation/pages/home.dart';
import 'package:todolist/presentation/pages/personaltask.dart';
import 'package:todolist/presentation/pages/worktask.dart';
import 'presentation/pages/splashscreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes:{
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomePage.routeName: (context) => const HomePage(),
        WorkTask.routeName: (context) => const WorkTask(),
        PersonalTask.routeName: (context) => const PersonalTask(),
      }
    );
  }
}
