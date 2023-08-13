import 'package:flutter/material.dart';

/// [RouteObserver]からの実装をコピーして、[TransitionRouteAware]に[Route]の状態変更を通知するクラスです。
/// また、ルートのトランジションが終了したことも通知します。
class TransitionRouteObserver<R extends TransitionRoute<dynamic>?>
    extends NavigatorObserver {
  final Map<R, Set<TransitionRouteAware>> _listeners =
      <R, Set<TransitionRouteAware>>{};

  /// [routeAware]を[route]の変更に関して通知を受けるために購読します。
  ///
  /// 今後、[route]が別のルートによって覆われた場合や、[route]が[Navigator]のスタックから取り除かれた場合など、
  /// [routeAware]には[route]に関する変更が通知されます。
  void subscribe(TransitionRouteAware routeAware, R route) {
    assert(route != null);
    final subscribers =
        _listeners.putIfAbsent(route, () => <TransitionRouteAware>{});
    if (subscribers.add(routeAware)) {
      routeAware.didPush();
      Future.delayed(route!.transitionDuration, () {
        routeAware.didPushAfterTransition();
      });
    }
  }

  /// [routeAware]の購読を解除します。
  ///
  /// [routeAware]はもはや自身のルートの変更に関して通知を受けません。与えられた引数が
  /// 複数のタイプに購読されている場合、それぞれのタイプから（1回だけ）解除されます。
  void unsubscribe(TransitionRouteAware routeAware) {
    for (final route in _listeners.keys) {
      final subscribers = _listeners[route];
      subscribers?.remove(routeAware);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route is R && previousRoute is R) {
      final previousSubscribers = _listeners[previousRoute]?.toList();

      if (previousSubscribers != null) {
        for (final routeAware in previousSubscribers) {
          routeAware.didPopNext();
        }
      }

      final subscribers = _listeners[route as R]?.toList();

      if (subscribers != null) {
        for (final routeAware in subscribers) {
          routeAware.didPop();
        }
      }
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route is R && previousRoute is R) {
      final previousSubscribers = _listeners[previousRoute];

      if (previousSubscribers != null) {
        for (final routeAware in previousSubscribers) {
          routeAware.didPushNext();
        }
      }
    }
  }
}

/// [TransitionRoute]の現在の状態に気づくためのオブジェクトのためのインターフェースです。
///
/// これは、[TransitionRouteObserver]を使用して、[Navigator]のセッション履歴の変更に気づくために使用されます。
abstract class TransitionRouteAware {
  /// トップのルートがポップされ、現在のルートが表示されたときに呼び出されます。
  void didPopNext() {}

  /// 現在のルートがプッシュされたときに呼び出されます。
  void didPush() {}

  /// 現在のルートがプッシュされ、トランジションが完了した後に呼び出されます。
  void didPushAfterTransition() {}

  /// 現在のルートがポップされたときに呼び出されます。
  void didPop() {}

  /// 新しいルートがプッシュされ、現在のルートが見えなくなったときに呼び出されます。
  void didPushNext() {}
}
