package com.dimple.test.map;

public interface Map<K,V> {

    public V get(K k);
    public V put(K k,V v);
    public int size();

    interface Entry<K,V>{
        K getKey();
        V getValue();
        V setValue(V v);
    }

}
