package com.itheima.mapper;

import com.itheima.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;

public interface UserMapper {

    List<User> selectAll();

    @Select("select * from tb_user where id  = #{id}")
    User selectById(int id);

    /*

      MyBatis 参数封装：
        * 单个参数：
            1. POJO类型：直接使用，属性名 和 参数占位符名称 一致
            2. Map集合：直接使用，键名 和 参数占位符名称 一致
            3. Collection：封装为Map集合，可以使用@Param注解，替换Map集合中默认的arg键名
                map.put("arg0",collection集合);
                map.put("collection",collection集合);
            4. List：封装为Map集合，可以使用@Param注解，替换Map集合中默认的arg键名
                map.put("arg0",list集合);
                map.put("collection",list集合);
                map.put("list",list集合);
            5. Array：封装为Map集合，可以使用@Param注解，替换Map集合中默认的arg键名
                map.put("arg0",数组);
                map.put("array",数组);
            6. 其他类型：直接使用
        * 多个参数：封装为Map集合,可以使用@Param注解，替换Map集合中默认的arg键名
            map.put("arg0",参数值1)
            map.put("param1",参数值1)
            map.put("param2",参数值2)
            map.put("agr1",参数值2)
            ---------------@Param("username")
            map.put("username",参数值1)
            map.put("param1",参数值1)
            map.put("param2",参数值2)
            map.put("agr1",参数值2)

     */
    User select(@Param("username") String username,String password);
    User select(Collection collection);













}
