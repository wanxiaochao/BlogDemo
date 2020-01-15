package com.dimple.common.utils;

import com.github.tobato.fastdfs.domain.fdfs.StorePath;
import com.github.tobato.fastdfs.domain.fdfs.ThumbImageConfig;
import com.github.tobato.fastdfs.domain.proto.storage.DownloadByteArray;
import com.github.tobato.fastdfs.exception.FdfsUnsupportStorePathException;
import com.github.tobato.fastdfs.service.FastFileStorageClient;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FastdfsUtil {

    @Autowired
    private FastFileStorageClient storageClient;
    @Autowired
    private ThumbImageConfig thumbImageConfig;

    /**
     * 上传文件
     * @param file
     * @return
     * @throws Exception
     */
    public String upload(MultipartFile file) throws Exception {
        //文件名
        String fileName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
        // 文件扩展名
        String ext = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());
        StorePath storePath = this.storageClient.uploadImageAndCrtThumbImage(file.getInputStream(), file.getSize(), fileName, null);
        String path = storePath.getFullPath();
        return path;
    }

    /**
     * 下载文件
     * @param groupName 组名
     * @param path 文件路径
     * @return
     */
    public byte[] downloadFile(String groupName,String path) {
        try {
            byte[] bytes = storageClient.downloadFile(groupName, path, new DownloadByteArray());
            return bytes;
        } catch (FdfsUnsupportStorePathException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    /**
     * 删除文件
     * @param fileUrl 文件访问地址
     */
    public void deleteFile(String fileUrl) {
        if (StringUtils.isEmpty(fileUrl)) {
            return;
        }
        try {
            StorePath storePath = StorePath.parseFromUrl(fileUrl);
            storageClient.deleteFile(storePath.getGroup(), storePath.getPath());
        } catch (FdfsUnsupportStorePathException e) {
            System.out.println(e.getMessage());
        }
    }
}

