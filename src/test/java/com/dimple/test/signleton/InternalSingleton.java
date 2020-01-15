package com.dimple.test.signleton;

public class InternalSingleton {

    public InternalSingleton() {
    }

    private static class InternalClass {
        private static final InternalSingleton internalSingleton = new InternalSingleton();
    }

    public static InternalSingleton getInstance() {
        return InternalClass.internalSingleton;
    }
}
