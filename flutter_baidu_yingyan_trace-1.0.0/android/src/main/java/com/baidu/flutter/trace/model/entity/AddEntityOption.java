package com.baidu.flutter.trace.model.entity;

import java.util.HashMap;
import java.util.Map;

import com.baidu.flutter.trace.model.BaseOption;
import com.baidu.trace.api.entity.AddEntityRequest;

/**
 * 创建Entity请求参数
 *
 * @author baidu
 */
public final class AddEntityOption extends BaseOption {

    /**
     * entity标识
     */
    public String entityName;

    /**
     * entity描述
     */
    public String entityDesc;

    /**
     * 自定义属性
     */
    public HashMap<String, String> customColumns;

    public String getEntityName() {
        return entityName;
    }

    /**
     * 设置entity名称
     *
     * @param entityName
     */
    public void setEntityName(String entityName) {
        this.entityName = entityName;
    }

    public String getEntityDesc() {
        return entityDesc;
    }

    /**
     * 设置entity的描述
     *
     * @param entityDesc
     */
    public void setEntityDesc(String entityDesc) {
        this.entityDesc = entityDesc;
    }

    public Map<String, String> getCustomColumns() {
        return customColumns;
    }

    /**
     * 设置自定义字段
     *
     * @param columns
     */
    public void setCustomColumns(HashMap<String, String> columns) {
        this.customColumns = columns;
    }

    public AddEntityOption() {
        super();
    }

    /**
     * @param tag       请求标识
     * @param serviceId 轨迹服务ID
     */
    public AddEntityOption(int tag, long serviceId) {
        super(tag, serviceId);
    }

    /**
     * @param tag        请求标识
     * @param serviceId  轨迹服务ID
     * @param entityName entity标识
     */
    public AddEntityOption(int tag, long serviceId, String entityName) {
        super(tag, serviceId);
        this.entityName = entityName;
    }

    /**
     * 创建entity请求
     *
     * @param tag        请求标识
     * @param serviceId  轨迹服务ID
     * @param entityName entity标识
     * @param entityDesc entity描述
     * @param columns    自定义属性字段
     */
    public AddEntityOption(int tag, long serviceId, String entityName,
                           String entityDesc, HashMap<String, String> columns) {
        super(tag, serviceId);
        this.entityName = entityName;
        this.entityDesc = entityDesc;
        this.customColumns = columns;
    }

    public AddEntityRequest toAddEntityRequest() {
        AddEntityRequest addEntityRequest = new AddEntityRequest();
        addEntityRequest.setTag(tag);
        addEntityRequest.setServiceId(serviceId);
        addEntityRequest.setEntityName(entityName);
        addEntityRequest.setEntityDesc(entityDesc);
        addEntityRequest.setColumns(customColumns);
        return addEntityRequest;
    }

    @Override
    public String toString() {
        return "AddEntityOption [tag=" + tag + ", serviceId=" + serviceId + ", entityName="
                + entityName
                + ", entityDesc=" + entityDesc + ", customColumns=" + customColumns + "]";
    }

}
