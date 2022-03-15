package com.itheima.web.request;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

public class URLDemo {

    public static void main(String[] args) throws UnsupportedEncodingException {
        String username = "张三";

        //1. URL编码
        String encode = URLEncoder.encode(username, "utf-8");
        System.out.println(encode);

        //2. URL解码
        //String decode = URLDecoder.decode(encode, "utf-8");
        String decode = URLDecoder.decode(encode, "ISO-8859-1");

        System.out.println(decode);

        //3. 转换为字节数据,编码
        byte[] bytes = decode.getBytes("ISO-8859-1");
      /*  for (byte b : bytes) {
            System.out.print(b + " ");
        }*/

        //4. 将字节数组转为字符串，解码
        String s = new String(bytes, "utf-8");

        System.out.println(s);


    }
}
