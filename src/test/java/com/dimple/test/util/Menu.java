package com.dimple.test.util;

import io.swagger.models.auth.In;

import java.util.List;

public class Menu {

    private String id;
    private String parentId;
    private String text;
    private String url;
    private String yxbz;
    private List<Menu> children;
    private List<String> ccc;

    public Menu(String gn001D000, String s, String 系统管理, String s1, String y) {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getYxbz() {
        return yxbz;
    }

    public void setYxbz(String yxbz) {
        this.yxbz = yxbz;
    }

    public List<Menu> getChildren() {
        return children;
    }

    public void setChildren(List<Menu> children) {
        this.children = children;
    }

    public List<String> getCcc() {
        return ccc;
    }

    public void setCcc(List<String> ccc) {
        this.ccc = ccc;
    }

    public Menu(String id, String parentId, String text, String url, String yxbz, List<Menu> children, List<String> ccc) {
        this.id = id;
        this.parentId = parentId;
        this.text = text;
        this.url = url;
        this.yxbz = yxbz;
        this.children = children;
        this.ccc = ccc;
    }
}
