package com.dimple.test.main;

public class UserSunTest extends UserTestT{

    private String ziU;

    public UserSunTest() {
        super();
        System.out.println("子类构造器");
    }

    public String getZiU() {
        return ziU;
    }

    public void setZiU(String ziU) {
        this.ziU = ziU;
    }

    public static void main(String[] args) {
        UserSunTest userSunTest = new UserSunTest();

        userSunTest.setUserN("1");
        userSunTest.setUserP("2");
        userSunTest.setZiU("3");

        System.out.println(userSunTest.getUserN());
        System.out.println(userSunTest.getZiU());
    }
}
