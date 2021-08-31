package com.baidu.mapapi.search.bean.option;

public class GeoCodeBean {
    /**
     * 地址所在的城市名
     * 用于指定上述地址所在的城市，当多个城市都有上述地址时，该参数起到过滤作用，但不限制坐标召回城市
     */
    public String city = null;

    /**
     * 待解析的地址。最多支持84个字节。
     * 可以输入2种样式的值，分别是：
     * 1、标准的结构化地址信息，如北京市海淀区上地十街十号，推荐，地址结构越完整，解析精度越高）
     * 2、支持“*路与*路交叉口”描述方式，如北一环路和阜阳路的交叉路口
     * 第二种方式并不总是有返回结果，只有当地址库中存在该地址描述时才有返回。
     */
    public String address = null;
}
