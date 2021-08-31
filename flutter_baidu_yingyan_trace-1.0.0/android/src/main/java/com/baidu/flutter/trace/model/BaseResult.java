package com.baidu.flutter.trace.model;

/**
 * 响应结果基类
 *
 * @author baidu
 */
public class BaseResult {

    /**
     * 响应标识（与请求参数中设置的请求标识的值一致，用于唯一标记本次请求的响应结果）
     */
    public int tag;

    /**
     * 状态码
     */
    public int status;

    /**
     * 状态消息
     */
    public String message;

    /**
     * 获取状态码
     *
     * @return
     */
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    /**
     * 获取状态消息
     *
     * @return
     */
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    /**
     * 响应标记（与请求参数中设置的请求标识的值一致，用于唯一标记各请求对应的响应结果）
     *
     * @return
     */
    public int getTag() {
        return tag;
    }

    public void setTag(int tag) {
        this.tag = tag;
    }

    public BaseResult() {
        super();
    }

    /**
     * @param status  状态码
     * @param message 状态消息
     */
    public BaseResult(int status, String message) {
        super();
        this.status = status;
        this.message = message;
    }

    /**
     * @param tag     响应标识（与请求标识一致）
     * @param status  状态码
     * @param message 状态消息
     */
    public BaseResult(int tag, int status, String message) {
        this.tag = tag;
        this.status = status;
        this.message = message;
    }

}
