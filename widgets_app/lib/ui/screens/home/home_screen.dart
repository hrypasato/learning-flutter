import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_item.dart';
import 'package:widgets_app/ui/widgets/drawers/side_menu.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    /**
     * Cuando es screen entonces retornar un Scafold
     */
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + material 3'),
      ),
      body: const _HomeView(),
      /**
       * Menu en las partes laterales
       * Drawer: es un menu que se abre de izquierda a derecha
       * endDrawer: es un mennu que se abre de derecha a izquierda
       */
      drawer: SideMenu(
        scaffoldKey: scaffoldKey,
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        return _CustomListTile(menuItem: menuItem, colors: colors);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    super.key,
    required this.menuItem,
    required this.colors,
  });

  final MenuItem menuItem;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      leading: Icon(
        menuItem.icon,
        color: colors.primary,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_outlined,
        color: colors.primary,
      ),
      onTap: () {
        context.push(menuItem.link);
      },
    );
  }
}
