package com.baidu.flutter.trace.model.fence;

import com.baidu.flutter.trace.model.BaseOption;
import com.baidu.trace.api.fence.UpdateFenceRequest;
import com.baidu.trace.model.CoordType;

/**
 * 更新围栏请求
 *
 * @author baidu
 */
public final class UpdateFenceOption extends BaseOption {

    /**
     * 围栏
     */
    private Fence fence;

    /**
     * 获取围栏（根据实例类型进行强转）
     *
     * @return
     */
    public Fence getFence() {
        return fence;
    }
    
    public UpdateFenceOption() {
        super();
    }

    public UpdateFenceOption(int tag, long serviceId, Fence fence) {
        super(tag, serviceId);
        this.fence = fence;
    }

    public UpdateFenceRequest toUpdateFenceRequest() {
        if (fence == null) {
            return null;
        }
        UpdateFenceRequest updateFenceRequest = null;
        if (fence.getFenceType() == FenceType.local.ordinal()) {
            if (fence.getFenceShape() == FenceShape.circle.ordinal()) {
                if (fence.getCenter() != null) {
                    updateFenceRequest = com.baidu.trace.api.fence.UpdateFenceRequest
                            .buildLocalCircleRequest(tag, serviceId, fence.getFenceId(),
                                    fence.getFenceName(),
                                    fence.getMonitoredPerson(),
                                    fence.getCenter().toLatLng(),
                                    fence.getRadius(), fence.getDenoise(),
                                    CoordType.values()[fence.getCoordType()]);
                }
            }
        } else if (fence.getFenceType() == FenceType.server.ordinal()) {
            if (fence.getFenceShape() == FenceShape.circle.ordinal()) {
                if (fence.getCenter() != null) {
                    updateFenceRequest = com.baidu.trace.api.fence.UpdateFenceRequest
                            .buildServerCircleRequest(tag, serviceId, fence.getFenceId(),
                                    fence.getFenceName(),
                                    fence.getMonitoredPerson(),
                                    fence.getCenter().toLatLng(),
                                    fence.getRadius(), fence.getDenoise(),
                                    CoordType.values()[fence.getCoordType()]);
                }
            } else if (fence.getFenceShape() == FenceShape.district.ordinal()) {
                updateFenceRequest = UpdateFenceRequest.buildServerDistrictRequest(tag, serviceId
                        , fence.getFenceId(), fence.getFenceName(),
                        fence.getMonitoredPerson(), fence.getKeyword(),
                        fence.getDenoise());
            } else if (fence.getFenceShape() == FenceShape.polygon.ordinal()) {
                updateFenceRequest = UpdateFenceRequest.buildServerPolygonRequest(tag, serviceId,
                        fence.getFenceId(), fence.getFenceName(),
                        fence.getMonitoredPerson(), fence.getSDKVertexes(),
                        fence.getDenoise(), CoordType.values()[fence.getCoordType()]);
            } else if (fence.getFenceShape() == FenceShape.polyline.ordinal()) {
                updateFenceRequest = UpdateFenceRequest.buildServerPolylineRequest(tag, serviceId
                        , fence.getFenceId(), fence.getFenceName(),
                        fence.getMonitoredPerson(), fence.getSDKVertexes(),
                        fence.getOffset(), fence.getDenoise(),
                        CoordType.values()[fence.getCoordType()]);
            }
        }
        return updateFenceRequest;
    }

    @Override
    public String toString() {
        if (fence instanceof CircleFence) {
            return "UpdateFenceRequest [tag=" + tag + ", serviceId=" + serviceId + ", circleFence="
                    + fence.toString() + "]";
        } else if (fence instanceof PolygonFence) {
            return "UpdateFenceRequest [tag=" + tag + ", serviceId=" + serviceId + ", polygonFence="
                    + fence.toString() + "]";
        } else if (fence instanceof PolylineFence) {
            return "UpdateFenceRequest [tag=" + tag + ", serviceId=" + serviceId
                    + ", polylineFence="
                    + fence.toString() + "]";
        } else if (fence instanceof DistrictFence) {
            return "UpdateFenceRequest [tag=" + tag + ", serviceId=" + serviceId
                    + ", districtFence="
                    + fence.toString() + "]";
        } else {
            return "UpdateFenceRequest [tag=" + tag + ", serviceId=" + serviceId + ", fence="
                    + fence.toString() + "]";
        }
    }

}
