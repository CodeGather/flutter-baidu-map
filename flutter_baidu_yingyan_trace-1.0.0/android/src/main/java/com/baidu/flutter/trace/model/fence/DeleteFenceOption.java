package com.baidu.flutter.trace.model.fence;

import java.util.ArrayList;
import java.util.List;

import com.baidu.flutter.trace.model.BaseOption;
import com.baidu.trace.api.fence.DeleteFenceRequest;

/**
 * 删除围栏请求
 *
 * @author baidu
 */
public final class DeleteFenceOption extends BaseOption {

    /**
     * 监控对象
     */
    private String monitoredPerson;

    /**
     * 围栏编号列表
     */
    private List<Integer> fenceIds;

    /**
     * 围栏类型（本地围栏、服务端围栏）
     */
    private int fenceType;

    public String getMonitoredPerson() {
        return monitoredPerson;
    }

    /**
     * 设置监控对象
     *
     * @param monitoredPerson
     */
    public void setMonitoredPerson(String monitoredPerson) {
        this.monitoredPerson = monitoredPerson;
    }

    public List<Integer> getFenceIds() {
        return fenceIds;
    }

    /**
     * 设置围栏编号列表
     *
     * @param fenceIds
     */
    public void setFenceIds(List<Integer> fenceIds) {
        this.fenceIds = fenceIds;
    }

    public int getFenceType() {
        return fenceType;
    }
    
    public DeleteFenceOption() {
        super();
    }

    /**
     * 删除围栏请求
     *
     * @param tag             请求标识
     * @param serviceId       轨迹服务ID
     * @param monitoredPerson 监控对象
     * @param fenceIds        服务端围栏编号列表
     * @param fenceType       围栏类型
     */
    public DeleteFenceOption(int tag, long serviceId, String monitoredPerson,
                              List<Integer> fenceIds, int fenceType) {
        super(tag, serviceId);
        this.monitoredPerson = monitoredPerson;
        this.fenceIds = fenceIds;
        this.fenceType = fenceType;
    }

    public DeleteFenceRequest toDeleteFenceRequest() {
        DeleteFenceRequest deleteFenceRequest = null;
        if (fenceIds != null) {
            List<Long> fenceIdList = new ArrayList<>();
            for (Integer fenceId : fenceIds) {
                fenceIdList.add(fenceId.longValue());
            }
            if (fenceType == FenceType.local.ordinal()) {
                deleteFenceRequest = com.baidu.trace.api.fence.DeleteFenceRequest
                        .buildLocalRequest(tag, serviceId, monitoredPerson, fenceIdList);
            } else if (fenceType == FenceType.server.ordinal()) {
                deleteFenceRequest = com.baidu.trace.api.fence.DeleteFenceRequest
                        .buildServerRequest(tag, serviceId, monitoredPerson, fenceIdList);
            }
        }
        
        return deleteFenceRequest;
    }

    @Override
    public String toString() {
        return "DeleteFenceRequest [tag=" + tag + ", serviceId=" + serviceId + ", monitoredPerson="
                + monitoredPerson
                + ", fenceIds=" + fenceIds + ", fenceType=" + fenceType + "]";
    }

}
