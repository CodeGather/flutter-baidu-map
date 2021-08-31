package com.baidu.flutter.trace.model.fence;

import com.baidu.flutter.trace.model.BaseOption;
import com.baidu.trace.api.fence.DeleteMonitoredPersonRequest;

/**
 * 删除围栏所监控的entity请求封装
 * V3.1.0新增接口
 */

public class DeleteMonitoredPersonOption extends BaseOption {

    /**
     * 服务端围栏ID
     */
    private int fenceId;

    /**
     * 监控对象,迹服务中的entity_name
     * 支持通过entity列表向围栏删除entity。
     * 1、通过围栏列表删除：每次删除entity上限为100个，多个entity_name使用英文逗号分隔
     * 示例： monitoredPerson=entity_name1,entity_name2,entity_name3。
     * <p>
     * 2、删除围栏所有监控对象：#clearentity
     * 示例：monitored_person=#clearentity
     */
    private String monitoredPerson;

    /**
     * 围栏类型
     */
    private int fenceType;

    /**
     * 获取服务端围栏ID
     *
     * @return 服务端围栏ID
     */
    public int getFenceId() {
        return fenceId;
    }

    /**
     * 设置服务端围栏ID
     *
     * @param fenceId 服务端围栏ID
     */
    public void setFenceId(int fenceId) {
        this.fenceId = fenceId;
    }

    /**
     * 获取监控对象,迹服务中的entity_name
     * 支持通过entity列表向围栏删除entity。
     * 1、通过围栏列表删除：每次删除entity上限为100个，多个entity_name使用英文逗号分隔
     * 示例： monitoredPerson=entity_name1,entity_name2,entity_name3。
     * <p>
     * 2、删除围栏所有监控对象：#clearentity
     * 示例：monitored_person=#clearentity
     *
     * @return 监控对象, 迹服务中的entity_name
     */
    public String getMonitoredPerson() {
        return monitoredPerson;
    }

    /**
     * 设置监控对象,迹服务中的entity_name
     * 支持通过entity列表向围栏删除entity。
     * 1、通过围栏列表删除：每次删除entity上限为100个，多个entity_name使用英文逗号分隔
     * 示例： monitoredPerson=entity_name1,entity_name2,entity_name3。
     * <p>
     * 2、删除围栏所有监控对象：#clearentity
     * 示例：monitored_person=#clearentity
     *
     * @param monitoredPerson 监控对象,迹服务中的entity_name
     */
    public void setMonitoredPerson(String monitoredPerson) {
        this.monitoredPerson = monitoredPerson;
    }

    /**
     * 获取围栏类型
     *
     * @return 围栏类型
     */
    public int getFenceType() {
        return fenceType;
    }

    /**
     * 获取围栏类型
     *
     * @param fenceType 围栏类型
     */
    public void setFenceType(int fenceType) {
        this.fenceType = fenceType;
    }
    
    public DeleteMonitoredPersonOption() {
        super();
    }

    /**
     * 删除围栏需监控的entity请求构造方法
     *
     * @param tag       请求标识
     * @param serviceId 轨迹服务ID
     */
    public DeleteMonitoredPersonOption(int tag, long serviceId) {
        super(tag, serviceId);
    }

    public DeleteMonitoredPersonRequest toDeleteMonitoredPersonRequest() {
        DeleteMonitoredPersonRequest deleteMonitoredPersonRequest =
                new DeleteMonitoredPersonRequest(tag, serviceId);
        return deleteMonitoredPersonRequest;
    }

    @Override
    public String toString() {
        return "DeleteMonitoredPersonRequest [tag = " + tag + ", serviceId = " + serviceId
                + ", fenceId = "
                + fenceId + ", monitoredPerson = " + monitoredPerson + ", fenceType = " + fenceType
                + "]";
    }
}
