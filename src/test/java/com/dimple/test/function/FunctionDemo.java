package com.dimple.test.function;

import java.util.ArrayList;
import java.util.List;
import java.util.function.*;

/**
 * 接口                 参数  返回类型    说明
 * Predicate<T>          T   boolean     断言
 * Consumer<T>           T      /        消费一个数据
 * Function<T,R>         T      R        输入T 输出R的函数
 * Supplier<T>           /      T        提供一个数据
 * UnaryOperator<T>      T      T        一元函数(输入输出结果一致)
 * BiFunction<T,U,R>   (T,U)    R        两个输入的函数
 * BinaryOperator<T>   (T,T)    T        二元函数(输入输出类型一致)
 */
public class FunctionDemo {

    public static void main(String[] args) {
        //int double boolean float char long byte shoat
        //断言
        predicate();
        //消费数据
        consumer();
        //输入一个值返回另一个
        function();
        //返回一个值出来
        supplier();
        //一元函数 输入输出类型保持一致
        unaryOperator();
        //两个输入的函数 输出第三个类型的值
        biFunction();
        //二元函数(输入输出类型一致)
        binaryOperator();
        new Thread(()-> System.out.println("lambda启动Thread线程")).start();

    }

    public static void predicate() {
        Predicate<Integer> predicate = i -> i > 5;
        IntPredicate intPredicate = i -> i > 5;
        System.out.println("predicate输出:"+predicate.test(2));
        System.out.println("intPredicate输出:"+intPredicate.test(6));
    }

    public static void consumer() {
        Consumer<String> consumer = s -> {
            if (s.equals("1")) {
                System.out.println("我消费了一个数据:" + s);
            }
        };
        consumer.accept("1");
    }

    public static void function() {
        Function<Integer, Integer> function = num -> num += 100;
        Integer apply = function.apply(3);
        System.out.println(apply);
    }

    public static void supplier() {
        Supplier<String> supplier = () -> "提供一个数据返回:" + 9;
        String s = supplier.get();
        System.out.println(s);
    }

    public static void unaryOperator() {
        UnaryOperator<String> unaryOperator = u -> u + "返回了：" + u;
        String apply = unaryOperator.apply("我输入啥类型给我返回啥类型");
        System.out.println(apply);
    }

    public static void biFunction() {
        BiFunction<String, Integer, Double> biFunction = (sss, iii) -> {
            if (sss.equals("20") && iii == 19) {
                return 3.1415926+3.1415927;
            }else{
                return 9.9999999;
            }
        };
        Double apply = biFunction.apply("21", 19);
        System.out.println(apply);
    }
    public static void binaryOperator(){
        BinaryOperator<String> binaryOperator = (b,a)->b+a;
        IntBinaryOperator intBinaryOperator = (a,o)-> (++a)+(++o);
        System.out.println("binaryOperator:"+binaryOperator.apply("我去年","没有买表！"));
        System.out.println("intBinaryOperator:"+intBinaryOperator.applyAsInt(1,1));
    }

}
