import 'package:flutter_baidu_yingyan_trace/src/model/base_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/coord_type.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/query_track_process_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/track_types.dart';

/// 查询某entity终端实体，在一段时间之内的行程信息的请求信息类
class QueryHistoryTrackOption extends BaseOption {
  /// 需要查询的entity的名称，必填，必须为非空字符串
  String ?entityName;

  /// 开始时间 UNIX时间戳，必填。
  int ?startTime;

  /// 结束时间 UNIX时间戳，必填。
  /// 结束时间不能大于当前时间，且起止时间区间不超过24小时。
  int ?endTime;

  /// 是否返回纠偏后的里程，选填。
  /// TRUE代表返回纠偏后的里程，FALSE代表使用原始轨迹计算里程。
  /// 默认值为FALSE。
  bool ?isProcessed;

  /// 纠偏选项，选填。
  /// 该选项只有在isProcessed选项为TRUE时有效。
  /// 若设置此选项，则使用开发者指定的选项进行纠偏。
  /// 如果不设置，或者值为null，将使用默认的纠偏选项：去燥、不绑路、不过滤噪点、交通方式为驾车。
  QueryTrackProcessOption ?processOption;

  /// 里程补偿的方式，选填。
  /// 在里程计算时，两个轨迹点定位时间间隔5分钟以上，被认为是中断。中断轨迹可以进行里程补偿，通过此属性设置里程补偿的方式。
  /// 默认值为TrackProcessOptionSupplementMode.NO_SUPPLEMENT 不进行里程补偿。
  TrackProcessOptionSupplementMode ?supplementMode;

  /// 轨迹补偿内容
  /// 仅在supplementMode不为no_supplement时生效。
  /// 默认值：only_distance。
  /// 可选值：
  /// only_distance：对于中断区间，只补偿中断的里程，不补偿轨迹点
  /// distance_and_points：对于中断区间，既补偿里程，又补偿轨迹点
  TrackProcessOptionSupplementContent ?supplementContent;

  /// 低速阈值，选填。（单位：千米/小时）
  /// 若填写该值且isProcessed=true时，则返回结果中将增加low_speed_distance字段，表示速度低于该值的里程。
  /// 示例：
  /// lowSpeedThreshold=20，则返回结果中将增加low_speed_distance字段表示此段轨迹中速度低于20千米/小时的里程，可用于网约车行业中计算低速里程。
  double ?lowSpeedThreshold;

  /// 返回的坐标类型，选填。
  /// 该字段用于控制返回结果中的坐标类型。
  /// 只允许设置为百度经纬度或者国测局经纬度。
  /// 该参数仅对国内（包含港、澳、台）轨迹有效，海外区域轨迹均返回 wgs84坐标系。
  CoordType ?outputCoordType;

  /// 返回轨迹点的排序规则，选填。
  /// 若不设置，则使用默认值TrackSortType.ASC，按照定位时间升序排序（旧->新）
  TrackSortType ?sortType;

  /// 分页索引，选填。
  /// 默认值为1。
  ///pageIndex与pageSize一起计算从第几条结果返回，代表返回第几页。
  int ?pageIndex;

  /// 分页大小，选填。
  /// 默认值为100。
  /// pageSize与pageIndex一起计算从第几条结果返回，代表返回结果中每页有几个轨迹点。
  int ?pageSize;

  /// 有参构造
  QueryHistoryTrackOption(
      {required int tag,
      required int serviceId,
      required this.entityName,
      required this.startTime,
      required this.endTime,
      this.isProcessed: false,
      this.processOption,
      this.supplementMode: TrackProcessOptionSupplementMode.NO_SUPPLEMENT,
      this.supplementContent,
      this.lowSpeedThreshold,
      this.outputCoordType: CoordType.BD09LL,
      this.sortType: TrackSortType.ASC,
      this.pageIndex: 1,
      this.pageSize: 100})
      : super(tag: tag, serviceId: serviceId);

  /// map => QueryHistoryTrackOption
  QueryHistoryTrackOption.fromMap(Map map)
      : assert(map != null,
            'Construct a QueryHistoryTrackOption，The parameter map cannot be null !'),
        super.fromMap(map) {
    entityName = map['entityName'];
    startTime = map['startTime'];
    endTime = map['endTime'];
    isProcessed = map['isProcessed'];
    processOption = map['processOption'] == null
        ? null
        : QueryTrackProcessOption.fromMap(map['processOption']);
    supplementMode = map['supplementMode'] == null
        ? null
        : TrackProcessOptionSupplementMode.values[map['supplementMode'] as int];
    supplementContent = map['supplementContent'] == null
        ? null
        : TrackProcessOptionSupplementContent
            .values[map['supplementContent'] as int];
    lowSpeedThreshold = map['lowSpeedThreshold'];

    if (map['outputCoordType'] != null) {
      int value = map['outputCoordType'] as int;
      if (value >= 0 && value <= 2) {
        outputCoordType = CoordType.values[value];
      }
    }

    sortType = map['sortType'] == null
        ? null
        : TrackSortType.values[map['sortType'] as int];
    pageIndex = map['pageIndex'];
    pageSize = map['pageSize'];
  }
  @override
  Map toMap() {
    Map map = super.toMap();
    map['entityName'] = this.entityName;
    map['startTime'] = this.startTime;
    map['endTime'] = this.endTime;
    map['isProcessed'] = this.isProcessed;
    map['processOption'] = this.processOption?.toMap();
    map['supplementMode'] = this.supplementMode?.index;
    map['supplementContent'] = this.supplementContent?.index;
    map['lowSpeedThreshold'] = this.lowSpeedThreshold;
    map['outputCoordType'] = this.outputCoordType?.index;
    map['sortType'] = this.sortType?.index;
    map['pageIndex'] = this.pageIndex;
    map['pageSize'] = this.pageSize;
    return map;
  }
}
