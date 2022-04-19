import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final AddProvider = ChangeNotifierProvider<AddModel>(
      (ref) {
    return AddModel();
  },
);

class AddModel extends ChangeNotifier {
  String title  = '';

  Future addSet (User user) async {

    //ユーザ処理
    if (user == null) {
      throw 'ユーザが取得できませんでした。';
    }
    final uid = user.uid;

    DateTime now = DateTime.now();
    Timestamp createdAt = Timestamp.fromDate(now);

    //空のドキュメントを作成
    final doc = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('item')
        .doc();
    //ドキュメントのフィールドを設定
    await doc.set({
      'docId': doc.id,
      'title': title,
      'uid': uid,
      'createdAt': createdAt,
    });
  }

  void addItem (context, User user) async {
    try {
      //もしタイトルが入力されていない場合
      if (title.isEmpty) {
        throw 'タイトルが入力されていません。';
      }
      showGeneralDialog(
          context: context,
          barrierDismissible: false,
          barrierColor: Colors.black.withOpacity(0.5),
          pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white,),
            );
          }
      );
      //コレクションデータをFiretoreへ保存
      await addSet(user);
      //前画面（コレクションページ）へ戻る
      Navigator.of(context).pop(true); //showDialogを閉じる
      Navigator.of(context).pop(true);
    } catch (e) {
      //処理完了後スナックバー表示する
      final snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text(e.toString()),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

}