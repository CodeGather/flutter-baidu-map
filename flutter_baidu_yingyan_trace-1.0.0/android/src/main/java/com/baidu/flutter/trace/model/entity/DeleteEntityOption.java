package com.baidu.flutter.trace.model.entity;

import com.baidu.trace.api.entity.DeleteEntityRequest;
import com.baidu.trace.model.BaseRequest;

/**
 * 删除Entity请求参数
 *
 * @author baidu
 */
public final class DeleteEntityOption extends BaseRequest {

    /**
     * entity名称
     */
    private String entityName;

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

    public DeleteEntityOption() {
        super();
    }

    /**
     * @param tag       请求标识
     * @param serviceId 轨迹服务ID
     */
    public DeleteEntityOption(int tag, long serviceId) {
        super(tag, serviceId);
    }

    /**
     * 删除Entity请求
     *
     * @param tag        请求标识
     * @param serviceId  轨迹服务ID
     * @param entityName entity标识
     */
    public DeleteEntityOption(int tag, long serviceId, String entityName) {
        super(tag, serviceId);
        this.entityName = entityName;
    }

    public DeleteEntityRequest toDeleteEntityRequest() {
        DeleteEntityRequest deleteEntityRequest = new DeleteEntityRequest();
        deleteEntityRequest.setTag(tag);
        deleteEntityRequest.setServiceId(serviceId);
        deleteEntityRequest.setEntityName(entityName);
        return deleteEntityRequest;
    }

    @Override
    public String toString() {
        return "DeleteEntityOption [tag=" + tag + ", serviceId=" + serviceId + ", entityName="
                + entityName + "]";
    }

}
