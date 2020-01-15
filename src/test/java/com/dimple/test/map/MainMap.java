package com.dimple.test.map;

public class MainMap {

    public static void main(String[] args) {
        HashMap<Object, Object> hashMap = new HashMap<>();

        hashMap.put("k","v");

        System.out.println(hashMap.size());

        System.out.println(hashMap.get("K"));

        MyHashMap<Object, Object> objectObjectMyHashMap = new MyHashMap<>();
        objectObjectMyHashMap.put("kk","vv");
        System.out.println(objectObjectMyHashMap.size());
        System.out.println(objectObjectMyHashMap.get("kk"));
    }
}
