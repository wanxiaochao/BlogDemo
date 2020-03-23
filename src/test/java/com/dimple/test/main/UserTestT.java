package com.dimple.test.main;

public class UserTestT {

    private String userN;
    private String userP;

    public UserTestT() {
        System.out.println("调用父类构造");
    }

    public String getUserN() {
        return userN;
    }

    public void setUserN(String userN) {
        this.userN = userN;
    }

    public String getUserP() {
        return userP;
    }

    public void setUserP(String userP) {
        this.userP = userP;
    }
}
