package com.baidu.flutter.trace.model;

/**
 * 请求参数基类
 *
 * @author baidu
 */
public class BaseOption {

    /**
     * 请求标识（用于唯一标记本次请求，在响应结果中会返回该标识）
     */
    public int tag;

    /**
     * 鹰眼服务ID
     */
    public long serviceId;

    public int getTag() {
        return tag;
    }

    /**
     * 设置请求标识（用于唯一标记本次请求，在响应结果中会返回该标识）
     *
     * @param tag
     */
    public void setTag(int tag) {
        this.tag = tag;
    }

    public long getServiceId() {
        return serviceId;
    }

    /**
     * 设置鹰眼服务ID
     *
     * @param serviceId
     */
    public void setServiceId(long serviceId) {
        this.serviceId = serviceId;
    }

    public BaseOption() {
        super();
    }

    public BaseOption(int tag, long serviceId) {
        super();
        this.tag = tag;
        this.serviceId = serviceId;
    }

}
