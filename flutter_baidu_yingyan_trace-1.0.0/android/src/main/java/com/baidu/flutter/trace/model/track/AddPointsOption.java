package com.baidu.flutter.trace.model.track;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.baidu.flutter.trace.model.BaseOption;
import com.baidu.flutter.trace.utils.DataConvertUtil;
import com.baidu.trace.api.track.AddPointsRequest;

/**
 * 批量添加轨迹点请求类
 */

public class AddPointsOption extends BaseOption {

    /**
     * 轨迹点集
     * <p>
     * 注：Map中key为entityName， value为轨迹点集
     */
    private HashMap<String, List<Map<String, Object>>> customTrackPoints = null;

    public HashMap<String, List<Map<String, Object>>> getPoints() {
        return customTrackPoints;
    }

    /**
     * 设置轨迹点集
     *
     * @param points 轨迹点集，Map中key为entityName， value为轨迹点集
     */
    public void setPoints(HashMap<String, List<Map<String, Object>>> points) {
        this.customTrackPoints = points;
    }

    public AddPointsOption() {
    }

    /**
     * 创建批量添加轨迹点请求实例
     *
     * @param tag       请求标识
     * @param serviceId 轨迹服务ID
     */
    public AddPointsOption(int tag, long serviceId) {
        super(tag, serviceId);
    }

    /**
     * 创建批量添加轨迹点请求实例
     *
     * @param tag       请求标识
     * @param serviceId 轨迹服务ID
     * @param points    轨迹点集，Map中key为entityName， value为轨迹点集
     */
    public AddPointsOption(int tag, long serviceId,
                           HashMap<String, List<Map<String, Object>>> points) {
        super(tag, serviceId);
        this.customTrackPoints = points;
    }

    public AddPointsRequest toAddPointsRequest() {
        AddPointsRequest addPointsRequest = new AddPointsRequest();
        addPointsRequest.setTag(tag);
        addPointsRequest.setServiceId(serviceId);
        if (customTrackPoints != null) {
            Map<String, List<com.baidu.trace.api.track.TrackPoint>> map = new HashMap<>();
            Iterator<Map.Entry<String, List<Map<String, Object>>>> iterator =
                    customTrackPoints.entrySet().iterator();
            while (iterator.hasNext()) {
                Map.Entry<String, List<Map<String, Object>>> entry = iterator.next();
                List<com.baidu.trace.api.track.TrackPoint> trackPoints = new ArrayList<>();
                for (Map<String, Object> trackPoint : entry.getValue()) {
                    TrackPoint trackPointTmp =
                            (TrackPoint) DataConvertUtil.mapToObject(trackPoint, TrackPoint.class);
                    trackPoints.add(trackPointTmp.toTracePoint());
                }
                map.put(entry.getKey(), trackPoints);
            }

            addPointsRequest.setPoints(map);

        }
        return addPointsRequest;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("AddPointsRequest{");
        sb.append("tag=").append(tag);
        sb.append(", serviceId=").append(serviceId);
        sb.append(", customTrackPoints=").append(customTrackPoints);
        sb.append('}');
        return sb.toString();
    }
}
