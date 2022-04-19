import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MonthPage extends StatelessWidget {
  final User user;
  MonthPage(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(30,220,30,0),
        child: Column(
          children: [
            Text('monthPage')
          ],
        ),
      ),
    );
  }
}
