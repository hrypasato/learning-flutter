import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          //progress indicator infinite
          SizedBox(
            height: 30,
          ),
          Text('Circular progress indicator'),
          SizedBox(
            height: 10,
          ),
          CircularProgressIndicator(
            strokeWidth: 3,
            backgroundColor: Colors.black12,
          ),
          //progress controled
          SizedBox(
            height: 20,
          ),
          Text('Circular indicator controled'),
          SizedBox(
            height: 10,
          ),
          _ControledProgressIndicator()
        ],
      ),
    );
  }
}

class _ControledProgressIndicator extends StatelessWidget {
  const _ControledProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      /**
       * Funcion que emite cada 300 millisegundos, 
       * el valor inicia en 0 y continua incrementando mientras
       * el valor sea menor a 100 
       */
      stream: Stream.periodic(const Duration(milliseconds: 300), (count) {
        return (count * 2) / 100;
      }).takeWhile((count) => count < 100),
      builder: (context, snapshot) {
        final progressValue = snapshot.data ?? 0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                value: progressValue,
                strokeWidth: 3,
                backgroundColor: Colors.black12,
              ),
              const SizedBox(
                width: 20,
              ),
              //Toma todo el ancho disponible del padre
              Expanded(
                child: LinearProgressIndicator(
                  value: progressValue,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
