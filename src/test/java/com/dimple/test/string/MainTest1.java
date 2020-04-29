package com.dimple.test.string;

import java.math.BigDecimal;

public class MainTest1 {

    public static void main(String[] args) {
        String s = "恭喜，您从%s升级到%s;很遗憾，您从%s降级到%s";
        String[] split = s.split(";");
        String format = String.format(split[0], 1, 1);
        System.out.println(format);
    }

}
