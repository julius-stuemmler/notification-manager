import 'package:flutter/material.dart';

import '../models/alert_alignment.dart';
import 'alert_overlay.dart';

class AlertManager {
  final BuildContext context;

  AlertManager(this.context);

  // Confirmation Alert
  void showConfirmAlert({
    int? duration,
    IconData? icon,
    Color? backgroundColor,
    Color? accentColor,
    String? title,
    AlertAlignment? alertAlignment,
    double? borderRadius,
  }) async {
    _showAlert(
      icon ?? Icons.check_circle_rounded,
      backgroundColor ?? Colors.lightGreen,
      accentColor ?? const Color.fromARGB(255, 171, 199, 139),
      title ?? "Action succeeded!",
      alertAlignment,
      borderRadius,
      duration: duration,
    );
  }

  void showErrorAlert({
    int? duration,
    IconData? icon,
    Color? backgroundColor,
    Color? accentColor,
    String? title,
    AlertAlignment? alertAlignment,
    double? borderRadius,
  }) async {
    _showAlert(
      icon ?? Icons.error,
      backgroundColor ?? Colors.red,
      accentColor ?? const Color.fromARGB(255, 168, 69, 69),
      title ?? "Something went wrong!",
      alertAlignment,
      borderRadius,
      duration: duration,
    );
  }

  void showInfoAlert({
    int? duration,
    IconData? icon,
    Color? backgroundColor,
    Color? accentColor,
    String? title,
    AlertAlignment? alertAlignment,
    double? borderRadius,
  }) async {
    _showAlert(
      icon ?? Icons.info_outline_rounded,
      backgroundColor ?? Colors.blue,
      accentColor ?? const Color.fromARGB(255, 47, 100, 144),
      title ?? "Here are some information. Please read carefully!",
      alertAlignment,
      borderRadius,
      duration: duration,
    );
  }

  void showWarningAlert({
    int? duration,
    IconData? icon,
    Color? backgroundColor,
    Color? accentColor,
    String? title,
    AlertAlignment? alertAlignment,
    double? borderRadius,
  }) async {
    _showAlert(
      icon ?? Icons.warning_rounded,
      backgroundColor ?? Colors.amber,
      accentColor ?? const Color.fromARGB(255, 164, 139, 65),
      title ?? "Warning!",
      alertAlignment,
      borderRadius,
      duration: duration,
    );
  }

  void _showAlert(IconData icon, Color backgroundColor, Color accentColor,
      String title, AlertAlignment? alertAlignment, double? borderRadius,
      {int? duration}) async {
    OverlayEntry entry = OverlayEntry(
      builder: (context) => AlertOverlay(
        duration: Duration(milliseconds: duration ?? 6000),
        backgroundColor: backgroundColor,
        accentColor: accentColor,
        icon: icon,
        title: title,
        radius: borderRadius ?? 0.0,
        alertAlignment: alertAlignment ?? AlertAlignment.bottom,
      ),
    );
    Overlay.of(context).insert(entry);
    await Future.delayed(Duration(milliseconds: duration ?? 6000)).then(
      (value) {
        entry.remove();
      },
    );
  }
}
