package com.dimple.test.signleton;

public class HungrySingleton {

    private static final HungrySingleton HUNGRY_SIGNLETON = new HungrySingleton();

    public HungrySingleton() {
    }

    public static HungrySingleton getInstance() {
        return HUNGRY_SIGNLETON;
    }

}
