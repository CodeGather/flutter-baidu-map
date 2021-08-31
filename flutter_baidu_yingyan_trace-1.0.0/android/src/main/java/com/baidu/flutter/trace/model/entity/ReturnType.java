package com.baidu.flutter.trace.model.entity;

/**
 * 行政区搜索返回值内容
 *
 * @author baidu
 */
public enum ReturnType {
    /**
     * 仅返回 total，即符合本次检索条件的所有entity 数量（若仅需行政区内entity数量，建议选择 simple，将提升检索性能）
     */
    simple,

    /**
     * 返回全部结果
     */
    all
}
