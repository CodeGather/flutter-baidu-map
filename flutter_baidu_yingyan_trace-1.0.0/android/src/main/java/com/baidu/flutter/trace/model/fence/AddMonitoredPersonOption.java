package com.baidu.flutter.trace.model.fence;

import java.util.List;

import com.baidu.flutter.trace.model.BaseOption;
import com.baidu.trace.api.fence.AddMonitoredPersonRequest;

/**
 * 增加围栏需监控的entity
 * V3.1.0新增
 */

public class AddMonitoredPersonOption extends BaseOption {
    /**
     * 围栏的唯一标识
     */
    private int fenceId;

    /**
     * 监控对象
     * 必选，轨迹服务中的entity_name。
     * 支持通过entity列表向围栏添加entity。 每次添加entity上限为100个。
     * 示例：monitoredPerson =entity_name1,entity_name2,entity_name3 多个entity_name
     * 使用英文逗号分隔
     */
    private List<String> monitoredPersons;

    /**
     * 围栏类型（本地围栏、服务端围栏）
     * 该请求只支持服务端围栏
     */
    private int fenceType;

    /**
     * 获取围栏的唯一标识
     *
     * @return 围栏的唯一标识
     */
    public int getFenceId() {
        return fenceId;
    }

    /**
     * 设置围栏的唯一标识
     *
     * @param fenceId 围栏的唯一标识
     */
    public void setFenceId(int fenceId) {
        this.fenceId = fenceId;
    }

    /**
     * 获取监控对象
     * 轨迹服务中的entity_name。
     * 支持通过entity列表向围栏添加entity。 每次添加entity上限为100个。
     * 示例：monitoredPerson =entity_name1,entity_name2,entity_name3 多个entity_name
     * 使用英文逗号分隔
     *
     * @return 监控对象
     */
    public List<String> getMonitoredPersons() {
        return monitoredPersons;
    }

    /**
     * 设置监控对象
     * 轨迹服务中的entity_name。
     * 支持通过entity列表向围栏添加entity。 每次添加entity上限为100个。
     * 示例：monitoredPerson =entity_name1,entity_name2,entity_name3 多个entity_name
     * 使用英文逗号分隔
     *
     * @param monitoredPersons 监控对象
     */
    public void setMonitoredPerson(List<String> monitoredPersons) {
        this.monitoredPersons = monitoredPersons;
    }

    /**
     * 获取围栏类型（本地围栏、服务端围栏）
     *
     * @return 围栏类型
     */
    public int getFenceType() {
        return fenceType;
    }

    /**
     * 设置围栏类型（本地围栏、服务端围栏）
     *
     * @param fenceType 围栏类型
     */
    public void setFenceType(int fenceType) {
        this.fenceType = fenceType;
    }
    
    public AddMonitoredPersonOption() {
        super();
    }

    /**
     * 增加围栏需监控的entity请求构造方法
     *
     * @param tag             请求标识
     * @param serviceId       轨迹服务ID
     * @param fenceId         服务端围栏ID
     * @param monitoredPersons 监控对象（entityName）
     * @param fenceType       服务端围栏类型
     */
    public AddMonitoredPersonOption(int tag, long serviceId, int fenceId, List<String> monitoredPersons,
                                     int fenceType) {
        super(tag, serviceId);
        this.fenceId = fenceId;
        this.monitoredPersons = monitoredPersons;
        this.fenceType = fenceType;
    }

    public AddMonitoredPersonRequest toAddMonitoredPersonRequest() {
        AddMonitoredPersonRequest addMonitoredPersonRequest = null;
        if (fenceType == FenceType.server.ordinal()) {
            if (monitoredPersons == null) {
                return null;
            }

            StringBuilder stringBuilder = new StringBuilder();
            for (int i = 0; i < monitoredPersons.size(); i++) {
                stringBuilder.append(monitoredPersons.get(i));
                if (i != monitoredPersons.size() - 1) {
                    stringBuilder.append(",");
                }
            }
            addMonitoredPersonRequest = com.baidu.trace.api.fence.AddMonitoredPersonRequest
                    .buildServerRequest(tag, serviceId, fenceId, stringBuilder.toString());
        }
        return addMonitoredPersonRequest;
    }

    @Override
    public String toString() {
        return "AddMonitoredPersonRequest [tag = " + tag + ", serviceId = " + serviceId
                + ", fenceId = "
                + fenceId + ", monitoredPersons = " + monitoredPersons + ", fenceType = " + fenceType
                + "]";
    }

}
