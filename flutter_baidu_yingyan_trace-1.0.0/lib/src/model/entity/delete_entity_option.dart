import 'package:flutter_baidu_yingyan_trace/src/model/base_option.dart';

/// 删除Entity请求参数
class DeleteEntityOption extends BaseOption {
  ///  entity名称，作为终端实体的唯一标识，必填
  /// 同一service服务中entity_name不可重复。一旦创建，entity_name 不可更新。
  /// 命名规则：仅支持中文、英文大小字母、英文下划线"_"、英文横线"-"和数字。 entity_name 和 entity_desc 支持联合模糊检索。
  String ?entityName;

  DeleteEntityOption(
      {required int tag, required int serviceId, required this.entityName})
      : assert(entityName != null),
        super(tag: tag, serviceId: serviceId);

  DeleteEntityOption.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    entityName = map['entityName'];
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['entityName'] = this.entityName;
    return map;
  }

  @override
  String toString() {
    return 'DeleteEntityOption{tag: $tag, serviceId: $serviceId, '
        'entityName: $entityName}';
  }
}
