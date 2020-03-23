package com.dimple.test.tactful;

public class Tactful2 implements TactfulInterface {

    @Override
    public void handleReceipt(Receipt receipt) {
        System.out.println("解析报文MT2102:" + receipt.getMessage());
    }
}
