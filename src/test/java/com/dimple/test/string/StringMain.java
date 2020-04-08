package com.dimple.test.string;

import java.time.*;
import java.time.chrono.ChronoLocalDate;
import java.time.chrono.Chronology;
import java.time.temporal.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
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

    public static void main(String[] args) {

        Integer  score = 2000;
        score = score/1000;
        int points = 0;
        for (Integer i = 1; i <= score; i++) {
            points +=i;
        }

        System.out.println(points);

        long dayMilli = LocalDate.now().atStartOfDay().toInstant(ZoneOffset.ofHours(8)).toEpochMilli();


        Random random = new Random();
        for (int i = 0; i < 10; i++) {
            int i1 = random.nextInt(100-80+1)+80;
            int y = (int) (Math.random()*(100-80+1)+80);
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
