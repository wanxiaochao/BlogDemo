package com.dimple.test.killifelse;

public enum OperationEnum {

    ADD {
        @Override
        public int apply(int a, int b) {
            System.out.println("加法！");
            return a + b;
        }
    }, DECREASE {
        @Override
        public int apply(int a, int b) {
            System.out.println("减法！");
            return a - b;
        }
    };

    public abstract int apply(int a, int b);
}
