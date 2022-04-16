import 'dart:math';

class OtpGenerator {
  final random = Random();
  String getCode() {
    return (random.nextInt(900000) + 100000).toString();
  }
}
