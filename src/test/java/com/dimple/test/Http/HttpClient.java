package com.dimple.test.Http;

import com.sun.net.ssl.SSLContext;
import com.sun.net.ssl.X509TrustManager;
import io.swagger.models.Scheme;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.conn.ssl.TrustStrategy;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicHeader;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import javax.net.ssl.TrustManager;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class HttpClient {


    public static String apacheSendGet(String url) {
        CloseableHttpClient closeableHttpClient = null;
        CloseableHttpResponse closeableHttpResponse = null;
        String result = "";
        try {
            try {
                HttpGet httpGet = new HttpGet(url);
                closeableHttpClient = HttpClients.createDefault();
                closeableHttpResponse = closeableHttpClient.execute(httpGet);
                HttpEntity entity = closeableHttpResponse.getEntity();
                result = EntityUtils.toString(entity);
            } finally {
                if (null != closeableHttpResponse) {
                    closeableHttpResponse.close();
                }
                if (null != closeableHttpClient) {
                    closeableHttpClient.close();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public static String apacheSendPost(String url, Map<Object, Object> param) {
        String result = "";
        CloseableHttpClient closeableHttpClient = null;
        CloseableHttpResponse closeableHttpResponse = null;
        try {
            try {
                closeableHttpClient = HttpClients.createDefault();
                HttpPost httpPost = new HttpPost(url);
                if (null != param && param.size() > 0) {
                    List<NameValuePair> params = new ArrayList<>();
                    param.forEach((k, v) -> {
                        params.add(new BasicNameValuePair(k.toString(), v.toString()));
                    });
                    httpPost.setEntity(new UrlEncodedFormEntity(params, "UTF-8"));
                }
                closeableHttpResponse = closeableHttpClient.execute(httpPost);
                HttpEntity entity = closeableHttpResponse.getEntity();
                result = EntityUtils.toString(entity);
            } finally {
                if (null != closeableHttpResponse) {
                    closeableHttpResponse.close();
                }
                if (null != closeableHttpClient) {
                    closeableHttpClient.close();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

}
