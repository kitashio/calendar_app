import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'bottom_tab.dart';

class FirstPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(30,220,30,0),
        child: Column(
          children: [
           ElevatedButton(
               onPressed: () async {
                 await FirebaseAuth.instance.signInAnonymously();
                 User? user = FirebaseAuth.instance.currentUser;

                 //ユーザ情報が既に登録されているか確認
                 var userDoc = await FirebaseFirestore.instance
                     .collection('users').doc(user?.uid).get();

                 if (user != null) {
                   //既存ユーザでなければFirestoreに登録
                   if (!userDoc.exists) {
                     final doc = FirebaseFirestore.instance.collection('users').doc(user.uid);
                     await doc.set({
                       'uid': user.uid,
                     });
                   }
                   await Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => BottomTabPage(user)),
                   );
                 } else {
                   const snackBar =  SnackBar(
                     backgroundColor: Colors.red,
                     content: Text('ログインできませんでした'),
                   );
                   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                 }
               },
               child: Text('さっそく始める！')),
          ],
        ),
      ),
    );
  }
}
