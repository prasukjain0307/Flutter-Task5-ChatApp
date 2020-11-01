import 'package:chat_app/ui/chat.dart';
import 'package:chat_app/ui/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() { 
   WidgetsFlutterBinding.ensureInitialized();
  Firebase.initialiszeApp();
  runApp( MyHomePage ());
  }



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}
 var fb1=Firebase.initializeApp();

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();

    return Scaffold(
   
     resizeToAvoidBottomPadding: false,
   
     body:
            Login(), 
               
    );
  }   
  }



