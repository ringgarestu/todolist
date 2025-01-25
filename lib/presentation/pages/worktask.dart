import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkTask extends StatefulWidget {
  const WorkTask({Key? key}) : super(key: key);

  static const String routeName = '/work task';

  @override
  _WorkTaskState createState() => _WorkTaskState();
}

class _WorkTaskState extends State<WorkTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF5C68A1),
        title: Row(
          children: [
            Image.asset(
              'assets/images/todolist.png',
              fit: BoxFit.contain,
              height: 50,
            ),
            const Text(
              'Work Task',
              style:
                  TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          _showAddWorkTaskBottomSheet(context);
        },
        child: Image.asset('assets/images/plus.png'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _showAddWorkTaskBottomSheet() {
    return Container();
  }
}
