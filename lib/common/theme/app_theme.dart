import 'package:flutter/material.dart';

/// アプリのテーマを管理するクラスです。
class AppTheme {
  // 共通のテーマ設定を定義します
  static final ThemeData baseTheme = ThemeData(
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: Colors.orange),
    // fontFamily: 'SourceSansPro',
    textTheme: TextTheme(
      displaySmall: const TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 45.0,
        // fontWeight: FontWeight.w400,
        color: Colors.orange,
      ),
      labelLarge: const TextStyle(
        // OpenSans is similar to NotoSans but the uppercases look a bit better IMO
        fontFamily: 'OpenSans',
      ),
      bodySmall: TextStyle(
        fontFamily: 'NotoSans',
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: Colors.deepPurple[300],
      ),
      displayLarge: const TextStyle(fontFamily: 'Quicksand'),
      displayMedium: const TextStyle(fontFamily: 'Quicksand'),
      headlineMedium: const TextStyle(fontFamily: 'Quicksand'),
      headlineSmall: const TextStyle(fontFamily: 'NotoSans'),
      titleLarge: const TextStyle(fontFamily: 'NotoSans'),
      titleMedium: const TextStyle(fontFamily: 'NotoSans'),
      bodyLarge: const TextStyle(fontFamily: 'NotoSans'),
      bodyMedium: const TextStyle(fontFamily: 'NotoSans'),
      titleSmall: const TextStyle(fontFamily: 'NotoSans'),
      labelSmall: const TextStyle(fontFamily: 'NotoSans'),
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
        .copyWith(secondary: Colors.orange),
  );

  /// 明るいテーマデータを定義します。
  static final ThemeData lightTheme = baseTheme.copyWith(
    // ライトモード用の設定を追加します
    brightness: Brightness.light,
    // 他のライトモード用のテーマ設定をここに追加
  );

  /// 暗いテーマデータを定義します。
  static final ThemeData darkTheme = baseTheme.copyWith(
    // ダークモード用の設定を追加します
    brightness: Brightness.dark,
    // 他のダークモード用のテーマ設定をここに追加
  );
}
