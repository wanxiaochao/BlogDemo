package com.dimple.test.mapper;

import com.dimple.common.utils.FastdfsUtil;
import com.dimple.project.blog.blog.domain.Blog;
import com.dimple.project.blog.blog.mapper.BlogMapper;
import org.apache.http.entity.ContentType;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;

/**
 * @className: BlogMapperTest
 * @description: Blog的Mapper接口测试类
 * @auther: Dimple
 * @Date: 2019/3/24
 * @Version: 1.0
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class BlogMapperTest {
    @Autowired
    BlogMapper blogMapper;

    @Autowired
    private FastdfsUtil fastdfsUtil;

    @Test
    public void testInsertBlog() {

        Blog blog = new Blog();
        blog.setContent("this is a content");
        blog.setTitle("this is a title");
        blogMapper.insertBlog(blog);
    }

    @Test
    public void upload() throws Exception {
        File file = new File("G:\\各种文件\\timg (1).jpg");
        FileInputStream fileInputStream = new FileInputStream(file);
        MultipartFile multipartFile = new MockMultipartFile(file.getName(), file.getName(),
                ContentType.APPLICATION_OCTET_STREAM.toString(), fileInputStream);
        String upload = fastdfsUtil.upload(multipartFile);
        System.out.println(upload);
    }

    @Test
    public void delete() {
        fastdfsUtil.deleteFile("group1/M00/00/00/rBEyTV2wFDiAVzGMAAB1v-4JFg4070.jpg");
    }

    @Test
    public void download() throws Exception {
        byte[] bytes = fastdfsUtil.downloadFile("group1", "M00/00/00/rBEyTV2wGb6ADkPSAAB1v-4JFg4102.jpg");
        InputStream ins = new ByteArrayInputStream(bytes);
        OutputStream outputStream = new FileOutputStream("G:/各种文件/timg (10).jpg");

        byte[] bs = new byte[1024];
        int count = 0;

        while ((count = ins.read(bs, 0, bs.length)) != -1) {
            outputStream.write(bs, 0, count);
        }
        ins.close();
        outputStream.flush();
        outputStream.close();
    }

    @Test
    public void testUpdateBlogStatusByIds() {
        Integer ids[] = {31, 32, 33, 34};
        blogMapper.updateBlogStatusByIds(ids, "5");
    }

}
