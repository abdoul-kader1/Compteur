import 'dart:async';
import 'package:flutter/material.dart';

class OpaciterTransition extends StatefulWidget {

  final int tempsApparution;
  final Widget child;
  const OpaciterTransition({super.key,required this.tempsApparution,required this.child});

  @override
  State<OpaciterTransition> createState() => _OpaciterTransitionState();
}

class _OpaciterTransitionState extends State<OpaciterTransition> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double>animation;
  Duration duration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this,duration: duration);
    animation = Tween<double>(begin: 0.05,end: 1).animate(CurvedAnimation(parent: controller, curve: Curves.linear));
    Timer(Duration(milliseconds: widget.tempsApparution), () {
      if(mounted)controller.forward();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: widget.child,
    );
  }
}
