package com.dimple.test.killifelse;

public class MainTest {

    public static void main(String[] args) {

        Operation targetOperation = OperatorFactory
                .getOperation("add")
                .orElseThrow(() -> new IllegalArgumentException("Invalid Operator"));
        System.out.println(targetOperation.compute(1));

        OperationEnum add = OperationEnum.valueOf("ADD");
        int apply = add.apply(1, 2);
        System.out.println(apply);
    }

}
