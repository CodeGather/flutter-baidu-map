package com.baidu.flutter.trace.model.fence;

import com.baidu.flutter.trace.model.BaseResult;

/**
 * 删除围栏所监控的entity响应封装
 * V3.1.0新增接口
 */

public class DeleteMonitoredPersonResult extends BaseResult {
    /**
     * 围栏类型
     */
    private int fenceType;

    /**
     * 获取围栏类型
     *
     * @return 围栏类型
     */
    public int getFenceType() {
        return fenceType;
    }

    /**
     * 设置围栏类型
     *
     * @param fenceType 围栏类型
     */
    public void setFenceType(int fenceType) {
        this.fenceType = fenceType;
    }

    /**
     * @param tag       响应标识（与请求标识一致）
     * @param status    状态码
     * @param message   状态消息
     * @param fenceType 围栏类型
     */
    public DeleteMonitoredPersonResult(int tag, int status, String message, int fenceType) {
        super(tag, status, message);
        this.fenceType = fenceType;
    }

    @Override
    public String toString() {
        return "DeleteMonitoredPersonResponse [tag = " + tag + ", status = " + status
                + ", message = "
                + message + ", fenceType = " + fenceType + "]";
    }
}
