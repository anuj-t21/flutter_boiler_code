import 'package:flutter/foundation.dart';

class Failure {
  final String message;
  Failure([this.message = 'An unexpected error occurred']) {
    if (kDebugMode) {
      print('ERROR: $message');
    }
  }
}
