import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:telephone_seal/widget/intro_widget.dart';

void main() {
  testWidgets('IntroWidget Test', (WidgetTester tester) async {
    // IntroWidgetをビルドします
    await tester.pumpWidget(const MaterialApp(home: IntroWidget()));

    // テキストウィジェットの存在を確認します
    expect(find.textContaining("サーバーにログイン/サインアップしようとしています。ホストされているサーバー: "),
        findsOneWidget);
    expect(find.textContaining("example.com"), findsOneWidget);

    // Dividerウィジェットの存在を確認します
    expect(
        find.byType(Divider), findsNWidgets(2)); // 2つのDividerウィジェットが存在することを確認

    // パディングを追加したテキストウィジェットの存在を確認します
    expect(find.widgetWithText(Padding, "ユーザ認証"), findsOneWidget);
  });
}
