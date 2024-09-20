part of '../app_services.dart';

class AppHaptic {
  AppHaptic._();

  void hapticLight() {
    HapticFeedback.lightImpact();
  }

  void hapticMedium() {
    HapticFeedback.mediumImpact();
  }

  void hapticHeavy() {
    HapticFeedback.heavyImpact();
  }

  void hapticVibrate() {
    HapticFeedback.vibrate();
  }

  void selectionClick() {
    HapticFeedback.selectionClick();
  }
}
