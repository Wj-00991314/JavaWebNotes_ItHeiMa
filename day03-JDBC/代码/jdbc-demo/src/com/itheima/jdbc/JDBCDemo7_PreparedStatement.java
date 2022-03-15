package com.itheima.jdbc;

import org.junit.Test;

import java.sql.*;
import java.util.Date;

/**
 * API详解：PreparedStatement
 */
public class JDBCDemo7_PreparedStatement {

    @Test
    public void testPreparedStatement() throws  Exception {
       //2. 获取连接：如果连接的是本机mysql并且端口是默认的 3306 可以简化书写
       String url = "jdbc:mysql:///db1?useSSL=false";
       String username = "root";
       String password = "1234";
       Connection conn = DriverManager.getConnection(url, username, password);

       // 接收用户输入 用户名和密码
        String name = "zhangsan";
        String pwd = "' or '1' = '1";

        // 定义sql
        String sql = "select * from tb_user where username = ? and password = ?";

        // 获取pstmt对象
        PreparedStatement pstmt = conn.prepareStatement(sql);

        // 设置？的值
        pstmt.setString(1,name);
        pstmt.setString(2,pwd);

        // 执行sql
        ResultSet rs = pstmt.executeQuery();

        // 判断登录是否成功
        if(rs.next()){
            System.out.println("登录成功~");
        }else{
            System.out.println("登录失败~");
        }

        //7. 释放资源
        rs.close();
        pstmt.close();
        conn.close();
    }


    /**
     * PreparedStatement原理
     * @throws Exception
     */
    @Test
    public void testPreparedStatement2() throws  Exception {

      

        //2. 获取连接：如果连接的是本机mysql并且端口是默认的 3306 可以简化书写
        // useServerPrepStmts=true 参数开启预编译功能
        String url = "jdbc:mysql:///db1?useSSL=false&useServerPrepStmts=true";
        String username = "root";
        String password = "1234";
        Connection conn = DriverManager.getConnection(url, username, password);

        // 接收用户输入 用户名和密码
        String name = "zhangsan";
        String pwd = "' or '1' = '1";

        // 定义sql
        String sql = "select * from tb_user where username = ? and password = ?";

        // 获取pstmt对象
        PreparedStatement pstmt = conn.prepareStatement(sql);


        Thread.sleep(10000);
        // 设置？的值
        pstmt.setString(1,name);
        pstmt.setString(2,pwd);
        ResultSet rs = null;
                // 执行sql
        rs = pstmt.executeQuery();


        // 设置？的值
        pstmt.setString(1,"aaa");
        pstmt.setString(2,"bbb");

        // 执行sql
        rs = pstmt.executeQuery();


        // 判断登录是否成功
        if(rs.next()){
            System.out.println("登录成功~");
        }else{
            System.out.println("登录失败~");
        }

        //7. 释放资源
        rs.close();
        pstmt.close();
        conn.close();
    }




}
