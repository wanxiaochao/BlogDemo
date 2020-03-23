package com.dimple.test.tactful;

public class Tactful3 implements TactfulInterface {

    @Override
    public void handleReceipt(Receipt receipt) {
        System.out.println("解析报文MT2103:" + receipt.getMessage());
    }
}
