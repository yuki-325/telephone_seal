import 'package:flutter/material.dart';

/// ログイン画面のヘッダーウィジェットを構築するウィジェットです
class IntroWidget extends StatelessWidget {
  // コンストラクタ
  const IntroWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ウィジェットツリーのルートとしてColumnウィジェットを返します
    return const Column(
      children: [
        // テキストウィジェットをリッチテキストとして表示します
        Text.rich(
          TextSpan(
            children: [
              // テキストスパン内に複数の子テキストスパンを持つ形でテキストを構築します
              TextSpan(
                text: "You are trying to login/sign up on server hosted on ",
              ),
              // フォントの太さを変更したテキストスパンを追加します
              TextSpan(
                text: "example.com",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          // テキストの配置を指定します
          textAlign: TextAlign.justify,
        ),
        // Rowウィジェット内に複数の子ウィジェットを横に配置します
        Row(
          children: <Widget>[
            // 横幅を広げるためにExpandedウィジェットで包みます
            Expanded(child: Divider()),
            // パディングを追加したテキストウィジェットを配置します
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Authenticate"),
            ),
            // 横幅を広げるためにExpandedウィジェットで包みます
            Expanded(child: Divider()),
          ],
        ),
      ],
    );
  }
}
