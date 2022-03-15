package com.itheima.web;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

/**
 * Servlet 生命周期方法
 */
@WebServlet(urlPatterns="/demo2",loadOnStartup = 1)
public class ServletDemo2 implements Servlet {

    /**
     * 初始化方法
     * 1. 调用时机：默认情况下，Servlet被第一次访问时，调用
     *      * loadOnStartup:
     * 2. 调用次数：1次
     * @param config
     * @throws ServletException
     */
    @Override
    public void init(ServletConfig config) throws ServletException {
        System.out.println("init...");
    }


    /**
     * 提供服务
     * 1. 调用时机：每一次Servlet被访问时，调用
     * 2. 调用次数：多次
     *
     *
     * @param req
     * @param res
     * @throws ServletException
     * @throws IOException
     */
    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        System.out.println("servlet hello world~");
    }


    /**
     * 销毁方法
     * 1. 调用时机：内存释放或者服务器关闭的时候，Servlet对象会被销毁，调用
     * 2. 调用次数：1次
     */
    @Override
    public void destroy() {
        System.out.println("destroy...");
    }

    @Override
    public String getServletInfo() {
        return null;
    }

    @Override
    public ServletConfig getServletConfig() {
        return null;
    }
}
