package com.baidu.flutter.trace.model.entity;

import com.baidu.trace.api.entity.LocRequest;
import com.baidu.trace.model.BaseRequest;

/**
 * 定位请求
 *
 * @author baidu
 */
public class RealTimeLocationOption extends BaseRequest {

    public RealTimeLocationOption() {
        super();
    }

    /**
     * @param serviceId 轨迹服务ID
     */
    public RealTimeLocationOption(long serviceId) {
        this.serviceId = serviceId;
    }

    /**
     * @param tag       请求标识
     * @param serviceId 轨迹服务ID
     */
    public RealTimeLocationOption(int tag, long serviceId) {
        super(tag, serviceId);
    }
    
    public LocRequest toLocRequest() {
        LocRequest locRequest = new LocRequest();
        locRequest.setTag(tag);
        locRequest.setServiceId(serviceId);
        return locRequest;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("LocRequest{");
        sb.append("tag=").append(tag);
        sb.append("serviceId=").append(serviceId);
        sb.append('}');
        return sb.toString();
    }
}
