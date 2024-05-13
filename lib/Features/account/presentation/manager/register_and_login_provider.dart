import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/Features/account/data/model/user.dart' as myuser;

import '../../data/user_dao.dart';

class MyAuthProvider extends ChangeNotifier {
  myuser.User? databaseUser;
  User? firebaseAuthUser;

  register(
      String fullName, String userName, String email, String password) async {
    var credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await UserDao.addUser(myuser.User(
      id: credential.user?.uid,
      fullName: fullName,
      userName: userName,
      email: email,
    ));
  }

  login(String email, String password) async {
    var userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    var user = await UserDao.getUser(userCredential.user!.uid);
    databaseUser = user;
    firebaseAuthUser = userCredential.user;
  }
}
