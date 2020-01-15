package com.dimple.test.udp_test;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class UDPSender {

    private static final int RECEIVE_LISTEN_PORT = 2000;

    public static void main(String[] args) throws IOException, InterruptedException {

        List<DatagramPacket> packetList = new ArrayList<>();

        for (int i = 0; i < 4; i++) {
            String msgBody = (i == 3 ? "" : "Hello UDP-" + i);
            DatagramPacket msg0 = parseMsg(
                    msgBody, "127.0.0.1", RECEIVE_LISTEN_PORT); // 发送给本机
            DatagramPacket msg1 = parseMsg(
                    msgBody, "192.168.6.177", RECEIVE_LISTEN_PORT); // 发送给同一局域网的一台机器
            DatagramPacket msg2 = parseMsg(
                    msgBody, "112.62.231.166", RECEIVE_LISTEN_PORT); // 120.77.**.*** 是我阿里云主机的公网 IP 地址
            Collections.addAll(packetList, msg0, msg1, msg2);
        }
        startSend(packetList);

    }

    private static void startSend(List<DatagramPacket> packets) throws IOException, InterruptedException {

        try (DatagramSocket socket = new DatagramSocket()) {
            System.out.println("随机给发送端分配的端口为：" + socket.getLocalPort() + "\n");

            for (DatagramPacket msg : packets) {
                socket.send(msg); // 发送数据包

                int recverPort = msg.getPort();
                InetAddress recverAddr = msg.getAddress();
                System.out.printf("消息已经发送 -> (%s:%d)\n",
                        recverAddr.getHostAddress(), recverPort);

                Thread.sleep(500); // 设定 每隔 0.5 秒发送一个消息
            }
        }
    }

    private static DatagramPacket parseMsg(String body, String addr, int port) throws UnknownHostException {
        byte[] bytes = body.getBytes();
        DatagramPacket datagramPacket = new DatagramPacket(bytes, 0, bytes.length, InetAddress.getByName(addr), port);
        return datagramPacket;
    }

}
