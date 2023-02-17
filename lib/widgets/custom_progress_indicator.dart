import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatefulWidget {
  final int duration; // in ms
  final Color color;
  final Color backgroundColor;
  final AnimationController? animationController;

  const CustomProgressIndicator({super.key, 
    this.duration = 5000,
    this.color = Colors.red,
    this.backgroundColor = const Color(0xfffc7c7c),
    this.animationController,
  });

  @override
  State<CustomProgressIndicator> createState() => _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: widget.duration,
      ),
    )..addListener(() {
        setState(() {});
        if(controller.value == 1.0){
          widget.animationController?.reverse();
        }
      });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      minHeight: 5,
      value: controller.value,
      color: widget.color,
      backgroundColor: widget.backgroundColor,
    );
  }
}
