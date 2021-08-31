package com.baidu.flutter.trace.model.fence;

import java.util.ArrayList;
import java.util.List;

import com.baidu.flutter.trace.model.BaseResult;

/**
 * 查询围栏历史报警响应结果
 *
 * @author baidu
 */
public final class HistoryAlarmResult extends BaseResult {

    /**
     * 本次查询总报警数
     */
    private int totalSize;

    /**
     * 本页返回的结果条数
     */
    private int size;

    /**
     * 围栏类型
     */
    private int fenceType;

    /**
     * 监控对象历史报警列表
     */
    private List<FenceAlarmInfo> fenceAlarmInfos;

    /**
     * 获取本次查询总报警数
     *
     * @return
     */
    public int getTotalSize() {
        return totalSize;
    }

    public void setTotalSize(int total) {
        this.totalSize = total;
    }

    /**
     * 获取本页返回的结果条数
     *
     * @return
     */
    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
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

    /**
     * 获取历史报警信息列表
     *
     * @return
     */
    public List<FenceAlarmInfo> getFenceAlarmInfos() {
        return fenceAlarmInfos;
    }

    public void setFenceAlarmInfos(List<FenceAlarmInfo> fenceAlarmInfos) {
        this.fenceAlarmInfos = fenceAlarmInfos;
    }

    /**
     * @param tag       响应标识（与请求标识一致）
     * @param status    状态码
     * @param message   状态消息
     * @param fenceType 围栏类型
     */
    public HistoryAlarmResult(int tag, int status, String message, int fenceType) {
        super(tag, status, message);
        this.fenceType = fenceType;
    }

    /**
     * @param tag             响应标识（与请求标识一致）
     * @param status          状态码
     * @param message         状态消息
     * @param total           本次查询总报警数
     * @param size            本页返回的结果条数
     * @param fenceType       围栏类型
     * @param fenceAlarmInfos 监控对象历史报警列表
     */
    public HistoryAlarmResult(int tag, int status, String message, int total, int size,
                              int fenceType,
                              List<com.baidu.trace.api.fence.FenceAlarmInfo> fenceAlarmInfos) {
        this(tag, status, message, fenceType);
        this.totalSize = total;
        this.size = size;
        if (fenceAlarmInfos != null) {
            List<FenceAlarmInfo> fenceAlarmInfoList = new ArrayList<>();
            for (com.baidu.trace.api.fence.FenceAlarmInfo fenceAlarmInfo : fenceAlarmInfos) {
                fenceAlarmInfoList.add(FenceAlarmInfo.fromSDKObject(fenceAlarmInfo));
            }
            this.fenceAlarmInfos = fenceAlarmInfoList;
        }
    }

    @Override
    public String toString() {
        return "HistoryAlarmResponse [tag=" + tag + ", status=" + status + ", message=" + message
                + ", totalSize=" + totalSize
                + ", size=" + size + ", fenceType=" + fenceType + ", fenceAlarmInfos="
                + fenceAlarmInfos + "]";
    }

}
