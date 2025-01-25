import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalTask extends StatefulWidget {
  const PersonalTask({Key? key}) : super(key: key);

  static const String routeName = '/personal';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<PersonalTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0XFF5C68A1),
          title:Row(
            children: [
              Image.asset('assets/images/todolist.png', fit: BoxFit.contain, height: 50,),
              const Text('Personal Task', style: TextStyle(
                  fontWeight: FontWeight.w900, color: Colors.white
              ),
              ),
            ],
          )
      ),
    );
  }
}



