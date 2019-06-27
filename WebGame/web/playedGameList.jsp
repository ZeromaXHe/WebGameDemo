<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/25
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>游戏列表</title>
    <jsp:include page="header.jsp" flush="true"/>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-1.11.3.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
    <style type="text/css">
        td, th {
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <br/>
    <br/>
    <br/>
    <h3 style="text-align: center">游戏列表</h3>
    <table border="1" class="table table-bordered table-hover">
        <tr class="success">
            <th>序号</th>
            <th>游戏中文名</th>
            <th>英文名</th>
            <th>开发商</th>
            <th>发行商</th>
            <th>发布日期</th>
            <th>游戏类型</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${gameList}" var="game" varStatus="vs">
            <tr>
                <td>${vs.count}</td>
                <td>${game.gameCHname}</td>
                <td>${game.gameENname}</td>
                <td>${game.gamedeveloper}</td>
                <td>${game.gamepublisher}</td>
                <td>${game.gamereleasedate}</td>
                <td>${game.gamegenre}</td>
                <td>
                    <a class="btn btn-default btn-sm" href="editGamePage?id=${game.id}">修改</a>&nbsp;
                        <%--  a标签的href值设置为：javascript:void(0)表示禁用超链接的跳转--%>
                    <a class="btn btn-danger btn-sm" href="javascript:void(0)" onclick="confirmDelete(${game.id})">删除</a>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="8" align="center"><a class="btn btn-primary" href="addGamePage.jsp">添加游戏</a></td>
        </tr>
    </table>
</div>
<script>
    function confirmDelete(id) {
        var isYes = confirm("确定要删除吗？");
        if (isYes) {
            //发请求到Servlet，并且传参用户的id
            location.href = "deleteGame?id=" + id;
        }
    }
</script>
</body>
</html>
