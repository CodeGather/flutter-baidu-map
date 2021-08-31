package com.baidu.flutter.trace.model.fence;

import com.baidu.flutter.trace.model.BaseOption;
import com.baidu.trace.api.fence.CreateFenceRequest;
import com.baidu.trace.model.CoordType;

/**
 * 创建围栏请求参数
 *
 * @author baidu
 */
public final class CreateFenceOption extends BaseOption {

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

    public CreateFenceOption() {
        super();
    }

    private CreateFenceOption(int tag, long serviceId, Fence fence) {
        super(tag, serviceId);
        this.fence = fence;
    }

    public CreateFenceRequest toCreateFenceRequest() {
        if (fence == null) {
            return null;
        }
        CreateFenceRequest createFenceRequest = null;
        if (fence.getFenceType() == FenceType.local.ordinal()) {
            if (fence.getFenceShape() == FenceShape.circle.ordinal()) {
                if (fence.getCenter() != null) {
                    createFenceRequest = com.baidu.trace.api.fence.CreateFenceRequest
                            .buildLocalCircleRequest(tag, serviceId,
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
                    createFenceRequest = com.baidu.trace.api.fence.CreateFenceRequest
                            .buildServerCircleRequest(tag, serviceId,
                                    fence.getFenceName(),
                                    fence.getMonitoredPerson(),
                                    fence.getCenter().toLatLng(),
                                    fence.getRadius(), fence.getDenoise(),
                                    CoordType.values()[fence.getCoordType()]);
                }
            } else if (fence.getFenceShape() == FenceShape.district.ordinal()) {
                createFenceRequest = CreateFenceRequest
                        .buildServerDistrictRequest(tag, serviceId, fence.getFenceName(),
                                fence.getMonitoredPerson(), fence.getKeyword(),
                                fence.getDenoise());
            } else if (fence.getFenceShape() == FenceShape.polygon.ordinal()) {
                createFenceRequest = CreateFenceRequest
                        .buildServerPolygonRequest(tag, serviceId, fence.getFenceName(),
                                fence.getMonitoredPerson(), fence.getSDKVertexes(),
                                fence.getDenoise(),
                                CoordType.values()[fence.getCoordType()]);
            } else if (fence.getFenceShape() == FenceShape.polyline.ordinal()) {
                createFenceRequest = CreateFenceRequest
                        .buildServerPolylineRequest(tag, serviceId, fence.getFenceName(),
                                fence.getMonitoredPerson(), fence.getSDKVertexes(),
                                fence.getOffset(), fence.getDenoise(),
                                CoordType.values()[fence.getCoordType()]);
            }
        }
        return createFenceRequest;
    }

    @Override
    public String toString() {
        if (fence instanceof CircleFence) {
            return "CreateFenceRequest [tag=" + tag + ", serviceId=" + serviceId + ", circleFence="
                    + fence.toString() + "]";
        } else if (fence instanceof PolygonFence) {
            return "CreateFenceRequest [tag=" + tag + ", serviceId=" + serviceId + ", polygonFence="
                    + fence.toString() + "]";
        } else if (fence instanceof PolylineFence) {
            return "CreateFenceRequest [tag=" + tag + ", serviceId=" + serviceId
                    + ", polylineFence="
                    + fence.toString() + "]";
        } else if (fence instanceof DistrictFence) {
            return "CreateFenceRequest [tag=" + tag + ", serviceId=" + serviceId
                    + ", districtFence="
                    + fence.toString() + "]";
        } else {
            return "CreateFenceRequest [tag=" + tag + ", serviceId=" + serviceId + ", Fence="
                    + fence.toString() + "]";
        }
    }
}
