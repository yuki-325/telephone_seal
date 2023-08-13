import 'package:flutter/material.dart';

/// アプリのテーマを管理するクラスです。
class AppTheme {
// テーマのベースとなるテーマデータを定義します
  static final ThemeData baseTheme = ThemeData(
    // テキスト選択のテーマデータを設定します
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
    // テキストのテーマデータを設定します
    textTheme: TextTheme(
      // 小さな表示テキストのスタイルを設定します
      displaySmall: const TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 45.0,
        color: Colors.white,
      ),
      // 大文字ラベルのスタイルを設定します
      labelLarge: const TextStyle(
        fontFamily: 'OpenSans',
      ),
      // 小さな本文テキストのスタイルを設定します
      bodySmall: TextStyle(
        fontFamily: 'NotoSans',
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: Colors.deepPurple[300],
      ),
      // 大きな表示テキストのスタイルを設定します
      displayLarge: const TextStyle(fontFamily: 'Quicksand'),
      // 中くらいの表示テキストのスタイルを設定します
      displayMedium: const TextStyle(fontFamily: 'Quicksand'),
      // 中見出しのスタイルを設定します
      headlineMedium: const TextStyle(fontFamily: 'Quicksand'),
      // 小見出しのスタイルを設定します
      headlineSmall: const TextStyle(fontFamily: 'NotoSans'),
      // 大きなタイトルのスタイルを設定します
      titleLarge: const TextStyle(fontFamily: 'NotoSans'),
      // 中くらいのタイトルのスタイルを設定します
      titleMedium: const TextStyle(fontFamily: 'NotoSans'),
      // 大きな本文のスタイルを設定します
      bodyLarge: const TextStyle(fontFamily: 'NotoSans'),
      // 中くらいの本文のスタイルを設定します
      bodyMedium: const TextStyle(fontFamily: 'NotoSans'),
      // 小さなタイトルのスタイルを設定します
      titleSmall: const TextStyle(fontFamily: 'NotoSans'),
      // 小さなラベルのスタイルを設定します
      labelSmall: const TextStyle(fontFamily: 'NotoSans'),
    ),

    // カラースキームを設定します
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
