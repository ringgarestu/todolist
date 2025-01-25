import 'package:flutter/material.dart';
import 'dart:async';
import 'package:todolist/presentation/pages/home.dart';

class SplashScreen extends StatefulWidget {
static const String routeName = '/splash';

const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds:3),(){
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: const Color(0xFF5C68A1),
        body: Stack(

          children:[
        Center(
          child: Image.asset('assets/images/todolist.png'),
        ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:  EdgeInsets.all(45),
              child:Column(
                mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Welcome to To-Do-List',
                   style: TextStyle(
                       fontSize: 25,
                       color:Colors.white,
                       fontWeight: FontWeight.w800
                   ),),Text(
                  'List What You Do',
                  style: TextStyle(
                    fontSize: 18,
                      color: Colors.white
                  ),),]
            ),
          ),),],),);
  }
}
