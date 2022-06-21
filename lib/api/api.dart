import 'package:shared_preferences/shared_preferences.dart';
import '../domain/inventarisation.dart';

Future<bool> auth(login, password) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  if (login == "qwerty" && password == "123") {
    prefs.setString('login', login);
    prefs.setString('isLoged', "true");
    return Future.delayed(
      const Duration(seconds: 0),
      () => true,
    );
  }

  return Future.delayed(
    const Duration(seconds: 0),
    () => false,
  );
}

Future<bool> logOut() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('isLoged', "false");
  return Future.delayed(
    const Duration(seconds: 0),
    () => true,
  );
}

Future<List> getGoods() {
  return Future.delayed(
    const Duration(seconds: 0),
    () => [],
  );
}

Future<List> getInventarisationDoc() {
  return Future.delayed(
    const Duration(seconds: 0),
    () => [
      Inventarisation(number: "001", date: "", author: "test_user", goods: [])
    ],
  );
}
