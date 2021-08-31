package com.baidu.flutter.trace.model.entity;

import java.util.ArrayList;
import java.util.List;

import com.baidu.flutter.trace.model.BaseResult;

/**
 * entity搜索接口通用响应结果
 *
 * @author baidu
 */
public class CommonResult extends BaseResult {

    /**
     * 本次检索总结果条数
     */
    public int totalSize;

    /**
     * 本页返回的结果条数
     */
    public int size;

    /**
     * entity详细信息列表
     */
    public List<EntityInfo> entities;

    /**
     * 获取本次检索总结果条数
     *
     * @return
     */
    public int getTotalSize() {
        return totalSize;
    }

    public void setTotalSize(int totalSize) {
        this.totalSize = totalSize;
    }

    /**
     * 获取本页返回的结果条数
     *
     * @return
     */
    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    /**
     * 获取entity详细信息列表
     *
     * @return
     */
    public List<EntityInfo> getEntities() {
        return entities;
    }

    public void setEntities(List<EntityInfo> entities) {
        this.entities = entities;
    }

    public CommonResult() {
        super();
    }

    /**
     * @param tag     响应标识
     * @param status  状态码
     * @param message 状态信息
     */
    public CommonResult(int tag, int status, String message) {
        super(tag, status, message);
    }

    /**
     * @param tag      响应标识
     * @param status   状态码
     * @param message  状态信息
     * @param totalSize    本次检索总结果条数
     * @param size     本页返回的结果条数
     * @param entities entity详细信息列表
     */
    public CommonResult(int tag, int status, String message, int totalSize, int size,
                        List<com.baidu.trace.api.entity.EntityInfo> entities) {
        super(tag, status, message);
        this.totalSize = totalSize;
        this.size = size;
        if (entities != null) {
            List<EntityInfo> flutterEntities = new ArrayList<>();
            for (com.baidu.trace.api.entity.EntityInfo entityInfo : entities) {
                EntityInfo entityInfoTmp = new EntityInfo();
                entityInfoTmp.setCreateTime(entityInfo.getCreateTime());
                entityInfoTmp.setEntityName(entityInfo.getEntityName());
                entityInfoTmp.setEntityDesc(entityInfo.getEntityDesc());
                entityInfoTmp.setModifyTime(entityInfo.getModifyTime());
                entityInfoTmp.setLatestLocation(entityInfo.getLatestLocation());
                entityInfoTmp.setColumns(entityInfo.getColumns());
                flutterEntities.add(entityInfoTmp);
            }
            this.entities = flutterEntities;
        }
    }

    @Override
    public String toString() {
        return "CommonResult [tag=" + tag + ", status=" + status + ", message=" + message
                + ", totalSize=" + totalSize
                + ", size=" + size + ", entities=" + entities + "]";
    }

}
