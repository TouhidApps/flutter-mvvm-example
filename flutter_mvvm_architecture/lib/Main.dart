import 'package:flutter/material.dart';
import '../models/UserModel.dart';
import '../view/HomeScreen.dart';
import '../view/UserDetailsScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id : (context) => HomeScreen(),
        UserDetailsScreen.id : (context) => UserDetailsScreen(ModalRoute.of(context)!.settings.arguments as User),
      },
  ));
}

