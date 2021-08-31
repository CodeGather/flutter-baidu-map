package com.baidu.flutter.trace.model.entity;

import java.util.HashMap;
import java.util.Map;

import com.baidu.flutter.trace.model.BaseOption;
import com.baidu.trace.api.entity.UpdateEntityRequest;

/**
 * 更新Entity请求参数
 *
 * @author baidu
 */
public final class UpdateEntityOption extends BaseOption {

    /**
     * entity唯一标识
     */
    private String entityName;

    /**
     * entity的描述
     */
    private String entityDesc;

    /**
     * 自定义属性
     */
    private HashMap<String, String> customColumns;

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

    public Map<String, String> getColumns() {
        return customColumns;
    }

    /**
     * 设置自定义属性
     *
     * @param columns
     */
    public void setColumns(HashMap<String, String> columns) {
        this.customColumns = columns;
    }

    public UpdateEntityOption() {
        super();
    }

    /**
     * @param tag       请求标识
     * @param serviceId 轨迹服务ID
     */
    public UpdateEntityOption(int tag, long serviceId) {
        super(tag, serviceId);
    }

    /**
     * @param tag        请求标识
     * @param serviceId  轨迹服务ID
     * @param entityName entity标识
     */
    public UpdateEntityOption(int tag, long serviceId, String entityName) {
        super(tag, serviceId);
        this.entityName = entityName;
    }

    /**
     * 更新Entity请求
     *
     * @param tag        请求标识
     * @param serviceId  轨迹服务ID
     * @param entityName entity标识
     * @param entityDesc entity描述
     * @param columns    自定义属性字段
     */
    public UpdateEntityOption(int tag, long serviceId, String entityName, String entityDesc,
                              HashMap<String, String> columns) {
        super(tag, serviceId);
        this.entityName = entityName;
        this.entityDesc = entityDesc;
        this.customColumns = columns;
    }

    public UpdateEntityRequest toUpdateEntityRequest() {
        UpdateEntityRequest updateEntityRequest = new UpdateEntityRequest();
        updateEntityRequest.setTag(tag);
        updateEntityRequest.setServiceId(serviceId);
        updateEntityRequest.setEntityName(entityName);
        updateEntityRequest.setEntityDesc(entityDesc);
        updateEntityRequest.setColumns(customColumns);
        return updateEntityRequest;
    }

    @Override
    public String toString() {
        return "UpdateEntityOption [tag=" + tag + ", serviceId=" + serviceId + ", entityName="
                + entityName
                + ", entityDesc=" + entityDesc + ", columns=" + customColumns + "]";
    }

}
