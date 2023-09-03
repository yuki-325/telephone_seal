import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:telephone_seal/common/theme/app_theme.dart';
import 'package:telephone_seal/common/constants/app_labels.dart';
import 'package:telephone_seal/common/utils/logger_util.dart';
import 'package:telephone_seal/common/utils/transition_route_observer.dart';
import 'package:telephone_seal/models/timer_model.dart';
import 'package:telephone_seal/views/timer_screen.dart';

import 'views/login_screen.dart';

void main() {
// システムUIのオーバーレイスタイルを設定します
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      // システムナビゲーションバーの背景色を設定します
      systemNavigationBarColor:
          SystemUiOverlayStyle.dark.systemNavigationBarColor,
      // 他のシステムUIの設定をここに追加できます
    ),
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => TimerModel("01:00:00"), // TimerModelプロバイダーを作成
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LoggerUtil.debug("build() begin");
    return MaterialApp(
      title: AppLabels.appName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      navigatorObservers: [TransitionRouteObserver()],
      initialRoute: TimerScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        TimerScreen.routeName: (context) => const TimerScreen()
        // DashboardScreen.routeName: (context) => const DashboardScreen(),
      },
    );
  }
}
