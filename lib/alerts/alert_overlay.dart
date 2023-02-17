import 'package:flutter/material.dart';
import '../models/alert_alignment.dart';
import '../widgets/custom_progress_indicator.dart';

class AlertOverlay extends StatefulWidget {
  final Duration duration;
  final Color backgroundColor;
  final Color accentColor;
  final IconData icon;
  final String title;
  final AlertAlignment alertAlignment;
  final double radius;

  const AlertOverlay({
    Key? key,
    required this.duration,
    required this.backgroundColor,
    required this.accentColor,
    required this.icon,
    required this.title,
    required this.alertAlignment,
    required this.radius,
  }) : super(key: key);

  @override
  State<AlertOverlay> createState() => _AlertOverlayState();
}

class _AlertOverlayState extends State<AlertOverlay>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;

  double progress = 0.0;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation =
        CurveTween(curve: Curves.fastOutSlowIn).animate(animationController!);
    animationController!.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.025,
      width: MediaQuery.of(context).size.width * 0.95,
      bottom: widget.alertAlignment == AlertAlignment.bottom
          ? MediaQuery.of(context).padding.bottom +
              kBottomNavigationBarHeight +
              30
          : null,
      top: widget.alertAlignment == AlertAlignment.top
          ? MediaQuery.of(context).padding.top + 30
          : null,
      child: FadeTransition(
        opacity: animation!,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.radius),
          child: Material(
            child: Column(
              children: [
                Container(
                  color: widget.backgroundColor,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Icon(
                        widget.icon,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                CustomProgressIndicator(
                  animationController: animationController,
                  color: Colors.white,
                  backgroundColor: widget.accentColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
