import 'package:logger/logger.dart';

/// LoggerUtilは、[logger]パッケージを使用してアプリ内でログを出力するためのユーティリティクラスです。
class LoggerUtil {
  static final Logger _logger = Logger();

  static void logArguments(String methodName, Map<String, dynamic> arguments) {
    _logger.d('$methodName - Arguments: $arguments');
  }

  /// デバッグログを出力します。
  ///
  /// [message]はログに含めるテキストメッセージです。
  static void debug(String message) {
    _logger.d(message);
  }

  /// インフォログを出力します。
  ///
  /// [message]はログに含めるテキストメッセージです。
  static void info(String message) {
    _logger.i(message);
  }

  /// 警告ログを出力します。
  ///
  /// [message]はログに含めるテキストメッセージです。
  static void warning(String message) {
    _logger.w(message);
  }

  /// エラーログを出力します。
  ///
  /// [message]はログに含めるテキストメッセージです。
  static void error(String message) {
    _logger.e(message);
  }

  /// 例外エラーログを出力します。
  ///
  /// [exception]は発生した例外オブジェクトです。
  /// [stackTrace]はオプションのスタックトレースです。
  static void exception(dynamic exception, [StackTrace? stackTrace]) {
    _logger.e(exception, stackTrace: stackTrace);
  }
}
