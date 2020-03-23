package com.dimple.test.tactful;

import lombok.Data;

@Data
public class Receipt {
    /**
     * 回执信息
     */
    String message;

    /**
     * 回执类型(`MT1101、MT2101、MT4101、MT8104、MT8105、MT9999`)
     */
    String type;

    private Client2 list;

    public Receipt() {
    }

    public Receipt(String message, String type) {
        this.message = message;
        this.type = type;
    }

    public Receipt(String message, String type, Client2 list) {
        this.message = message;
        this.type = type;
        this.list = list;
    }
}
