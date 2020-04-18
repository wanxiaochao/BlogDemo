package com.dimple.test.string;

import java.time.*;
import java.time.chrono.ChronoLocalDate;
import java.time.chrono.Chronology;
import java.time.temporal.*;
import java.util.*;
import java.util.regex.Pattern;

public class StringMain {

    private static void sort(int[] arr) {
        int temp;
        for (int i = 0; i < arr.length; i++) {
            for (int j = 0; j < arr.length - 1 - i; j++) {
                if (arr[j + 1] < arr[j]) {
                    temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                }
            }
        }
    }

    private static void sort2(int[] arr) {
        for (int i = 0; i < arr.length; i++) {
            int minI = i;
            for (int j = i; j < arr.length; j++) {
                if (arr[minI] > arr[j]) {
                    minI = j;
                }
            }
            int temp = arr[i];
            arr[i] = arr[minI];
            arr[minI] = temp;
        }
    }

    private static String getStartAndEndTime() {
        //3-5；夏季：6-8；秋季：9-11；冬季：12-2。
        LocalDateTime now = LocalDateTime.now();
        int month = now.getMonthValue();
        if (month >= 3 && month <= 5) {
            LocalDate of = LocalDate.of(now.getYear(), 3, 1).with(TemporalAdjusters.firstDayOfMonth());
            LocalDate of1 = LocalDate.of(now.getYear(), 5, 2).with(TemporalAdjusters.lastDayOfMonth()).plusDays(1);

        }
        return "";
    }

    //二分查找递归实现
    private static int rank(int key,int[]arr){
        return rank(key,arr,0, arr.length-1);
    }

    public static int rank(int key ,int[]arr,int to,int lo){
        if(to>lo){
            return -1;
        }
        int mid = lo+(to-lo)/2;
        if(key<arr[mid]){
            return rank(key,arr,to,mid-1);
        }else if(key>arr[mid]){
            return rank(key,arr,mid+1,lo);
        }else {
            return mid;
        }
    }

    public static void main(String[] args) {

        int rank = rank(9, new int[]{1, 2, 3});
        System.out.println(rank);


        Set<String> s1 = new HashSet<>(Arrays.asList("1", "a", "c", "4", "c"));
        Set<String> s2 = new HashSet<>(Arrays.asList("1", "a", "c"));

        boolean b = s1.containsAll(s2);
        boolean b1 = s2.containsAll(s1);


        String startAndEndTime = getStartAndEndTime();
        LocalDateTime now = LocalDateTime.now();
        LocalDate with = LocalDate.of(now.getYear(), 12, 1).with(TemporalAdjusters.firstDayOfMonth());
        long start = with.atStartOfDay().toInstant(ZoneOffset.ofHours(8)).toEpochMilli();
        long end = with.plusMonths(2).with(TemporalAdjusters.lastDayOfMonth()).plusDays(1).atStartOfDay().toInstant(ZoneOffset.ofHours(8)).toEpochMilli();

        System.out.println(start);
        System.out.println(end);
        Integer score = 2000;
        score = score / 1000;
        int points = 0;
        for (Integer i = 1; i <= score; i++) {
            points += i;
        }

        //System.out.println(points);

        long dayMilli = LocalDate.now().atStartOfDay().toInstant(ZoneOffset.ofHours(8)).toEpochMilli();


        Random random = new Random();
        for (int i = 0; i < 10; i++) {
            int i1 = random.nextInt(100 - 80 + 1) + 80;
            int y = (int) (Math.random() * (100 - 80 + 1) + 80);
            //System.out.println(i1);
        }

        int[] arr = {5, 6, 18, 9, 1, 6};
        sort2(arr);


        /*LocalDateTime now = LocalDateTime.now();
        LocalDateTime localDateTime = now.minusYears(1L);
        long l = localDateTime.toLocalDate().with(TemporalAdjusters.firstDayOfMonth()).atStartOfDay().toInstant(ZoneOffset.ofHours(8)).toEpochMilli();
        long l1 = localDateTime.toLocalDate().with(TemporalAdjusters.lastDayOfMonth()).atStartOfDay().toInstant(ZoneOffset.ofHours(8)).toEpochMilli();
        System.out.println(l1);
        System.out.println(l);
        System.out.println(localDateTime.with(TemporalAdjusters.firstDayOfMonth()));
        long between1 = ChronoUnit.MONTHS.between(localDateTime, now);
        System.out.println(between1);*/
       /* int i = (int)(char)(byte)-1;
        byte s = (byte)-1;
        char a = (char) s;
        int y = (int)a;
        System.out.println(i);
        System.out.println(s);
        System.out.println(a);
        System.out.println(y);

        System.out.println(10%7);
        System.out.println(3%7);
        List<Integer>list=null;
        List<Integer> l = new ArrayList<>();*/
    }

    public static String getStartOrEndDayOfQuarter(LocalDate today, Boolean isFirst) {
        LocalDate resDate = LocalDate.now();
        if (today == null) {
            today = resDate;
        }
        Month month = today.getMonth();
        Month firstMonthOfQuarter = month.firstMonthOfQuarter();
        Month endMonthOfQuarter = Month.of(firstMonthOfQuarter.getValue() + 2);
        if (isFirst) {
            resDate = LocalDate.of(today.getYear(), firstMonthOfQuarter, 1).plusMonths(2);
        } else {
            resDate = LocalDate.of(today.getYear(), endMonthOfQuarter, endMonthOfQuarter.length(today.isLeapYear())).plusMonths(2);
        }
        return resDate.toString();
    }
}
