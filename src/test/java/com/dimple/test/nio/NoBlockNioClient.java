package com.dimple.test.nio;

import io.netty.buffer.ByteBuf;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.nio.channels.SocketChannel;
import java.nio.file.Paths;
import java.util.Iterator;

public class NoBlockNioClient {

    public static void main(String[] args) throws IOException {

        SocketChannel open = SocketChannel.open(new InetSocketAddress("127.0.0.1", 7897));
        //切换为非阻塞模式
        open.configureBlocking(false);
        //获取选择器
        Selector selector = Selector.open();
        //将通道注册到选择器
        open.register(selector, SelectionKey.OP_READ);
        FileChannel fileChannel = FileChannel.open(Paths.get("C:\\Users\\Administrator\\Desktop\\新建文件夹\\20170305144435291.png"));
        ByteBuffer buffer = ByteBuffer.allocate(1024);

        while (fileChannel.read(buffer) != -1) {
            buffer.flip();
            open.write(buffer);
            buffer.clear();
        }
        //轮训已经就绪的选择器
        while (selector.select() > 0) {
            Iterator<SelectionKey> iterator = selector.selectedKeys().iterator();
            while (iterator.hasNext()) {
                SelectionKey selectionKey = iterator.next();
                SocketChannel channel = (SocketChannel) selectionKey.channel();
                ByteBuffer byteBuffer = ByteBuffer.allocate(1024);
                int read = channel.read(byteBuffer);
                if (read > 0) {
                    buffer.flip();
                    System.out.println(new String(byteBuffer.array(), 0, read));
                }
                iterator.remove();
            }

        }

    }

}
