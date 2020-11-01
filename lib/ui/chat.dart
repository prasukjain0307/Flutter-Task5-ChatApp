import 'dart:ffi';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

User userLog;
final firestore = FirebaseFirestore.instance;
class Chat extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
   String mText;
  final mtc = TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        userLog = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
         
              IconButton(icon: Icon(Icons.my_location), onPressed:(){print("profile clicked");}),
               IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('WhatsChat'),
        backgroundColor: Colors.cyan
      ),
      body: SafeArea(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MStrm(),
            Container(
             margin: EdgeInsets.only(bottom: 5),
              decoration:BoxDecoration(
                border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
                // color: Colors.blueGrey.shade200,
                borderRadius: BorderRadius.circular(25),
),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: mtc,
                      onChanged: (value) {
                        mText = value;
                      },
                      decoration: InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'message...',
  border: InputBorder.none,
),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      mtc.clear();
                      firestore.collection('prasuk_chat').add({
                        'text': mText,
                        'sender': userLog.email,
                      });
                    },
                    // child: IconButton(icon: Icon(Icons.send), onPressed: (){print("send");},color: Colors.black,),
                    child: Text(
                      'Send'??'send',
                      style:TextStyle(
  color: Colors.black,
  backgroundColor: Colors.yellow,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MStrm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('prasuk_chat').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final data = snapshot.data.docs.reversed;
        List<MessData> messageBubbles = [];
        for (var message in data) {
          final messageText = message.data()['text'];
          final messageSender = message.data()['sender'];
          var currentUser = userLog.email;
          var messageBubble = MessData(
            sender: messageSender,
            text: messageText,
            isMe: currentUser == messageSender,
          );
          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(         
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class MessData extends StatelessWidget {
  MessData({this.sender, this.text, this.isMe});

  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: 
      Container(
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: <Widget>[    
            Material(
              borderRadius: BorderRadius.circular(25),
              elevation: 5.0,
              color: isMe ? Colors.yellow.shade300: Colors.grey,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Column(
                  children: <Widget>[
                    Text(
              sender??'sender',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.black54,
              ),),
              SizedBox(
                height: 2,
              ),
                    Text(
                      text??'text',
                      style: TextStyle(
                        color: isMe ? Colors.black : Colors.black,
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}