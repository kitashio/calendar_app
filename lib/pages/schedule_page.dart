import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SchedulePage extends StatelessWidget {
  final User user;
  SchedulePage(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black,),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .collection('item')
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

            if (!snapshot.hasData){
              return const Center(
                child: CircularProgressIndicator(color: Colors.grey,),
              );
            }

            final item = snapshot.data!.docs.map((snapshot) =>
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(snapshot.get('title')),
                ),
            ).toList();

            return Column(
              children: item,
            );
          }
        ),
      ),
    );
  }
}
