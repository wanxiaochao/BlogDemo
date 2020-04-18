package com.dimple.test.nio;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.channels.SocketChannel;
import java.nio.file.Paths;

public class BlockNioClient {

    public static void main(String[] args) throws IOException {
        //获取通道
        SocketChannel socketChannel = SocketChannel.open(new InetSocketAddress("0.0.0.0", 7777));
        //发送图片到服务端
        FileChannel fileChannel = FileChannel.open(Paths.get("C:\\Users\\Administrator\\Desktop\\新建文件夹\\20170305144435291.png"));
        //nio通道有了还需要buffer
        ByteBuffer buffer = ByteBuffer.allocate(1024);
        //读取文件
        while (fileChannel.read(buffer) != -1) {
            //切换为读模式
            buffer.flip();
            socketChannel.write(buffer);
            //切换写模式
            buffer.clear();
        }
        //加这个原因是如果不加的话会造成阻塞，因为服务端不知道客户数是否发送完成
        socketChannel.shutdownOutput();

        //接受服务端返回信息
        int len;
        while ((len = socketChannel.read(buffer)) != -1) {
            buffer.flip();
            System.out.println(new String(buffer.array(), 0, len));
            buffer.clear();
        }

        fileChannel.close();
        socketChannel.close();
    }
}
