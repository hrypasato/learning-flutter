import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class RecibeBubble extends StatelessWidget {
  final Message message;
  const RecibeBubble({super.key, required this.message});

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              message.text,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        _ImageBubble(imageUrl: message.imageUrl!),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;
  const _ImageBubble({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    //toma el tamaño del dispositivo
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
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
