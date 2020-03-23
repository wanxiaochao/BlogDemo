package com.dimple.test.tactful;

import lombok.Data;

@Data
public class Client2 {

    private String uid;

    public Client2() {
    }

    public Client2(String uid) {
        this.uid = uid;
    }
}
