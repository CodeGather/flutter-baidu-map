package com.baidu.flutter.trace.model.fence;

import java.util.List;

import com.baidu.flutter.trace.model.BaseResult;

/**
 * 删除围栏响应结果
 *
 * @author baidu
 */
public final class DeleteFenceResult extends BaseResult {

    /**
     * 围栏编号列表
     */
    private List<Long> fenceIds;

    /**
     * 围栏类型
     */
    private int fenceType;

    /**
     * 获取围栏编号列表
     *
     * @return
     */
    public List<Long> getFenceIds() {
        return fenceIds;
    }

    public void setFenceIds(List<Long> fenceIds) {
        this.fenceIds = fenceIds;
    }

    /**
     * 获取围栏类型
     *
     * @return
     */
    public int getFenceType() {
        return fenceType;
    }

    public void setFenceType(int fenceType) {
        this.fenceType = fenceType;
    }

    public DeleteFenceResult() {
    }

    /**
     * @param tag       响应标识（与请求标识一致）
     * @param status    状态码
     * @param message   状态消息
     * @param fenceType
     */
    public DeleteFenceResult(int tag, int status, String message, int fenceType) {
        super(tag, status, message);
        this.fenceType = fenceType;
    }

    /**
     * @param tag       响应标识（与请求标识一致）
     * @param status    状态码
     * @param message   状态消息
     * @param fenceIds  围栏编号列表
     * @param fenceType 围栏类型
     */
    public DeleteFenceResult(int tag, int status, String message, List<Long> fenceIds,
                             int fenceType) {
        this(tag, status, message, fenceType);
        this.fenceIds = fenceIds;
    }

    @Override
    public String toString() {
        return "DeleteFenceResponse [tag=" + tag + ", status=" + status + ", message=" + message
                + ", fenceType="
                + fenceType + ", fenceIds=" + fenceIds + "]";
    }

}
