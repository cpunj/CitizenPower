

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference brewCollection= Firestore.instance.collection('user');
  Future updateUserData(String name,int mobile, String email,String password) async {
    return await brewCollection.document(uid).setData({
      'name':name,
'mobile':mobile,
'email':email,
'password':password,
    });
  }
}

