/// 定位模式枚举值
enum LocationMode {
  /// 高精度定位模式，GPS与网络综合定位
  High_Accuracy,

  /// 低功耗定位模式，仅使用网络定位(WiFi和基站定位)
  Battery_Saving,

  /// 仅使用设备(GPS)定位
  Device_Sensors
}