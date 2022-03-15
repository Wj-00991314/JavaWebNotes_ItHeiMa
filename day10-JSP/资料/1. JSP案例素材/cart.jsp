<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         import="util.DBUtil,java.sql.ResultSet"
%>

<%
    if (session.getAttribute("flag") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>汽车租赁管理系统</title>
    <link type="text/css" rel="stylesheet" href="css1/style.css"/>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/menu.js"></script>
</head>

<body>

<%
    //使   欢迎您！	之后的人名是动态的
    Object name = session.getAttribute("flag");

%>
<div class="top"></div>
<div id="header">
    <div class="logo">汽车租赁后台管理系统</div>
    <div class="navigation">
        <ul>
            <li>欢迎您！</li>
            <li><%=name %>
            </li>
            <li><a href="login.jsp">退出</a></li>
        </ul>
    </div>
</div>
<div id="content">
    <div class="left_menu">
        <ul id="nav_dot">
            <li>
                <h4 class="M1"><span></span>员工管理</h4>
                <div class="list-item none">
                    <a href='adminAdd.jsp'>添加员工</a>
                    <a href='adminSelect.jsp'>查看所有员工</a>
                    <a href="opRecord.jsp">系统操作记录</a>
                    <a href='loginRecord.jsp'>系统登录记录</a>
                </div>
            </li>
            <li>
                <h4 class="M2"><span></span>汽车品牌</h4>
                <div class="list-item none">
                    <a href='pinpaiAdd.jsp'>添加品牌</a>
                    <a href='pinpaiSelect.jsp'>查看所有品牌</a>
                </div>
            </li>
            <li>
                <h4 class="M3"><span></span>汽车型号</h4>
                <div class="list-item none">
                    <a href='xinghaoAdd.jsp'>添加型号</a>
                    <a href='xinghaoSelect.jsp'>查看所有型号</a>
                </div>
            </li>
            <li>
                <h4 class="M4"><span></span>汽车管理</h4>
                <div class="list-item none">
                    <a href='carAdd.jsp'>添加汽车</a>
                    <a href='carSelect.jsp'>查看所有汽车</a>
                    <a href='maintain.jsp'>汽车检修</a>
                </div>
            </li>
            <li>
                <h4 class="M5"><span></span>我的客户</h4>
                <div class="list-item none">
                    <a href='userAdd.jsp'>添加客户</a>
                    <a href='userSelect.jsp'>查看所有客户</a>
                </div>
            </li>
            <li>
                <h4 class="M6"><span></span>查看汽车</h4>
                <div class="list-item none">
                    <a href='seeCar.jsp'>查看需求车辆</a>
                </div>
            </li>
            <li>
                <h4 class="M7"><span></span>订单查询</h4>
                <div class="list-item none">
                    <a href='bookTable1.jsp'>预定订单</a>
                    <a href='rentTable1.jsp'>租赁订单</a>
                    <a href='buyTable1.jsp'>购买订单</a>
                </div>
            </li>
            <li>
                <h4 class="M10"><span></span>销售统计</h4>
                <div class="list-item none">
                    <a href='hotXinghao.jsp'>热门车型</a>
                    <a href='hotCar.jsp'>热门车辆</a>
                    <a href='hotPinpai.jsp'>热门品牌</a>
                    <a href='rentSaleroom.jsp'>租车销售额</a>
                    <a href='buySaleroom.jsp'>卖车销售额</a>
                </div>
            </li>
        </ul>
    </div>
    <div class="m-right">
        <div class="right-nav">
            <ul>
                <li><img src="images/home.png"></li>

            </ul>
        </div>
        <div class="main">
            <%
                DBUtil db = DBUtil.getDB();
                //当前第几页
                int nowP = 1;
                if (request.getParameter("nowPage") == null) {
                    nowP = 1;
                } else {
                    nowP = Integer.parseInt(request.getParameter("nowPage"));
                }


                //总记录数
                StringBuilder sbCount = new StringBuilder();
                sbCount.append("SELECT h.name,COUNT(*) AS num  FROM hotcar AS h,car AS c WHERE h.name=c.cName ");


                //实例化一个StringBuilder 对象
                StringBuilder sb = new StringBuilder();
                sb.append("SELECT h.name,COUNT(*) AS 搜索次数 FROM hotcar AS h,car AS c WHERE h.name=c.cName GROUP BY h.name ORDER BY 搜索次数 DESC ");


                String str = sbCount.toString();

                ResultSet rsCount = db.executeQuery(str);
                //总行数
                int totalRows = 0;
                while (rsCount.next()) {
                    totalRows = Integer.parseInt(rsCount.getString("num"));
                }

                //每页多少条
                int perPage = 5;
                //共有多少页
                int totalPages = 0;
                System.out.println("总记录数：" + totalRows);


                if (totalRows % perPage == 0 && totalRows != 0) {
                    totalPages = totalRows / perPage;
                } else {
                    totalPages = totalRows / perPage + 1;
                }


                //limit (nowP-1)*5,5
                sb.append("limit " + (nowP - 1) * +perPage + "," + perPage);

                String sql = sb.toString();
                System.out.println(sql);

                ResultSet rs = db.executeQuery(sql);

            %>

            <center>
                <form action="hotCar.jsp" method="post">
                    <table border="1">
                        <tr>
                            <th>名次</th>
                            <th>汽车名称</th>
                            <th>搜索次数</th>
                        </tr>
                        <%
                            int count = 0;
                            while (rs.next()) {
                                count++;
                        %>
                        <tr>
                            <td>第<%=count %>名</td>
                            <td><%=rs.getString("name")%>
                            </td>
                            <td><%=rs.getString("搜索次数")%>
                            </td>
                        </tr>
                        <%}%>

                    </table>
                </form>
                <table width="500" border="0">
                    <%
                        if (nowP == 1) {%>
                    <tr> <!-- 超链接后面可以添加参数，格	式：文件名？参数名=参数值&参数名=参数值。。。。。。。。 -->
                        <td><a href="hotCar.jsp?nowPage=1">首页</a></td>
                        <td><a href="">上一页</a></td>
                        <td><a href="hotCar.jsp?nowPage=<%=nowP+1%>">下一页</a></td>
                        <td><a href="hotCar.jsp?nowPage=<%=totalPages%>">尾页</a></td>
                        <td>当前第<%=nowP%>页</td>
                        <td>共<%=totalPages%>页</td>
                    </tr>
                    <%} else if (nowP == totalPages) {%>
                    <tr> <!-- 超链接后面可以添加参数，格式：文件名？参数名=参数值&参数名=参数值。。。。。。。。 -->
                        <td><a href="hotCar.jsp?nowPage=1">首页</a></td>
                        <td><a href="hotCar.jsp?nowPage=<%=nowP-1%>">上一页</a></td>
                        <td><a href="">下一页</a></td>
                        <td><a href="hotCar.jsp?nowPage=<%=totalPages%>">尾页</a></td>
                        <td>当前第<%=nowP%>页</td>
                        <td>共<%=totalPages%>页</td>
                    </tr>

                    <% } else {%>
                    <tr> <!-- 超链接后面可以添加参数，格式：文件名？参数名=参数值&参数名=参数值。。。。。。。。 -->
                        <td><a href="hotCar.jsp?nowPage=1">首页</a></td>
                        <td><a href="hotCar.jsp?nowPage=<%=nowP-1%>">上一页</a></td>
                        <td><a href="hotCar.jsp?nowPage=<%=nowP+1%>">下一页</a></td>
                        <td><a href="hotCar.jsp?nowPage=<%=totalPages%>">尾页</a></td>
                        <td>当前第<%=nowP%>页</td>
                        <td>共<%=totalPages%>页</td>
                    </tr>

                    <%
                        }

                    %>


                </table>
            </center>
        </div>
    </div>
</div>
<div class="bottom"></div>
<div id="footer"><p>Copyright© 2015 版权所有 京ICP备05019125号-10</p></div>
<script>navList(12);</script>
</body>
</html>

