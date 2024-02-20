import 'package:_fe_analyzer_shared/src/macros/api.dart';

extension Diagnostics on Builder {
  void info(String msg) {
    report(Diagnostic(DiagnosticMessage(msg), Severity.info));
  }

  void error(String msg) {
    report(Diagnostic(DiagnosticMessage(msg), Severity.error));
  }
}

void info(Builder builder, String msg) {
  builder.report(Diagnostic(DiagnosticMessage(msg), Severity.info));
}
