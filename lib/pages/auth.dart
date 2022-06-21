import 'package:flutter/material.dart';
import 'package:rmk/appbar.dart';
import 'package:rmk/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/api.dart';

class AuthorisationPage extends StatefulWidget {
  const AuthorisationPage({Key? key}) : super(key: key);

  @override
  State<AuthorisationPage> createState() => _AuthorisationPageState();
}

class _AuthorisationPageState extends State<AuthorisationPage> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _login = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    Future<void> _loginUser() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      String? baseAdress = prefs.getString("mainBaseAdress");
      String? baseName = prefs.getString("mainBaseName");

      if (baseAdress == "" || baseName == "") {
        final scaffold = ScaffoldMessenger.of(context);
        scaffold.showSnackBar(
          const SnackBar(
            content: Text('Укажите адрес и имя базы данных'),
          ),
        );
        return;
      }

      _login = _loginController.text;
      _password = _passwordController.text;

      if (_login.isEmpty || _password.isEmpty) return;

      bool authed = await auth(_login, _password);

      if (authed) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => HomePage(userName: _login)),
          (Route<dynamic> route) => false,
        );

        /* _loginController.clear();
        _passwordController.clear(); */
      } else {
        final scaffold = ScaffoldMessenger.of(context);
        scaffold.showSnackBar(
          const SnackBar(
            content: Text('Невірний логін або пароль'),
          ),
        );
        return;
      }
    }

    Widget _picture() {
      return const Padding(
          padding: EdgeInsets.only(top: 20, left: 30, right: 30),
          child: Image(
            image: AssetImage("assets/logo.png"),
          ));
    }

    Widget _logo() {
      return const Padding(
        padding: EdgeInsets.only(top: 5),
        child: Align(
          child: Text(
            "Авторизація",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      );
    }

    Widget _button(String label, void Function() funk) {
      return ElevatedButton(
          onPressed: () {
            funk();
          },
          style: ElevatedButton.styleFrom(
              primary: Colors.white, onPrimary: Theme.of(context).primaryColor),
          child: Text(
            label,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
                fontSize: 20),
          ));
    }

    Widget _form(String label, void Function() funk) {
      return Column(children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20, top: 10),
          child: _input("Логін", _loginController, false),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: _input("Пароль", _passwordController, true),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: _button(label, funk),
          ),
        )
      ]);
    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: const PreAuthBar(),
      body: Column(children: [_picture(), _logo(), _form('Вхід', _loginUser)]),
    );
  }

  Widget _input(String hint, TextEditingController controller, bool hideInput) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: controller,
        obscureText: hideInput,
        style: const TextStyle(fontSize: 20, color: Colors.white),
        decoration: InputDecoration(
            hintStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white30),
            hintText: hint,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3)),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white54, width: 1))),
      ),
    );
  }
}
