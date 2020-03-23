package com.dimple.test.tactful;

import org.springframework.data.geo.GeoResult;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

public class Client {

    public static void main(String[] args) {

        /*List<String> pushUser = new ArrayList<>();
        for (int i = 0; i < 200; i++) {
            pushUser.add(i+"");
        }
        if (pushUser.size() > 100) {
            pushUser = pushUser.subList(0, 100);
        }*/


        List<Receipt> receiptList = new ArrayList<>();
        receiptList.add(new Receipt("我是MT2101回执喔","t1",new Client2("111")));
        receiptList.add(new Receipt("我是MT1101回执喔","t2",new Client2("222")));
        receiptList.add(new Receipt("我是MT8104回执喔","t3",new Client2("333")));
        receiptList.add(new Receipt("我是MT9999回执喔","t4",new Client2("444")));

        Set<String> collect = receiptList.stream().map(Receipt::getList).map(Client2::getUid).collect(Collectors.toSet());

        TactfulContext tactfulContext = new TactfulContext();
        for (Receipt receipt : receiptList) {
            TactfulInterface tactfulInterface = TactfulFactory.getTactfulInterface(receipt.getType());
            tactfulContext.setTactfulInterface(tactfulInterface);
            tactfulContext.handleReceipt(receipt);
        }

    }

}
