class TimerUtils {
  ////
  /// パーセンテージを計算する関数
  ///
  static double calculatePercentage(
      Duration currentDuration, Duration totalDuration) {
    double progress =
        currentDuration.inMilliseconds / totalDuration.inMilliseconds;
    double percentage = progress.clamp(0.0, 1.0);
    return percentage;
  }
}
