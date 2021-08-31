/// entity检索过滤条件
class SearchFilterCondition {
  /// entityName列表
  List<String> ?entityNames;

  /// 活跃时间，在此时间之后有定位信息上传的entity（locTime >= activeTime）
  /// 注：不能与inActiveTime同时使用
  int ?activeTime;

  /// 不活跃时间，在此时间之后无定位信息上传的entity（locTime < inActiveTime）
  /// 注：不能与activeTime同时使用
  int ?inActiveTime;

  /// 自定义可筛选的entity属性字段（add时传参）
  Map<String, String> ?customColumns;

  /// 有参构造
  SearchFilterCondition(
      {this.entityNames,
      this.activeTime,
      this.inActiveTime,
      this.customColumns});

  /// map =>  SearchFilterCondition
  SearchFilterCondition.fromMap(Map map) : assert(map != null) {
    if (map['entityNames'] != null) {
      entityNames = <String>[];
      map['entityNames'].forEach((e) {
        entityNames!.add(e as String);
      });
    }
    activeTime = map['activeTime'];
    inActiveTime = map['inActiveTime'];
    customColumns = map['customColumns'] == null
        ? null
        : Map<String, String>.from(map['customColumns']);
  }

  /// SearchFilterCondition => map
  Map toMap() {
    return {
      "entityNames": this.entityNames?.map((e) => e).toList(),
      "activeTime": this.activeTime,
      "inActiveTime": this.inActiveTime,
      "customColumns": this.customColumns,
    };
  }

  @override
  String toString() {
    return 'SearchFilterCondition{entityNames: $entityNames, activeTime: $activeTime, inActiveTime: $inActiveTime, customColumns: $customColumns}';
  }
}
