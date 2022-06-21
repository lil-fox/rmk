import 'package:flutter/material.dart';
import 'package:rmk/pages/auth.dart';
import 'package:rmk/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool isLoged = false;
  String username = "";
  @override
  Widget build(BuildContext context) {
    return const AuthorisationPage();
    //return const ProductItemPage();
  }

  @override
  void initState() {
    super.initState();
    relogin();
  }

  void relogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? login = prefs.getString('login');
    String? isLogedStored = prefs.getString('isLoged');
    if (login != null && isLogedStored != null && isLogedStored == "true") {
      setState(() {
        isLoged = true;
        Navigator.pushAndRemoveUntil(
          context,
          //MaterialPageRoute(builder: (_) => const ProductItemPage()),
          MaterialPageRoute(builder: (_) => HomePage(userName: login)),
          (Route<dynamic> route) => false,
        );
      });
      return;
    }
  }
}
