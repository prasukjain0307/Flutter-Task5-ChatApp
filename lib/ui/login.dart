import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chat_app/ui/chat.dart';

class Login extends StatelessWidget {

String email;
  String password;
  var authc = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(
        color:Colors.white24
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new ClipPath(
            clipper: MyClipper(),
            child: Container(
              decoration: BoxDecoration(
                image: new DecorationImage(
                   image: NetworkImage('https://images.unsplash.com/photo-1465146633011-14f8e0781093?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 150.0, bottom: 100.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color:  Color(0xFF4aa0d5)),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Text(
              "Email",
              style: TextStyle(color: Colors.black, fontSize: 16.0),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            margin:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Row(
              children: <Widget>[
                new Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Icon(
                    Icons.person_outline,
                    color: Colors.black,
                  ),
                ),
                Container(
                  height: 30.0,
                  width: 1.0,
                  color: Colors.black,
                  margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                ),
                new Expanded(
                  child: TextField(
                        onChanged: (value) {
                  email = value;
                },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Text(
              "Password",
              style: TextStyle(color: Colors.black, fontSize: 16.0),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            margin:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Row(
              children: <Widget>[
                new Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Icon(
                    Icons.lock_open,
                    color: Colors.black,
                  ),
                ),
                Container(
                  height: 30.0,
                  width: 1.0,
                  color: Colors.black,
                  margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                ),
                new Expanded(
                  child: TextField(
                onChanged: (value) {
                  password = value;
                },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    splashColor: Colors.grey,
                    color:  Color(0xFF4aa0d5),
                    child: new Row(
                      children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            "LOGIN",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        new Expanded(
                          child: Container(),
                        ),
                        new Transform.translate(
                          offset: Offset(15.0, 0.0),
                          child: new Container(
                            padding: const EdgeInsets.all(5.0),
                            child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                  new BorderRadius.circular(28.0)),
                              splashColor: Colors.white,
                              color: Colors.white,
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.black,
                              ),
                              onPressed: () => {},
                            ),
                          ),
                        )
                      ],
                    ),
                    onPressed: () async {
                    try {
                      var user = await authc.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      print(email);
                      print(password);
                      print(user);

                      if (user.additionalUserInfo.isNewUser == true) {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Chat()));
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    splashColor: Color(0xFF3B5998),
                    color: Color(0xff3B5998),
                    child: new Row(
                      children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            "LOGIN WITH FACEBOOK",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        new Expanded(
                          child: Container(),
                        ),
                        new Transform.translate(
                          offset: Offset(15.0, 0.0),
                          child: new Container(
                            padding: const EdgeInsets.all(5.0),
                            child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                  new BorderRadius.circular(28.0)),
                              splashColor: Colors.white,
                              color: Colors.white,
                              child: Icon(
                                const IconData(0xea90, fontFamily: 'icomoon'),
                                color: Color(0xff3b5998),
                              ),
                              onPressed: () => {},
                            ),
                          ),
                        )
                      ],
                    ),
                    onPressed: () => {},
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.transparent,
                    child: Container(
                      padding: const EdgeInsets.only(left: 20.0),
                      alignment: Alignment.center,
                      child: Text(
                        "DON'T HAVE AN ACCOUNT?",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onPressed: () => {},
                  ),
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = new Path();
    p.lineTo(size.width, 0.0);
    p.lineTo(size.width, size.height * 0.85);
    p.arcToPoint(
      Offset(0.0, size.height * 0.85),
      radius: const Radius.elliptical(50.0, 10.0),
      rotation: 0.0,
    );
    p.lineTo(0.0, 0.0);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}





// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// // import 'package:firebase_app/screen/chat.dart';
// import 'package:firebase_app/screen/terminal.dart';
// import 'package:firebase_app/screen/terminal.dart';




// class MyReg extends StatefulWidget {
//   @override
//   _MyRegState createState() => _MyRegState();
// }

// class _MyRegState extends State<MyReg> {
//   var authc = FirebaseAuth.instance;

//   String email;
//   String password;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Registration'),
//         backgroundColor: Colors.yellow,
//         actions: <Widget>[
//           IconButton(icon: Icon(Icons.person), onPressed: null)
//         ],
//       ),
//       body: Center(
        
//         child: Container(
//           margin: EdgeInsets.only(top: 10),
//           width: 300,
//           child: Column(
//         children: <Widget>[
//           SizedBox(
//             height: 70,
//           ),
//           TextField(
//             onChanged:(value)
//             {
//               email = value;
//             },
//             decoration: InputDecoration(
//                 hintText: 'Email',
//                 border:OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5),
//                 )
//             ),
//           ),  

//           SizedBox(
//             height:20,
//           ),

//            TextField(
//             onChanged:(value)
//             {
//               password = value;
//             },
//             decoration: InputDecoration(
//                 hintText: 'Password',
//                 border:OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5),
//                 )
//             ),
//           ),
           
//          SizedBox(
//             height: 20,
//           ),

//          Material(
//             color: Colors.yellow.shade400,
//             borderRadius: BorderRadius.circular(20),
//             elevation: 35,
//             child:MaterialButton(
//               minWidth: 200,
//               height: 40,
//               child: Text('submit'),
//               onPressed: () async {
//               try
//               {
//                 var user = await authc.createUserWithEmailAndPassword(email: email, password: password);
//                 print(email);
//                       print(password);
//                       print(user);
    
//                if (user.additionalUserInfo.isNewUser == true) {
//                         // Navigator.pushNamed(context, "chat");
//                         Navigator.pushNamed(context, "linuxcmd");
//                       }
//               }
//                catch (e) {
//                       print(e);
//                }
//               }
               
//               )

//           ),
//         ],
//       ),
//         ),
//       ),
      
//     );
//   }
// }