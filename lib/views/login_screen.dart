import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telephone_seal/mock/users.dart';
import 'package:telephone_seal/common/utils/constants.dart';
import 'package:telephone_seal/widget/intro_widget.dart';

// ログイン画面を構築するウィジェットです
class LoginScreen extends StatelessWidget {
  // ルート名の定義
  static const routeName = '/auth';

  // コンストラクタ
  const LoginScreen({Key? key}) : super(key: key);

  // ログイン処理の待機時間を計算する関数です
  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  // ユーザーのログインを試行する非同期関数です
  Future<String?> _loginUser(LoginData data) {
    return Future.delayed(loginTime).then((_) {
      if (!mockUsers.containsKey(data.name)) {
        return 'User not exists';
      }
      if (mockUsers[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  // ユーザーのサインアップを試行する非同期関数です
  Future<String?> _signupUser(SignupData data) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  // パスワードのリカバリを試行する非同期関数です
  Future<String?> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      if (!mockUsers.containsKey(name)) {
        return 'User not exists';
      }
      return null;
    });
  }

  // サインアップの確認を試行する非同期関数です
  Future<String?> _signupConfirm(String error, LoginData data) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Flutter Loginウィジェットを返します
    return FlutterLogin(
      // ログイン画面のタイトルを設定します
      title: Constants.appName,
      // ロゴやタイトルに使用するタグを設定します
      logoTag: Constants.logoTag,
      titleTag: Constants.titleTag,
      navigateBackAfterRecovery: true,
      onConfirmRecover: _signupConfirm,
      onConfirmSignup: _signupConfirm,
      loginAfterSignUp: false,
      // ログインプロバイダーのリスト
      loginProviders: [
        // LinkedInでのサインインを提供するログインプロバイダー
        LoginProvider(
          button: Buttons.linkedIn,
          label: 'Sign in with LinkedIn',
          callback: () async {
            return null;
          },
          providerNeedsSignUpCallback: () {
            // 追加のフィールドを表示するかどうかを決定するためのロジックを提供します
            return Future.value(true);
          },
        ),
        // Googleでのサインインを提供するログインプロバイダー
        LoginProvider(
          icon: FontAwesomeIcons.google,
          label: 'Google',
          callback: () async {
            return null;
          },
        ),
        // GitHubでのサインインを提供するログインプロバイダー
        LoginProvider(
          icon: FontAwesomeIcons.githubAlt,
          callback: () async {
            debugPrint('start github sign in');
            await Future.delayed(loginTime);
            debugPrint('stop github sign in');
            return null;
          },
        ),
      ],
      // 利用規約のリスト
      termsOfService: [
        TermOfService(
          id: 'newsletter',
          mandatory: false,
          text: 'Newsletter subscription',
        ),
        TermOfService(
          id: 'general-term',
          mandatory: true,
          text: 'Term of services',
          linkUrl: 'https://github.com/NearHuscarl/flutter_login',
        ),
      ],
      // サインアップ時の追加のフィールドのリスト
      additionalSignupFields: const [/* ... */],
      // ユーザー名のバリデーション関数
      userValidator: (value) {
        if (!value!.contains('@') || !value.endsWith('.com')) {
          return "Email must contain '@' and end with '.com'";
        }
        return null;
      },
      // パスワードのバリデーション関数
      passwordValidator: (value) {
        if (value!.isEmpty) {
          return 'Password is empty';
        }
        return null;
      },
      // ログイン時のコールバック関数
      onLogin: (loginData) {
        debugPrint('Login info');
        debugPrint('Name: ${loginData.name}');
        debugPrint('Password: ${loginData.password}');
        return _loginUser(loginData);
      },
      // サインアップ時のコールバック関数
      onSignup: (signupData) {
        debugPrint('Signup info');
        debugPrint('Name: ${signupData.name}');
        debugPrint('Password: ${signupData.password}');

        // 追加のサインアップ情報を表示します
        signupData.additionalSignupData?.forEach((key, value) {
          debugPrint('$key: $value');
        });
        // 利用規約の情報を表示します
        if (signupData.termsOfService.isNotEmpty) {
          debugPrint('Terms of service: ');
          for (final element in signupData.termsOfService) {
            debugPrint(
              ' - ${element.term.id}: ${element.accepted == true ? 'accepted' : 'rejected'}',
            );
          }
        }
        return _signupUser(signupData);
      },
      // サインアップアニメーションが完了した際のコールバック関数
      onSubmitAnimationCompleted: () {
        // ここに遷移ロジックを記述します
      },
      // パスワードリカバリー時のコールバック関数
      onRecoverPassword: (name) {
        debugPrint('Recover password info');
        debugPrint('Name: $name');
        return _recoverPassword(name);
        // 新しいパスワードダイアログを表示します
      },
      headerWidget: const IntroWidget(),
    );
  }
}
