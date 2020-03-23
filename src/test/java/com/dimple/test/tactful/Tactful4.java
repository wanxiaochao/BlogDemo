package com.dimple.test.tactful;

public class Tactful4 implements TactfulInterface {

    @Override
    public void handleReceipt(Receipt receipt) {
        System.out.println("解析报文MT2104:" + receipt.getMessage());
    }
}
