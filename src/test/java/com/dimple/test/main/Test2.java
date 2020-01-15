package com.dimple.test.main;

import java.time.LocalDateTime;
import java.time.ZoneId;

public class Test2 {

    public static void main(String[] args) {

        //这里a:表示tag，方便从里层循环中跳出
        a:for (int i=0;i < 101;i++){
            //0,1排出，定义是大于1的
            if (i==0||i==1){
                continue ;
            }
            //循环遍历出比当前数字小的数字，然后取模，如果能整除则为它的因数
            b:for (int j=2;j< i;j++){
                if (i%j==0){
                    //跳出外层循环a
                    continue a;
                }
            }
            System.out.print(i+",");
        }

        int hour = LocalDateTime.now(ZoneId.systemDefault()).getHour();
        String key = "abc4564546";
        String key2 = "abc4564546";
        int i = key.hashCode();
        i = i ^ (i >>> 16);
        System.out.println(i);


        int i2 = key2.hashCode();
        i2 = i2 ^ (i2 >>> 16);
        System.out.println(i2);
    }

}
