package com.baidu.flutter.trace.model.fence;

import java.util.List;

import com.baidu.flutter.trace.model.BaseResult;

/**
 * 创建围栏响应结果
 *
 * @author baidu
 */
public final class CreateFenceResult extends BaseResult {

    /**
     * 围栏ID
     */
    private long fenceId;

    /**
     * 围栏名称
     */
    private String fenceName;

    /**
     * 围栏类型（本地围栏、服务端围栏）
     */
    private int fenceType;

    /**
     * 围栏形状（圆形围栏、多边形围栏、多段线围栏）
     */
    private int fenceShape;

    /**
     * 结构化的行政区划描述
     * <p>
     * 注：只在行政区划围栏创建成功时，该字段有值。
     */
    private String district;

    /**
     * 关键字匹配的行政区划列表
     * <p>
     * 注：只在行政区划围栏创建失败时（关键字匹配至多个行政区），该字段有值。
     */
    private List<String> districtList;

    /**
     * 获取围栏ID
     *
     * @return
     */
    public long getFenceId() {
        return fenceId;
    }

    public void setFenceId(long fenceId) {
        this.fenceId = fenceId;
    }

    /**
     * 获取围栏名称
     *
     * @return
     */
    public String getFenceName() {
        return fenceName;
    }

    public void setFenceName(String fenceName) {
        this.fenceName = fenceName;
    }

    /**
     * 获取围栏类型（本地围栏、服务端围栏）
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
     * 获取围栏形状（圆形围栏、多边形围栏、多段线围栏）
     *
     * @return
     */
    public int getFenceShape() {
        return fenceShape;
    }

    public void setFenceShape(int fenceShape) {
        this.fenceShape = fenceShape;
    }

    /**
     * 获取结构化的行政区划描述
     * <p>
     * 注：只在行政区划围栏创建成功时，该字段有值。
     *
     * @return
     */
    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    /**
     * 获取关键字匹配的行政区划列表
     * <p>
     * 注：只在行政区划围栏创建失败时（关键字匹配至多个行政区），该字段有值。
     *
     * @return
     */
    public List<String> getDistrictList() {
        return districtList;
    }

    public void setDistrictList(List<String> districtList) {
        this.districtList = districtList;
    }

    /**
     * @param tag       响应标识
     * @param status    状态码
     * @param message   状态消息
     * @param fenceType 围栏类型
     */
    public CreateFenceResult(int tag, int status, String message, int fenceType) {
        super(tag, status, message);
        this.fenceType = fenceType;
    }

    /**
     * @param tag        响应标识
     * @param status     状态码
     * @param message    状态消息
     * @param fenceName  围栏名称
     * @param fenceShape 围栏形状
     * @param fenceType  围栏类型
     */
    public CreateFenceResult(int tag, int status, String message, String fenceName, Long fenceId, int fenceShape, int fenceType) {
        this(tag, status, message, fenceType);
        this.fenceName = fenceName;
        this.fenceShape = fenceShape;
        this.fenceId = fenceId;
    }

    @Override
    public String toString() {
        if (FenceShape.district.ordinal() != fenceShape) {
            return "CreateFenceResponse [tag=" + tag + ", status=" + status + ", message=" + message
                    + ", fenceId="
                    + fenceId + ", fenceName=" + fenceName + ", fenceType=" + fenceType
                    + ", fenceShape=" + fenceShape
                    + "]";
        } else {
            return "CreateFenceResponse [tag=" + tag + ", status=" + status + ", message=" + message
                    + ", fenceId="
                    + fenceId + ", fenceName=" + fenceName + ", fenceType=" + fenceType
                    + ", fenceShape=" + fenceShape
                    + ", district=" + district + ", districtList=" + districtList + "]";
        }
    }

}
