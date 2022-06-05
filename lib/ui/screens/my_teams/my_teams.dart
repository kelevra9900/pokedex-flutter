import 'package:flutter/material.dart';

class MyTeamsScreen extends StatefulWidget {
  const MyTeamsScreen({Key? key}) : super(key: key);

  @override
  State<MyTeamsScreen> createState() => _MyTeamsScreenState();
}

class _MyTeamsScreenState extends State<MyTeamsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('My Teams'),
      ),
    );
  }
}
