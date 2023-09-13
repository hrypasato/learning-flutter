import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestores de estado'),
      ),
      body: ListView(children: [
        ListTile(
          title: const Text('Cubits'),
          subtitle: const Text('Gestor de estados simple'),
          trailing: const Icon(Icons.arrow_forward_outlined),
          onTap: () => {context.push('/cubits')},
        ),
        ListTile(
          title: const Text('Bloc'),
          subtitle: const Text('Gestor de estados bloc'),
          trailing: const Icon(Icons.arrow_forward_outlined),
          onTap: () => {context.push('/bloc')},
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Divider(),
        ),
      ]),
    );
  }
}
