import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  void resetValue() {
    setState(() {
      clickCounter = 0;
    });
  }

  void increment() {
    setState(() {
      clickCounter++;
    });
  }

  void decrement() {
    setState(() {
      if (clickCounter == 0) {
        return;
      }

      clickCounter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter functions'),
          leading: IconButton(
            icon: const Icon(Icons.functions),
            onPressed: resetValue,
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                clickCounter.toString(),
                style: const TextStyle(
                  fontSize: 160,
                  fontWeight: FontWeight.w100,
                ),
              ),
              Text(clickCounter != 1 ? 'Clicks' : 'Click'),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              icon: Icons.refresh_outlined,
              onPressed: resetValue,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              icon: Icons.plus_one_outlined,
              onPressed: increment,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              icon: Icons.exposure_minus_1_outlined,
              onPressed: decrement,
            ),
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(
        icon,
      ),
    );
  }
}
