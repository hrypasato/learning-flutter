import 'package:flutter/material.dart';

class RecibeBubble extends StatelessWidget {
  const RecibeBubble({super.key});

  @override
  Widget build(BuildContext context) {
    //obtiene la paleta de colores
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              'Hola bebe',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const _ImageBubble(),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  const _ImageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    //toma el tamaño del dispositivo
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        'https://yesno.wtf/assets/yes/13-c3082a998e7758be8e582276f35d1336.gif',
        //usa el 70% del ancho de la pantalla
        width: size.width * 0.7,
        height: 150,
        //se ajusta al tamaño proporcionado
        fit: BoxFit.cover,
        //muestra un mensaje mientras se carga la imagen
        loadingBuilder: (context, child, loadingProgress) {
          //si ya termino de cargar, entonces presenta la imagen
          if (loadingProgress == null) return child;
          //mensaje que se muestra cuando se está cargando
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: const Text('Jade está escribiendo'),
          );
        },
      ),
    );
  }
}
