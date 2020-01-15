package com.dimple.test.udp_test;

import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;

public class UDPReceive {

    private static final int LISTENING_PORT = 2000;
    private static final int BUFFER_SIZE = 512;

    public static void main(String[] args) {
        byte[] buffer = new byte[BUFFER_SIZE];
        DatagramPacket msg = new DatagramPacket(buffer, buffer.length);

        try (DatagramSocket datagramSocket = new DatagramSocket(LISTENING_PORT)) {

            System.out.println("接收端已启动...");
            while (true) {
                datagramSocket.receive(msg);
                String msgBody = new String(
                        msg.getData(), msg.getOffset(), msg.getLength());
                if (msgBody.isEmpty()) { // 发现接收的消息是空字符串("")便跳出循环
                    break;
                }

                int senderPort = msg.getPort();
                InetAddress senderAddr = msg.getAddress();

                System.out.printf("发送端 地址和端口 -> (%s:%d)\n",
                        senderAddr.getHostAddress(), senderPort);

                System.out.println("发送端 发送的消息 -> " + msgBody + "\n");

            }

            System.out.println("接收端已关闭...");

        } catch (Exception e) {
            e.printStackTrace();
        }


    }

}
