import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_item.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  void _navigateToScreen(BuildContext context, int index) {
    setState(() {
      navDrawerIndex = index;
    });
    final menuItem = appMenuItems[index];
    context.push(menuItem.link);
    //cierra el menu
    widget.scaffoldKey.currentState?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    //comprueba si tiene espacio parala bocina
    bool hasNoch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
        //indice que con la opcion seleccionada
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value) => _navigateToScreen(context, value),
        children: _createItems(hasNoch));
  }

  List<Widget> _createItems(bool hasNoch) {
    return [
      Padding(
        padding: EdgeInsets.fromLTRB(28, hasNoch ? 0 : 20, 16, 10),
        child: const Text('Menu de app'),
      ),
      ..._createSection(appMenuItems.sublist(0, 3)),
      const Padding(
        padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
        child: Divider(),
      ),
      ..._createSection(appMenuItems.sublist(3))
    ];
  }

  List<Widget> _createSection(List<MenuItem> items) {
    return items.map((menuItem) {
      return _createMenuItem(menuItem);
    }).toList();
  }

  NavigationDrawerDestination _createMenuItem(MenuItem item) {
    return NavigationDrawerDestination(
        icon: Icon(item.icon), label: Text(item.title));
  }
}
