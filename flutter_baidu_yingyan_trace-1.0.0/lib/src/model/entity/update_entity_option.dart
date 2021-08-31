import 'package:flutter_baidu_yingyan_trace/src/model/base_option.dart';

/// 更新Entity请求参数
class UpdateEntityOption extends BaseOption {

  ///  entity名称，作为终端实体的唯一标识，必填
  /// 同一service服务中entity_name不可重复。一旦创建，entity_name 不可更新。
  /// 命名规则：仅支持中文、英文大小字母、英文下划线"_"、英文横线"-"和数字。 entity_name 和 entity_desc 支持联合模糊检索。
  String ?entityName;

  /// entity的可读性描述，选填。
  /// 命名规则：仅支持中文、英文大小字母、英文下划线"_"、英文横线"-"和数字。entity_name 和 entity_desc 支持联合模糊检索
  String ?entityDesc;

  /// 开发者自定义字段，选填
  /// 字典中的key必须是已经通过鹰眼的轨迹管理台创建过的属性字段才有效
  Map<String, String> ?customColumns;

  UpdateEntityOption(
      {required int tag,
      required int serviceId,
      required this.entityName,
      this.entityDesc,
      this.customColumns})
      : assert(entityName != null),
        super(tag: tag, serviceId: serviceId);

  /// map => UpdateEntityOption
  UpdateEntityOption.fromMap(Map map)
      : assert(map != null,
  'Construct a UpdateEntityOption，The parameter map cannot be null !'),
        super.fromMap(map) {
    entityName = map['entityName'];
    entityDesc = map['entityDesc'];
    customColumns = map['customColumns'] == null ? null :
    map['customColumns'] as Map<String, String>;
  }

  /// UpdateEntityOption => map
  @override
  Map toMap() {
    Map map = super.toMap();
    map['entityName'] = this.entityName;
    map['entityDesc'] = this.entityDesc;
    map['customColumns'] = this.customColumns;
    return map;
  }

  @override
  String toString() {
    return 'UpdateEntityOption{tag: $tag, serviceId: $serviceId, '
        'entityName: $entityName, entityDesc: $entityDesc, '
        'customColumns: $customColumns}';
  }
}