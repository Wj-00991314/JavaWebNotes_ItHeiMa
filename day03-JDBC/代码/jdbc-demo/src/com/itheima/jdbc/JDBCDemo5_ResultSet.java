package com.itheima.jdbc;

import com.itheima.pojo.Account;
import org.junit.Test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * JDBC API 详解：ResultSet
 */
public class JDBCDemo5_ResultSet {

    /**
     * 执行DQL
     * @throws Exception
     */
    @Test
    public void testResultSet() throws  Exception {
       //1. 注册驱动
       //Class.forName("com.mysql.jdbc.Driver");
       //2. 获取连接：如果连接的是本机mysql并且端口是默认的 3306 可以简化书写
       String url = "jdbc:mysql:///db1?useSSL=false";
       String username = "root";
       String password = "1234";
       Connection conn = DriverManager.getConnection(url, username, password);

       //3. 定义sql
        String sql = "select * from account";

        //4. 获取statement对象
        Statement stmt = conn.createStatement();

        //5. 执行sql
        ResultSet rs = stmt.executeQuery(sql);

        //6. 处理结果， 遍历rs中的所有数据
       /* // 6.1 光标向下移动一行，并且判断当前行是否有数据
        while (rs.next()){
            //6.2 获取数据  getXxx()
            int id = rs.getInt(1);
            String name = rs.getString(2);
            double money = rs.getDouble(3);

            System.out.println(id);
            System.out.println(name);
            System.out.println(money);

            System.out.println("--------------");

        }*/

        // 6.1 光标向下移动一行，并且判断当前行是否有数据
        while (rs.next()){
            //6.2 获取数据  getXxx()
            int id = rs.getInt("id");
            String name = rs.getString("name");
            double money = rs.getDouble("money");

            System.out.println(id);
            System.out.println(name);
            System.out.println(money);

            System.out.println("--------------");

        }


        //7. 释放资源
        rs.close();
        stmt.close();
        conn.close();
    }




    /**
     * 查询account账户表数据，封装为Account对象中，并且存储到ArrayList集合中
     * 1. 定义实体类Account
     * 2. 查询数据，封装到Account对象中
     * 3. 将Account对象存入ArrayList集合中
     *
     *
     * @throws Exception
     */
    @Test
    public void testResultSet2() throws  Exception {
        //1. 注册驱动
        //Class.forName("com.mysql.jdbc.Driver");
        //2. 获取连接：如果连接的是本机mysql并且端口是默认的 3306 可以简化书写
        String url = "jdbc:mysql:///db1?useSSL=false";
        String username = "root";
        String password = "1234";
        Connection conn = DriverManager.getConnection(url, username, password);

        //3. 定义sql
        String sql = "select * from account";

        //4. 获取statement对象
        Statement stmt = conn.createStatement();

        //5. 执行sql
        ResultSet rs = stmt.executeQuery(sql);

        // 创建集合
        List<Account> list = new ArrayList<>();

        // 6.1 光标向下移动一行，并且判断当前行是否有数据
        while (rs.next()){
            Account account = new Account();

            //6.2 获取数据  getXxx()
            int id = rs.getInt("id");
            String name = rs.getString("name");
            double money = rs.getDouble("money");

            //赋值
            account.setId(id);
            account.setName(name);
            account.setMoney(money);

            // 存入集合
            list.add(account);
        }

        System.out.println(list);

        //7. 释放资源
        rs.close();
        stmt.close();
        conn.close();
    }


}
