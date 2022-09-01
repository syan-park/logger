// import 'package:logger/src/logger.dart';
// import 'package:logger/src/log_output.dart';

// /// Default implementation of [LogOutput].
// ///
// /// It sends everything to the system console.
// class ConsoleOutput extends LogOutput {
//   @override
//   void output(OutputEvent event) {
//     event.lines.forEach(print);
//   }
// }

import 'dart:io';
import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:logger/log_output.dart';
import 'package:logger/logger.dart';

const bool _kReleaseMode = kReleaseMode;

/// Default implementation of [LogOutput].
/// /// /// It sends everything to the system console.
class ConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    if (_kReleaseMode || !Platform.isIOS) {
      event.lines.forEach(debugPrint);
    } else {
      event.lines.forEach(developer.log);
    }
  }
}
