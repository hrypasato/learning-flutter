import 'package:flutter/material.dart' show IconData, Icons;

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Botones',
    subTitle: 'Varios botones en flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Tarjetas',
    subTitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'ProgressIndicators',
    subTitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title: 'Snackbar',
    subTitle: 'Snackbars y diálogos',
    link: '/snackbar',
    icon: Icons.info_outline,
  ),
  MenuItem(
    title: 'Animated container',
    subTitle: 'Widget animado',
    link: '/animated',
    icon: Icons.check_box_outline_blank_rounded,
  ),
  MenuItem(
    title: 'UI Controls and Tiles',
    subTitle: 'Controles & tiles de flutter',
    link: '/controls',
    icon: Icons.control_point_duplicate_rounded,
  ),
  MenuItem(
    title: 'Tutorial',
    subTitle: 'Introduccion a la aplicacion',
    link: '/tutorial',
    icon: Icons.accessibility_new_sharp,
  ),
  MenuItem(
    title: 'Infinite',
    subTitle: 'Infinite scroll',
    link: '/infinite',
    icon: Icons.line_style_outlined,
  ),
  MenuItem(
    title: 'Counter',
    subTitle: 'Counter screen',
    link: '/counter',
    icon: Icons.add_circle_outline_rounded,
  ),
  MenuItem(
    title: 'Theme changer   ',
    subTitle: 'Theme changer screen',
    link: '/themes-changer',
    icon: Icons.change_circle_rounded,
  ),
];
