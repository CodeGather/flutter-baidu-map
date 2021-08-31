package com.baidu.flutter.trace.model.track;

import java.util.ArrayList;
import java.util.List;

/**
 * 上传失败的点信息
 */

public class FailInfo {

    /**
     * 输入参数不正确导致上传失败的点集
     */
    private List<ParamError> paramErrors;

    /**
     * 服务器内部错误导致上传失败的点集
     */
    private List<InternalError> internalErrors;

    /**
     * 获取输入参数不正确导致上传失败的点集
     *
     * @return
     */
    public List<ParamError> getParamErrors() {
        return paramErrors;
    }

    public void setParamErrors(List<ParamError> paramErrors) {
        this.paramErrors = paramErrors;
    }

    /**
     * 获取服务器内部错误导致上传失败的点集
     *
     * @return
     */
    public List<InternalError> getInternalErrors() {
        return internalErrors;
    }

    public void setInternalErrors(List<InternalError> internalErrors) {
        this.internalErrors = internalErrors;
    }

    public FailInfo() {
    }

    /**
     * @param paramErrors    输入参数不正确导致的上传失败的点集
     * @param internalErrors 服务器内部错误导致上传失败的点集
     */
    public FailInfo(List<ParamError> paramErrors, List<InternalError> internalErrors) {
        this.paramErrors = paramErrors;
        this.internalErrors = internalErrors;
    }

    /**
     * 服务器内部错误导致上传失败的点信息
     */
    public class InternalError {

        /**
         * Entity唯一标识
         */
        String entityName;

        /**
         * 轨迹点信息
         */
        TrackPoint trackPoint;

        /**
         * 获取Entity标识
         *
         * @return
         */
        public String getEntityName() {
            return entityName;
        }

        /**
         * 设置Entity标识
         *
         * @param entityName
         */
        public void setEntityName(String entityName) {
            this.entityName = entityName;
        }

        /**
         * 获取轨迹点信息
         *
         * @return
         */
        public TrackPoint getTrackPoint() {
            return trackPoint;
        }

        /**
         * 设置轨迹点信息
         *
         * @param trackPoint
         */
        public void setTrackPoint(TrackPoint trackPoint) {
            this.trackPoint = trackPoint;
        }

        public InternalError() {
        }

        /**
         * @param entityName Entity唯一标识
         * @param trackPoint 轨迹点信息
         */
        public InternalError(String entityName, TrackPoint trackPoint) {
            this.entityName = entityName;
            this.trackPoint = trackPoint;
        }

        public InternalError fromSDKObject(
                com.baidu.trace.api.track.FailInfo.InternalError internalError) {
            if (internalError == null) {
                return null;
            }
            InternalError internalErrorTmp = new InternalError();
            internalErrorTmp.setEntityName(internalError.getEntityName());
            internalErrorTmp.setTrackPoint(TrackPoint.fromSDKObject(internalError.getTrackPoint()));
            return internalErrorTmp;
        }

        @Override
        public String toString() {
            final StringBuffer sb = new StringBuffer("InternalError{");
            sb.append("entityName='").append(entityName).append('\'');
            sb.append(", trackPoint=").append(trackPoint);
            sb.append('}');
            return sb.toString();
        }
    }

    /**
     * 输入参数不正确导致上传失败的点信息
     */
    public class ParamError extends InternalError {

        /**
         * 错误信息
         */
        String error;

        /**
         * 获取错误信息
         *
         * @return
         */
        public String getError() {
            return error;
        }

        public void setError(String error) {
            this.error = error;
        }

        public ParamError() {
        }

        /**
         * @param entityName Entity唯一标识
         * @param trackPoint 轨迹点信息
         */
        public ParamError(String entityName, TrackPoint trackPoint, String error) {
            super(entityName, trackPoint);
            this.error = error;
        }

        public ParamError fromSDKObject(com.baidu.trace.api.track.FailInfo.ParamError paramError) {
            if (paramError == null) {
                return null;
            }
            ParamError paramErrorTmp = new ParamError();
            paramErrorTmp.setError(paramError.getError());
            paramErrorTmp.setEntityName(paramError.getEntityName());
            paramErrorTmp.setTrackPoint(TrackPoint.fromSDKObject(paramError.getTrackPoint()));
            return paramErrorTmp;
        }

        @Override
        public String toString() {
            final StringBuffer sb = new StringBuffer("ParamError{");
            sb.append("entityName='").append(entityName).append('\'');
            sb.append(", trackPoint=").append(trackPoint);
            sb.append(", error='").append(error).append('\'');
            sb.append('}');
            return sb.toString();
        }
    }

    public static FailInfo fromSDKObject(com.baidu.trace.api.track.FailInfo failInfo) {
        if (failInfo == null) {
            return null;
        }
        FailInfo failInfoTmp = new FailInfo();
        if (failInfo.getParamErrors() != null) {
            List<ParamError> paramErrorList = new ArrayList<>();
            for (com.baidu.trace.api.track.FailInfo.ParamError paramError : failInfo
                    .getParamErrors()) {
                paramErrorList.add(failInfoTmp.new ParamError().fromSDKObject(paramError));
            }
            failInfoTmp.setParamErrors(paramErrorList);
        }
        if (failInfo.getInternalErrors() != null) {
            List<InternalError> internalErrorList = new ArrayList<>();
            for (com.baidu.trace.api.track.FailInfo.InternalError internalError :
                    failInfo.getInternalErrors()) {
                internalErrorList.add(failInfoTmp.new InternalError().fromSDKObject(internalError));
            }
            failInfoTmp.setInternalErrors(internalErrorList);
        }
        return failInfoTmp;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("FailInfo{");
        sb.append("paramErrors=").append(paramErrors);
        sb.append(", internalErrors=").append(internalErrors);
        sb.append('}');
        return sb.toString();
    }

}


