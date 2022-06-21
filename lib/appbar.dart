import 'package:flutter/material.dart';
import 'package:rmk/pages/settings/connection_settings.dart';
import '../api/api.dart';
import '../pages/auth.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  static const _menuItems = <String>["Обмен", "Настройки", "Выход"];
  final List<PopupMenuItem<String>> _actions = _menuItems
      .map((value) => PopupMenuItem<String>(
          child: Text(
            value,
            style: const TextStyle(color: Colors.black),
          ),
          value: value))
      .toList();
  MainAppBar({
    Key? key,
    this.title = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        PopupMenuButton<String>(
          onSelected: (String value) {
            if (value == "Выход") {
              logOut();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const AuthorisationPage()),
                (Route<dynamic> route) => false,
              );
            }
            if (value == "Настройки") {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const ConnectionSettingsPage()),
              );
            }
          },
          itemBuilder: (context) => _actions,

          icon: const Icon(
            Icons.settings,
            color: Colors.white,
          ),
          //label: const SizedBox.shrink(),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class PreAuthBar extends StatelessWidget implements PreferredSizeWidget {
  const PreAuthBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //title: Text(title),
      actions: [
        TextButton.icon(
            onPressed: () {
              logOut();
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const ConnectionSettingsPage()),
              );
            },
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            label: const SizedBox.shrink())
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
