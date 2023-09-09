import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/shared/slides/slides.dart';

class TutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final PageController pageController = PageController();
  bool endTutorial = false;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      final page = pageController.page ?? 0;
      if (!endTutorial && page >= (slideInfoList.length - 1.6)) {
        setState(() {
          endTutorial = true;
        });
      }
    });
  }

  @override
  void dispose() {
    //Cuando se usa controladores siempre llamar al dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        //tutorial
        PageView(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          children: slideInfoList
              .map((slideData) => _Slide(
                  title: slideData.title,
                  caption: slideData.caption,
                  imageUrl: slideData.imageUrl))
              .toList(),
        ),
        //boton para saltar el tutorial
        Positioned(
            right: 20,
            top: 20,
            child: TextButton(
              child: const Text('Salir'),
              onPressed: () => context.pop(),
            )),
        //boton para finalizar el tutorial
        endTutorial
            ? Positioned(
                bottom: 30,
                right: 30,
                child: FadeInRight(
                  delay: const Duration(seconds: 1),
                  child: FilledButton(
                    child: const Text('Comenzar'),
                    onPressed: () => context.pop(),
                  ),
                ))
            : const SizedBox()
      ]),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;
  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl), fit: BoxFit.contain),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
