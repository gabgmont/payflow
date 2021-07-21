
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModel? _user;

  UserModel get user => _user!;

  void setUser(BuildContext context, UserModel? user) {
    if (user != null) {
      saveUser(user);
      _user = user;
      print('Autenticou');
      Navigator.pushReplacementNamed(context, "/home", arguments: user);
    } else {
      print('Não Autenticou');
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  Future<void> saveUser(UserModel user) async{
    final instance = await SharedPreferences.getInstance();
    instance.setString('user', user.toJson());
  }

  Future<void> currentUser(BuildContext context) async{
    await Future.delayed(Duration(seconds: 1));
    final instance = await SharedPreferences.getInstance();
    if(instance.containsKey('user')){
      final json = instance.get('user') as String;
      setUser(context, UserModel.fromJson(json));
    }else{
      setUser(context, null);
    }
  }

}
