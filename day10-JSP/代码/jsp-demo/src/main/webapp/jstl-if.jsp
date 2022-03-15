<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>

    <%--
        c:if：来完成逻辑判断，替换java  if else
    --%>
<%--

    <c:if test="true">
        <h1> true</h1>
    </c:if>

    <c:if test="false">
        <h1> false</h1>
    </c:if>
--%>
    <c:if test="${status ==1}">
        启用
    </c:if>

    <c:if test="${status ==0}">
        禁用
    </c:if>

</body>
</html>
