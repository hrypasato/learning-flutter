import 'package:flutter/material.dart';

class ControlsScreen extends StatelessWidget {
  static const name = 'controls_screen';

  const ControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

enum Transportation { car, plane, boat, bike }

class _UiControlsView extends StatefulWidget {
  const _UiControlsView({
    super.key,
  });

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool hasBreakfast = false;
  bool hasLaunch = false;
  bool hasDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        //switch button
        SwitchListTile(
          title: const Text('Developer mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDeveloper,
          onChanged: (value) {
            setState(() {
              isDeveloper = !isDeveloper;
            });
          },
        ),
        //radio button
        ExpansionTile(
          title: const Text('Vehículo de transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              title: const Text('By car'),
              subtitle: const Text('Viajar por auto'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.car;
              }),
            ),
            RadioListTile(
              title: const Text('By boat'),
              subtitle: const Text('Viajar por bote'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.boat;
              }),
            ),
            RadioListTile(
              title: const Text('By plane'),
              subtitle: const Text('Viajar por avion'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.plane;
              }),
            ),
            RadioListTile(
              title: const Text('By bike'),
              subtitle: const Text('Viajar por bicicleta'),
              value: Transportation.bike,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.bike;
              }),
            ),
          ],
        ),
        //Checkbox
        CheckboxListTile(
          title: const Text('Desayuno'),
          subtitle: const Text('Mote pillo'),
          value: hasBreakfast,
          onChanged: (value) => setState(() {
            hasBreakfast = !hasBreakfast;
          }),
        ),
        CheckboxListTile(
          title: const Text('Almuerzo'),
          subtitle: const Text('Papas con queso'),
          value: hasLaunch,
          onChanged: (value) => setState(() {
            hasLaunch = !hasLaunch;
          }),
        ),
        CheckboxListTile(
          title: const Text('Merienda'),
          subtitle: const Text('Cuy asado'),
          value: hasDinner,
          onChanged: (value) => setState(() {
            hasDinner = !hasDinner;
          }),
        )
      ],
    );
  }
}
