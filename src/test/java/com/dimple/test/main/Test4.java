package com.dimple.test.main;

import cn.zhouyafeng.itchat4j.api.AssistTools;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.time.*;
import java.time.temporal.TemporalAdjusters;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;


public class Test4 {

    private static List<String> getLikeUid() {
        List<String> uids = new ArrayList<>();
        for (int i = 0; i < 80; i++) {
            uids.add(i + "");
        }
        List<String> likeUid = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            int index = (int) (Math.random() * uids.size());
            likeUid.add(uids.get(index));
        }
        return likeUid;
    }
    public static void main(String[] args) {

        LinkedHashMap linkedHashMap = new LinkedHashMap(20,0.75f,true);
        linkedHashMap.put("k1","v1");
        linkedHashMap.put("k2","v2");
        linkedHashMap.put("k3","v3");
        Object k3 = linkedHashMap.get("k3");
        Object k2 = linkedHashMap.get("k2");
        Object k1 = linkedHashMap.get("k1");
        linkedHashMap.forEach((k,v)->{
            System.out.println(k);
        });

        Map<String,Object> map = new ConcurrentHashMap<>(1);
        for (int i = 0; i < 50; i++) {
            map.put(i+"",i);
        }

        Object o = map.get("8");

        /*List<String> list = new ArrayList<>();
        for (int i = 0; i < 80; i++) {
            list.add(i+"");
        }
        List<List<String>> lists = averageAssign(list, 4);
        for (List<String> strings : lists) {
            List<List<String>> listList = averageAssign(strings, 2);
            System.out.println(listList);
        }
        System.out.println(lists);*/
   /*     LocalDateTime localDateTime = LocalDateTime.now().with(TemporalAdjusters.previous(DayOfWeek.SUNDAY)).plusDays(1);
        Instant instant = Instant.ofEpochMilli(1575453414000L);
        LocalDateTime localDateTime1 = LocalDateTime.ofInstant(instant, ZoneId.systemDefault());
        LocalDateTime localDateTime2 = localDateTime1.with(TemporalAdjusters.previous(DayOfWeek.SUNDAY)).plusDays(1);

        LocalDate today = LocalDate.now();
        LocalDate toweekMonday = today.with(DayOfWeek.MONDAY);
        LocalDate with = today.with(DayOfWeek.SUNDAY);
        System.out.println(111);

        LocalDateTime with1 = LocalDateTime.now().with(TemporalAdjusters.previous(DayOfWeek.MONDAY));
        long l = LocalDate.now().with(DayOfWeek.MONDAY).minusWeeks(1).atStartOfDay(ZoneId.systemDefault()).toInstant().toEpochMilli();
        DecimalFormat df=(DecimalFormat) NumberFormat.getInstance();
        df.setMaximumFractionDigits(8);

        String format = df.format(1.4564564546);
        System.out.println(l);*/
    }
    public static <T> List<List<T>> averageAssign(List<T> list, int n){
        List<List<T>> result=new ArrayList<List<T>>();
        int remaider=list.size()%n;  //(先计算出余数)
        int number=list.size()/n;  //然后是商
        int offset=0;//偏移量
        for(int i=0;i<n;i++){
            List<T> value=null;
            if(remaider>0){
                value=list.subList(i*number+offset, (i+1)*number+offset+1);
                remaider--;
                offset++;
            }else{
                value=list.subList(i*number+offset, (i+1)*number+offset);
            }
            result.add(value);
        }
        return result;
    }


}

