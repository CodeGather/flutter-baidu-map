package com.baidu.flutter.trace.model.analysis;

import java.util.ArrayList;
import java.util.List;

import com.baidu.flutter.trace.model.BaseResult;

/**
 * 停留点响应
 *
 * @author baidu
 */
public final class StayPointResult extends BaseResult {

    /**
     * 停留次数
     */
    private int stayPointNum;

    /**
     * 停留记录列表
     */
    private List<StayPoint> stayPoints;

    /**
     * 获取停留次数
     *
     * @return
     */
    public int getStayPointNum() {
        return stayPointNum;
    }

    public void setStayPointNum(int stayPointNum) {
        this.stayPointNum = stayPointNum;
    }

    /**
     * 获取停留点列表
     *
     * @return
     */
    public List<StayPoint> getStayPoints() {
        return stayPoints;
    }

    public void setStayPoints(List<StayPoint> stayPoints) {
        this.stayPoints = stayPoints;
    }

    /**
     * @param tag     请求标识
     * @param status  状态码
     * @param message 状态信息
     */
    public StayPointResult(int tag, int status, String message) {
        super(tag, status, message);
    }

    /**
     * @param tag          请求标识
     * @param status       状态码
     * @param message      状态信息
     * @param stayPointNum 停留次数
     * @param stayPoints   停留记录列表
     */
    public StayPointResult(int tag, int status, String message, int stayPointNum,
                           List<com.baidu.trace.api.analysis.StayPoint> stayPoints) {
        super(tag, status, message);
        this.stayPointNum = stayPointNum;
        if (stayPoints != null) {
            List<StayPoint> flutterStayPoints = new ArrayList<>();
            for (com.baidu.trace.api.analysis.StayPoint stayPoint : stayPoints) {
                StayPoint stayPointTmp = new StayPoint();
                stayPointTmp.setLocation(stayPoint.getLocation());
                stayPointTmp.setCoordType(stayPoint.getCoordType().ordinal());
                stayPointTmp.setRadius(stayPoint.getRadius());
                stayPointTmp.setLocTime(stayPoint.getLocTime());
                stayPointTmp.setDirection(stayPoint.getDirection());
                stayPointTmp.setSpeed(stayPoint.getSpeed());
                stayPointTmp.setHeight(stayPoint.getHeight());
                stayPointTmp.setStartTime(stayPoint.getStartTime());
                stayPointTmp.setEndTime(stayPoint.getEndTime());
                stayPointTmp.setDuration(stayPoint.getDuration());
                flutterStayPoints.add(stayPointTmp);
            }
            this.stayPoints = flutterStayPoints;
        }
    }

    @Override
    public String toString() {
        return "StayPointResponse [tag=" + tag + ", status=" + status + ", message=" + message
                + ", stayPointNum="
                + stayPointNum + ", stayPoints=" + stayPoints + "]";
    }

}
