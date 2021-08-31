package com.baidu.flutter.trace.model.fence;

import java.util.ArrayList;
import java.util.List;

import com.baidu.flutter.trace.model.BaseResult;

/**
 * 查询围栏响应结果
 *
 * @author baidu
 */
public final class FenceListResult extends BaseResult {

    /**
     * 返回的结果条数
     */
    private int size;

    /**
     * 所有围栏的个数
     * 服务端围栏查询使用
     * V3.1.0新增字段
     */
    private int totalSize;

    /**
     * 围栏类型
     */
    private int fenceType;

    /**
     * 围栏信息列表
     */
    private List<FenceInfo> fenceInfos;

    /**
     * 获取返回的结果条数
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
     * 获取围栏信息列表
     *
     * @return
     */
    public List<FenceInfo> getFenceInfos() {
        return fenceInfos;
    }

    public void setFenceInfos(List<FenceInfo> fenceInfos) {
        this.fenceInfos = fenceInfos;
    }

    /**
     * 获取所有围栏的个数
     * 服务端围栏查询使用
     * V3.1.0新增字段
     *
     * @return 返回所有围栏的个数
     */
    public int getTotalSize() {
        return totalSize;
    }

    /**
     * 设置所有围栏的个数
     * 服务端围栏查询使用
     * V3.1.0新增字段
     *
     * @param totalSize 返回所有围栏的个数
     */
    public void setTotalSize(int totalSize) {
        this.totalSize = totalSize;
    }

    /**
     * @param tag       响应标识（与请求标识一致）
     * @param status    状态码
     * @param message   状态消息
     * @param fenceType 围栏类型
     */
    public FenceListResult(int tag, int status, String message, int fenceType) {
        super(tag, status, message);
        this.fenceType = fenceType;
    }

    /**
     * FenceListResponse构造函数
     * V3.1.0版本新增，V3.1.0版本之后请使用该方法
     *
     * @param tag        响应标识（与请求标识一致）
     * @param status     状态码
     * @param message    状态消息
     * @param size       返回的结果条数
     * @param fenceType  围栏类型
     * @param fenceInfos 围栏信息列表
     * @param totalSize  所有围栏个数
     */
    public FenceListResult(int tag, int status, String message, int size, int fenceType,
                           List<com.baidu.trace.api.fence.FenceInfo> fenceInfos, int totalSize) {
        this(tag, status, message, fenceType);
        this.size = size;
        if (fenceInfos != null) {
            List<FenceInfo> fenceInfoList = new ArrayList<>();
            for (com.baidu.trace.api.fence.FenceInfo fenceInfo : fenceInfos) {
                fenceInfoList.add(FenceInfo.fromSDKObject(fenceInfo));
            }
            this.fenceInfos = fenceInfoList;
        }
        this.totalSize = totalSize;
    }

    @Override
    public String toString() {
        return "FenceListResponse [tag=" + tag + ", status=" + status + ", message=" + message
                + ", size=" + size
                + ", fenceType=" + fenceType + ", fenceInfos=" + fenceInfos + "totalSize="
                + totalSize + "]";
    }

}
