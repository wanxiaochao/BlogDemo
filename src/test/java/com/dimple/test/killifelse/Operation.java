package com.dimple.test.killifelse;

public interface Operation {

    // 计费方法
    double compute(long money);


    class OrdinaryOperation implements Operation {
        @Override
        public double compute(long money) {
            System.out.println("普通会员 不打折");
            return money;
        }
    }

    // 白银会员策略
    class SilverOperation implements Operation {

        @Override
        public double compute(long money) {

            System.out.println("白银会员 优惠50元");
            return money - 50;
        }
    }

    // 黄金会员策略
    class GoldOperation implements Operation {

        @Override
        public double compute(long money) {
            System.out.println("黄金会员 8折");
            return money * 0.8;
        }
    }

    // 白金会员策略
    class PlatinumOperation implements Operation {
        @Override
        public double compute(long money) {
            System.out.println("白金会员 优惠50元，再打7折");
            return (money - 50) * 0.7;
        }

    }
    }
