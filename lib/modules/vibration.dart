import 'package:vibration/vibration.dart';

class MVibration {
  static vibrate() async {
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate(duration: 250);
    }
  }

  static vibrateLong() async {
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate(duration: 500);
    }
  }

  static customVibrations() async {
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate(duration: 250);
      await Future.delayed(Duration(milliseconds: 500));
      Vibration.vibrate(duration: 250);
    }
  }
}
