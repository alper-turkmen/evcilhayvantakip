import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled1/register.dart';
import 'package:untitled1/views/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void initState() {
    super.initState();
    getCurrentUser();
  }

  String? email;
  String? password;
  final _auth = FirebaseAuth.instance;

  User? loggedInUser;

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        Route route = MaterialPageRoute(builder: (context) => HomePage());
        Navigator.push(context, route);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(
                "Hayvan Takip \nSistemi\n",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "Giriş Yap\n",
                style: TextStyle(
                    color: Colors.black87.withOpacity(0.8),
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                onChanged: (value) {},
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(15),
                    filled: true,
                    fillColor: MediaQuery.of(context).platformBrightness ==
                            Brightness.dark
                        ? Colors.grey.shade700
                        : Color(0xFFF1F1F1),
                    hintText: "Kullanıcı Adı",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 19),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(15.0)))),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {},
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(15),
                    filled: true,
                    fillColor: MediaQuery.of(context).platformBrightness ==
                            Brightness.dark
                        ? Colors.grey.shade700
                        : Color(0xFFF1F1F1),
                    hintText: "Şifre",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 19),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(15.0)))),
              ),
              Row(
                children: [
                  MaterialButton(
                    onPressed: () async {
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email!, password: password!);
                        if (user != null) {
                          Route route = MaterialPageRoute(
                              builder: (context) => HomePage());
                          Navigator.push(context, route);
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text('Giriş Yap'),
                  ),
                  MaterialButton(
                    onPressed: () async {
                      Route route =
                          MaterialPageRoute(builder: (context) => Register());
                      Navigator.push(context, route);
                    },
                    child: Text('Kayıt Ol'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
