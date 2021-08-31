package com.baidu.flutter.trace.model.track;

import com.baidu.flutter.trace.model.BaseResult;

/**
 * 批量添加轨迹点响应类
 */

public class AddPointsResult extends BaseResult {

    /**
     * 上传成功的点个数
     */
    private int successNum;

    /**
     * 上传失败的点信息
     */
    private FailInfo failInfo;

    /**
     * 获取上传成功的点个数
     *
     * @return
     */
    public int getSuccessNum() {
        return successNum;
    }

    public void setSuccessNum(int successNum) {
        this.successNum = successNum;
    }

    /**
     * 获取上传失败的点信息
     *
     * @return
     */
    public FailInfo getFailInfo() {
        return failInfo;
    }

    public void setFailInfo(FailInfo failInfo) {
        this.failInfo = failInfo;
    }

    public AddPointsResult() {
    }

    /**
     * @param tag 响应标识（与请求标识一致）
     */
    public AddPointsResult(int tag) {
        this.tag = tag;
    }

    /**
     * @param tag     响应标识（与请求标识一致）
     * @param status  状态码
     * @param message 状态消息
     */
    public AddPointsResult(int tag, int status, String message) {
        super(tag, status, message);
    }

    /**
     * @param tag        响应标识（与请求标识一致）
     * @param status     状态码
     * @param message    状态消息
     * @param successNum 上传成功的点个数
     * @param failInfo   上传失败的点信息
     */
    public AddPointsResult(int tag, int status, String message, int successNum,
                           com.baidu.trace.api.track.FailInfo failInfo) {
        super(tag, status, message);
        this.successNum = successNum;
        this.failInfo = FailInfo.fromSDKObject(failInfo);
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("AddPointsResponse{");
        sb.append("tag=").append(tag);
        sb.append(", status=").append(status);
        sb.append(", message=").append(message).append('\'');
        sb.append(", successNum=").append(successNum);
        sb.append(", failInfo=").append(failInfo);
        sb.append('}');
        return sb.toString();
    }
}
