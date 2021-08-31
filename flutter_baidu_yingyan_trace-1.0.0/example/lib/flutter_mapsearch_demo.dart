import 'package:flutter/material.dart';
import 'package:flutter_baidu_yingyan_trace_example/Analysis/analysis_page.dart';
import 'package:flutter_baidu_yingyan_trace_example/CustomWidgets/function_group.widget.dart';
import 'package:flutter_baidu_yingyan_trace_example/CustomWidgets/function_item.widget.dart';
import 'package:flutter_baidu_yingyan_trace_example/Entity/entity_page.dart';
import 'package:flutter_baidu_yingyan_trace_example/Fence/fence_page.dart';
import 'package:flutter_baidu_yingyan_trace_example/Trace/trace_page.dart';
import 'package:flutter_baidu_yingyan_trace_example/Track/track_page.dart';

class BaiduYingYanPage extends StatelessWidget {
  const BaiduYingYanPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          FunctionGroup(
            headLabel: '开启鹰眼服务',
            children: <Widget>[
              FunctionItem(
                  label: '开启鹰眼服务', sublabel: 'TracePage', target: TracePage()),
            ],
          ),
          FunctionGroup(
            headLabel: '终端实体管理',
            children: <Widget>[
              FunctionItem(
                  label: 'Entity的增删改查',
                  sublabel: 'EntityPage',
                  target: EntityPage()),
            ],
          ),
          FunctionGroup(
            headLabel: '轨迹相关',
            children: <Widget>[
              FunctionItem(
                  label: '轨迹查询与清除', sublabel: 'TrackPage', target: TrackPage()),
            ],
          ),
          FunctionGroup(
            headLabel: '轨迹分析',
            children: <Widget>[
              FunctionItem(
                  label: '轨迹分析',
                  sublabel: 'AnalysisPage',
                  target: AnalysisPage()),
            ],
          ),
          FunctionGroup(
            headLabel: '围栏相关',
            children: <Widget>[
              FunctionItem(
                  label: '围栏相关', sublabel: 'FencePage', target: FencePage()),
            ],
          )
        ],
      ),
    );
  }
}
