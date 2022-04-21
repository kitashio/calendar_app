import 'package:calender_app/add_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddSchedulePage extends ConsumerWidget {
  AddSchedulePage(this.user, {Key? key}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black,),
        elevation: 0.0,
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios, color: Colors.black,),
            onPressed: () {
              ref.read(AddProvider).addItem(context, user);
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  labelText: '予定',
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  )
              ),
              onChanged: (text){
                ref.read(AddProvider).title = text;
              },
            ),
            SizedBox(height: 20,),
            Container(
              height: 60,
              child: CupertinoDatePicker(
                initialDateTime: ref.read(AddProvider).selectDate,
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (dateTime) {
                  ref.read(AddProvider).selectDate = dateTime;
                },
              ),
            ),
          ],
        )
      ),
    );
  }
}
