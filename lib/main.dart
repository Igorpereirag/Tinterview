import 'package:flutter/material.dart';
import 'viewers/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    home: Home(),


    debugShowCheckedModeBanner: false,
  ));
}
