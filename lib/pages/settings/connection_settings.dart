import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConnectionSettingsPage extends StatefulWidget {
  const ConnectionSettingsPage({Key? key}) : super(key: key);

  @override
  State<ConnectionSettingsPage> createState() => _ConnectionSettingsPageState();
}

class _ConnectionSettingsPageState extends State<ConnectionSettingsPage> {
  final TextEditingController _adressController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  late Future<String> _adress;
  late Future<String> _name;

  static getSavedAdress() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? adress = prefs.getString('mainBaseAdress');
    return adress;
  }

  static getSavedName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? name = prefs.getString('mainBaseName');
    return name;
  }

  @override
  void initState() {
    super.initState();
    getSavedAdress();
    getSavedName();

    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      _adressController.text = await getSavedAdress();
    });
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      _nameController.text = await getSavedName();
    });
  }

  Row addRow(
      {bool isText = true,
      String? text = "",
      TextEditingController? controller}) {
    controller?.text = text!;
    return Row(children: [
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 30),
        child: controller == null
            ? Text(
                text!,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              )
            : SizedBox(
                width: MediaQuery.of(context).size.width - 30,
                child: TextField(
                  controller: controller,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                )),
      ),
    ]);
  }

  void saveSettings(String adress, String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('mainBaseAdress', adress);
    prefs.setString('mainBaseName', name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(),
      body: Column(children: [
        addRow(text: "Адрес"),
        addRow(controller: _adressController),
        addRow(text: "Название"),
        addRow(controller: _nameController),
        Row(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 10, left: 30),
                child: ElevatedButton(
                    onPressed: () {
                      saveSettings(
                          _adressController.text, _nameController.text);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Theme.of(context).primaryColor),
                    child: Text(
                      "Сохранить",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                          fontSize: 20),
                    )))
          ],
        )
      ]),
    );
  }
}
