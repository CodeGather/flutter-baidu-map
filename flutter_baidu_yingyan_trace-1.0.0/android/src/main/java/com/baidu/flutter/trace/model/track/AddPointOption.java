package com.baidu.flutter.trace.model.track;

import java.util.Map;

import com.baidu.flutter.trace.model.BaseOption;
import com.baidu.flutter.trace.model.Point;
import com.baidu.trace.api.track.AddPointRequest;

/**
 * 上传单个轨迹点请求类
 */
public class AddPointOption extends BaseOption {

    /**
     * entity唯一标识
     */
    private String entityName;

    /**
     * 轨迹点信息
     */
    private Point point;

    /**
     * 对象名称
     */
    private String objectName;

    /**
     * track自定义字段
     */
    private Map<String, String> customData;

    public String getEntityName() {
        return entityName;
    }

    /**
     * 设置Entity唯一标识
     *
     * @param entityName
     */
    public void setEntityName(String entityName) {
        this.entityName = entityName;
    }

    public Point getPoint() {
        return point;
    }

    /**
     * 设置轨迹点信息
     *
     * @param point
     */
    public void setPoint(Point point) {
        this.point = point;
    }

    public String getObjectName() {
        return objectName;
    }

    /**
     * 设置对象名称
     *
     * @param objectName
     */
    public void setObjectName(String objectName) {
        this.objectName = objectName;
    }

    public Map<String, String> getColumns() {
        return customData;
    }

    /**
     * @param columns
     */
    public void setColumns(Map<String, String> columns) {
        this.customData = columns;
    }

    public AddPointOption() {
    }

    /**
     * 创建上传单个轨迹点请求实例
     *
     * @param tag       请求标识
     * @param serviceId 轨迹服务ID
     */
    public AddPointOption(int tag, long serviceId) {
        super(tag, serviceId);
    }

    /**
     * 创建上传单个轨迹点请求实例
     *
     * @param tag        请求标识
     * @param serviceId  轨迹服务ID
     * @param entityName Entity标识
     * @param point      轨迹点信息
     * @param objectName 对象名称
     * @param columns    自定义属性
     */
    public AddPointOption(int tag, long serviceId, String entityName, Point point,
                          String objectName,
                          Map<String, String> columns) {
        this(tag, serviceId);
        this.entityName = entityName;
        this.point = point;
        this.objectName = objectName;
        this.customData = columns;
    }

    public AddPointRequest toAddPointRequest() {
        AddPointRequest addPointRequest = new AddPointRequest();
        addPointRequest.setTag(tag);
        addPointRequest.setServiceId(serviceId);
        addPointRequest.setEntityName(entityName);
        if (point != null) {
            addPointRequest.setPoint(point.toPoint());
        }
        addPointRequest.setObjectName(objectName);
        addPointRequest.setColumns(customData);
        return addPointRequest;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("AddPointRequest{");
        sb.append("tag=").append(tag);
        sb.append(", serviceId=").append(serviceId);
        sb.append(", entityName='").append(entityName).append('\'');
        sb.append(", point=").append(point);
        sb.append(", objectName='").append(objectName).append('\'');
        sb.append(", customData=").append(customData);
        sb.append('}');
        return sb.toString();
    }
}
