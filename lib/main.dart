import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimationPage(),
    );
  }
}

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> size;
  late final Animation<double> turns;
  late final Animation<Color?> color;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    size = Tween<double>(begin: 100, end: 160).animate(controller);
    turns = Tween<double>(begin: 0, end: 0.5).animate(controller);
    color = ColorTween(
      begin: Colors.blue,
      end: Colors.pink,
    ).animate(controller);
  }

  void playAnimation() {
    if (controller.isCompleted) {
      controller.reverse();
    } else {
      controller.forward();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Animation')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: turns.value * 2 * 3.141592653589793,
                  child: Container(
                    width: size.value,
                    height: size.value,
                    decoration: BoxDecoration(
                      color: color.value,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.star,
                      size: 48,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: playAnimation,
              child: const Text('Animate'),
            ),
          ],
        ),
      ),
    );
  }
}
