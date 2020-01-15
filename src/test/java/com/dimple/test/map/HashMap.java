package com.dimple.test.map;

public class HashMap<K, V> implements Map<K, V> {

    Node<K, V>[] array = null;
    // 数组/哈希桶的长度,就是数组初始化的长度
    private static int defaultLength = 16;
    /**
     * 加载因子/扩容因子,就是给数组界定一个存储阈值,
     * 当数组沾满整个数组的75%的时候,触发扩容操作)
     **/
    private static double factor = 0.75D;
    // hashMap中的元素个数
    private int size;


    @Override
    public V get(K k) {

        if (array != null) {
            int position = position(k, defaultLength);
            Node<K, V> node = array[position];
            while (node != null) {
                if (node.getKey() == k) {
                    return node.getValue();
                } else {
                    node = node.next;
                }
            }
        }
        return null;
    }

    @Override
    public V put(K k, V v) {
        if (array == null) {
            array = new Node[defaultLength];
        }
        int position = position(k, defaultLength);
        if (size > defaultLength * factor) {
            resize();
        }
        Node<K, V> node = array[position];
        if (node == null) {
            array[position] = new Node<>(k, v, null);
            size++;
        } else {
            if (k.equals(node.getKey()) || k == node.getKey()) {
                return node.setValue(v);
            } else {
                array[position] = new Node<>(k, v, null);
                size++;
            }
        }
        return null;
    }

    @Override
    public int size() {
        return size;
    }

    private void resize() {
        Node<K, V>[] nodes = new Node[defaultLength << 1];
        Node<K, V> node = null;
        for (int i = 0; i < array.length; i++) {
            node = array[i];
            while (node != null) {
                int position = position(node.getKey(), nodes.length);
                Node<K, V> next = node.next;
                node.next = nodes[position];
                nodes[position] = node;
                node = next;
            }
        }
        array = nodes;
        defaultLength = nodes.length;
        nodes = null;
    }

    // 计算位置
    private int position(K k, int length) {
        int code = k.hashCode();

        // 取模算法
        return code % (length - 1);

        // 求与算法
        // return code & (defaultLength-1);
    }

    static class Node<K, V> implements Entry<K, V> {

        private K key;
        private V value;
        private Node<K, V> next;

        public Node(K key, V value, Node<K, V> node) {
            this.key = key;
            this.value = value;
            this.next = node;
        }

        @Override
        public K getKey() {
            return this.key;
        }

        @Override
        public V getValue() {
            return this.value;
        }

        @Override
        public V setValue(V v) {
            V oldValue = this.value;
            this.value = v;
            return oldValue;
        }
    }

}
