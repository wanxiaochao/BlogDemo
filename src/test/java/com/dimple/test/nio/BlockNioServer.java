package com.dimple.test.nio;

import net.sf.jsqlparser.schema.Server;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

public class BlockNioServer {

    public static void main(String[] args) throws IOException {

        //打开通道
        ServerSocketChannel serverSocketChannel = ServerSocketChannel.open();
        //获取文件通道
        FileChannel fileChannel = FileChannel.open(Paths.get("p2.png"), StandardOpenOption.WRITE, StandardOpenOption.CREATE);
        serverSocketChannel.bind(new InetSocketAddress(7777));
        // 4. 获取客户端的连接(阻塞的)
        SocketChannel accept = serverSocketChannel.accept();
        ByteBuffer buffer = ByteBuffer.allocate(1024);

        while (accept.read(buffer) != -1) {
            buffer.flip();
            fileChannel.write(buffer);
            buffer.clear();
        }
        //通知客户端收到文件
        buffer.put("img is success".getBytes());
        buffer.flip();
        accept.write(buffer);
        buffer.clear();

        fileChannel.close();
        accept.close();
        serverSocketChannel.close();

    }

}
