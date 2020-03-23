package com.dimple.test.tactful;

public class TactfulContext {

    private TactfulInterface tactfulInterface;

    public void setTactfulInterface(TactfulInterface tactfulInterface) {
        this.tactfulInterface = tactfulInterface;
    }

    public void handleReceipt(Receipt receipt){
        if (tactfulInterface != null) {
            tactfulInterface.handleReceipt(receipt);
        }
    }
}
