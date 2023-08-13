import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_login/flutter_login.dart';
import 'package:telephone_seal/common/utils/logger_util.dart';
import 'package:telephone_seal/mock/users.dart';
import 'package:telephone_seal/common/constants/app_labels.dart';
import 'package:telephone_seal/widget/intro_widget.dart';
import 'package:telephone_seal/widget/keyboard_close_wrapper_widget.dart';

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
        return 'ユーザーが存在しません';
      }
      if (mockUsers[data.name] != data.password) {
        return 'パスワードが一致しません';
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
        return 'ユーザーが存在しません';
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
    LoggerUtil.debug("build() begin");
    // Flutter Loginウィジェットを返します
    return KeyboardCloseWrapperWidget(
      child: FlutterLogin(
        // ログイン画面のタイトルを設定します
        theme: LoginTheme(
            primaryColor: Colors.grey,
            accentColor: Colors.white,
            buttonTheme: const LoginButtonTheme(splashColor: Colors.blueGrey)),
        title: AppLabels.appName,
        navigateBackAfterRecovery: true,
        onConfirmRecover: _signupConfirm,
        onConfirmSignup: _signupConfirm,
        loginAfterSignUp: false,
        messages: LoginMessages(
            forgotPasswordButton: AppLabels.forgotPasswordLabel,
            loginButton: AppLabels.loginButtonLabel,
            signupButton: AppLabels.signUpButtonLabel,
            goBackButton: AppLabels.backButtonLabel,
            recoverPasswordButton: AppLabels.sendRecoveryEmailLabel,
            recoverPasswordIntro: AppLabels.recoverPasswordLabel,
            recoverCodePasswordDescription: AppLabels.enterEmailLabel),
        // サインアップ時の追加のフィールドのリスト
        additionalSignupFields: const [/* ... */],
        // ユーザー名のバリデーション関数
        userValidator: (value) {
          LoggerUtil.debug("userValidator() begin");
          LoggerUtil.logArguments("userValidator", {"value": value});
          if (!value!.contains('@') || !value.endsWith('.com')) {
            LoggerUtil.debug("userValidator() バリデーションエラーです。 value:=> $value");
            return "メールアドレスには '@' と '.com' が含まれている必要があります";
          }
          LoggerUtil.debug("userValidator() end");
          return null;
        },
        // パスワードのバリデーション関数
        passwordValidator: (value) {
          if (value!.isEmpty) {
            return 'パスワードが空です';
          }
          return null;
        },
        // ログイン時のコールバック関数
        onLogin: (loginData) {
          LoggerUtil.debug('ログイン情報');
          LoggerUtil.debug('名前: ${loginData.name}');
          LoggerUtil.debug('パスワード: ${loginData.password}');
          return _loginUser(loginData);
        },
        // サインアップ時のコールバック関数
        onSignup: (signupData) {
          LoggerUtil.debug('サインアップ情報');
          LoggerUtil.debug('名前: ${signupData.name}');
          LoggerUtil.debug('パスワード: ${signupData.password}');

          // 追加のサインアップ情報を表示します
          signupData.additionalSignupData?.forEach((key, value) {
            LoggerUtil.debug('$key: $value');
          });
          // 利用規約の情報を表示します
          if (signupData.termsOfService.isNotEmpty) {
            LoggerUtil.debug('利用規約: ');
            for (final element in signupData.termsOfService) {
              LoggerUtil.debug(
                ' - ${element.term.id}: ${element.accepted == true ? '同意済み' : '拒否済み'}',
              );
            }
          }
          return _signupUser(signupData);
        },
        // サインアップアニメーションが完了した際のコールバック関数
        onSubmitAnimationCompleted: () {
          // ここに遷移ロジックを記述します
          LoggerUtil.debug("onSubmitAnimationCompleted() begin");
          LoggerUtil.debug("onSubmitAnimationCompleted() end");
        },
        // パスワードリカバリー時のコールバック関数
        onRecoverPassword: (name) {
          LoggerUtil.debug('パスワード回復情報');
          LoggerUtil.debug('名前: $name');
          return _recoverPassword(name);
          // 新しいパスワードダイアログを表示します
        },
        headerWidget: const IntroWidget(),
      ),
    );
  }
}
