/// 代表经纬度
class LatLng {
  /// 纬度
  double ?latitude;

  /// 经度
  double ?longitude;

  /// 有参构造
  LatLng(this.latitude, this.longitude)
      : assert(latitude != null),
        assert(longitude != null);

  /// map => LatLng
  LatLng.fromMap(Map ?map) : assert(map != null) {
    latitude = map!['latitude'];
    longitude = map['longitude'];
  }

  /// LatLng => map
  Map toMap() {
    return {"latitude": latitude, "longitude": longitude};
  }
}
