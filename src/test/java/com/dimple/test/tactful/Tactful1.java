package com.dimple.test.tactful;

public class Tactful1 implements TactfulInterface {

    @Override
    public void handleReceipt(Receipt receipt) {
        System.out.println("解析报文MT2101:" + receipt.getMessage());
    }
}
