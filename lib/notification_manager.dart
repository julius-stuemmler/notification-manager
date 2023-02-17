import 'package:flutter/material.dart';

import 'alerts/alert_manager.dart';

class NotificationManager {
  final BuildContext context;
  late final AlertManager _alertManager;
  AlertManager get alerts => _alertManager;

  NotificationManager(this.context) {
    _alertManager = AlertManager(context);
  }

  static NotificationManager of(BuildContext context) {
    return NotificationManager(context);
  }
}
