package com.dimple.test.nio;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.*;
import java.nio.file.OpenOption;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.Iterator;

public class NoBlockNioServer {

    public static void main(String[] args) throws IOException {

        ServerSocketChannel serverSocketChannel = ServerSocketChannel.open();
        serverSocketChannel.configureBlocking(false);
        serverSocketChannel.bind(new InetSocketAddress(7897));
        Selector selector = Selector.open();

        serverSocketChannel.register(selector, SelectionKey.OP_ACCEPT);

        while (selector.select() > 0) {
            Iterator<SelectionKey> iterator = selector.selectedKeys().iterator();
            while (iterator.hasNext()) {
                SelectionKey selectionKey = iterator.next();
                if (selectionKey.isAcceptable()) {
                    SocketChannel clientChannel = serverSocketChannel.accept();
                    clientChannel.configureBlocking(false);
                    clientChannel.register(selector, SelectionKey.OP_READ);
                } else if (selectionKey.isReadable()) {
                    SocketChannel socketChannel = (SocketChannel) selectionKey.channel();
                    ByteBuffer allocate = ByteBuffer.allocate(1024);
                    FileChannel fileChannel = FileChannel.open(Paths.get("3.png"), StandardOpenOption.WRITE, StandardOpenOption.CREATE);
                    while (socketChannel.read(allocate) > 0) {
                        allocate.flip();
                        fileChannel.write(allocate);
                        allocate.clear();
                    }
                    ByteBuffer byteBuffer = ByteBuffer.allocate(1024);
                    byteBuffer.put("img is async success".getBytes());
                    byteBuffer.flip();
                    socketChannel.write(byteBuffer);
                    byteBuffer.clear();
                }
                iterator.remove();
            }
        }

    }

}
