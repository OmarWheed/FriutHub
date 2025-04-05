import 'package:flutter/material.dart';

class PrintMessage {
  final String message;
  const PrintMessage(this.message);
  void get r {
    debugPrint("❌ \x1B[31m$message\x1B[0m");
  }

  void get y {
    debugPrint("😎 \x1B[33m$message\x1B[0m");
  }

  void get g {
    debugPrint("✅ \x1B[32m$message\x1B[0m");
  }

  void get def {
    debugPrint("🔫 \x1B[35m$message\x1B[0m");
  }
}
