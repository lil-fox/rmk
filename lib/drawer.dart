import 'package:flutter/material.dart';
import 'package:rmk/pages/inventarisationpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/goods.dart';

// ignore: must_be_immutable
class MainDrawer extends StatefulWidget {
  MainDrawer._();

  static final MainDrawer _instance = MainDrawer._();

  String _userName = "";
  final List<DrawerFolder> _folders = [
    DrawerFolder(
      name: "Довідники",
      children: const {
        "Номенкатура": Icon(
          Icons.folder_sharp,
          color: Colors.white,
        )
      },
      pages: {"Номенкатура": GoodsPage()},
      //logo: Icons.book,
    ),
    DrawerFolder(
      name: "Документи",
      children: const {
        "Інвентаризація": Icon(
          Icons.article_outlined,
          color: Colors.white,
        )
      },
      pages: {"Інвентаризація": InventarisationPage()},
      //logo: Icons.file_open
    ),
    /*  DrawerFolder(
      name: "Данні",
      children: const {
        "Завантажити": Icon(Icons.article_outlined),
        "Вивантажити": Icon(Icons.article_outlined),
        "Вивантажити і Завантажити": Icon(Icons.article_outlined),
      },
      pages: [
        HomePage(userName: ""),
        HomePage(userName: ""),
        HomePage(userName: ""),
      ],
      //logo: Icons.data_array,
    ), */
  ];
  factory MainDrawer({userName = ""}) {
    if (userName != "") {
      _instance._userName = userName;
    }

    return _instance;
  }
  //MainDrawer({Key? key, this.userName = ""}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

// ignore: must_be_immutable
class DrawerFolder extends StatefulWidget {
  bool _expanded = true;
  late String _name;
  Map<String, Widget>? _children;
  Map<String, Widget> _pages = {};
  IconData? _logo;

  DrawerFolder(
      {Key? key,
      required String name,
      Map<String, Widget>? children,
      required Map<String, Widget> pages,
      IconData? logo})
      : super(key: key) {
    _name = name;
    _children = children;
    _pages = pages;
    _logo = logo;
  }

  @override
  State<DrawerFolder> createState() => _DrawerFolderState();
}

class _DrawerFolderState extends State<DrawerFolder> {
  @override
  void initState() {
    super.initState();
    isExpanded();
  }

  Future<SharedPreferences> getExpanded() async {
    return SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: getExpanded(),
      builder: (context, AsyncSnapshot<SharedPreferences> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return ListTileTheme(
              minLeadingWidth: 0,
              horizontalTitleGap: 10,
              //minVerticalPadding: 0,
              child: ExpansionTile(
                initiallyExpanded: widget._expanded,
                onExpansionChanged: (_) {
                  widget._expanded = !widget._expanded;
                  setExpansion(widget._expanded);
                },
                backgroundColor: Theme.of(context).primaryColor,
                collapsedBackgroundColor: Theme.of(context).primaryColor,
                collapsedIconColor: Colors.white,
                /* leading: Icon(
                  widget._logo,

                  //color: Colors.white,
                ) */
                //childrenPadding: const EdgeInsets.only(left: 50),
                title: Row(
                  children: [
                    //if (widget._logo != null)

                    Text(
                      widget._name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
                children: [
                  for (String key in widget._children!.keys)
                    Row(
                      children: [
                        //SizedBox(width: 10),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              key,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            leading: widget._children![key],
                            iconColor: Colors.white,
                            onTap: () {
                              Widget pg = widget._pages[key] as Widget;
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (_) => pg),
                                (Route<dynamic> route) => false,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            );
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }

  void isExpanded() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool? isExpanded = prefs.getBool(widget._name + "_isExpanded");

    if (isExpanded != null && widget._expanded != isExpanded) {
      widget._expanded = isExpanded;
    }
  }

  void setExpansion(bool expansion) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(widget._name + "_isExpanded", expansion);
  }
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).primaryColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 123,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  //borderRadius: BorderRadius.only(topRight: Radius.circular(10)),
                  color: Colors.blue,
                ),
                child: Text(widget._userName),
                margin: EdgeInsets.zero,
                //padding: EdgeInsets.zero,
              ),
            ),
            ...widget._folders
          ],
        ));
  }
}
