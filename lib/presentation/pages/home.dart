import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/presentation/pages/personaltask.dart';
import 'package:todolist/presentation/pages/worktask.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              const SizedBox(width: 10),
              const  Expanded(
              child:Text(
                'Choose Your Task Category',
                style:
                    TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
              ),
              ),
            ],
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WorkTask()),
                );
              },
              child: const Card(
                color: Color(0xFF5C68A1),
                child: _SampleCard(
                  cardName: 'Work',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PersonalTask()),
                );
              },
              child: const Card(
                color: Color(0xFF5C68A1),
                child: _SampleCard(
                  cardName: 'Personal',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize:25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SampleCard extends StatelessWidget {
  const _SampleCard({required this.cardName, required this.style});
  final String cardName;
  final TextStyle style;

  Widget build(BuildContext context) {
    return SizedBox(
        width: 300,
        height: 100,
        child: Center(
          child: Text(cardName, style: style),
        ));
  }
}
