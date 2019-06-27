<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/21
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>首页</title>
    <jsp:include page="header.jsp" flush="true"/>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container theme-showcase" role="main">
    <br/>
    <br/>
    <br/>
    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
        <h1>WebGameDemo</h1>
        <h2>by ZeromaX</h2>
        <p>这是一个Demo，用来练习javaWeb的各种技术，试着去做一个网页游戏</p>
    </div>

    <div class="container theme-showcase" role="main">
        <a role="button" class="btn btn-success" href="loginPage.jsp">我有账号，我要登录</a>
        <a role="button" class="btn btn-warning" href="registerPage.jsp">没有账号，开始注册</a>
        <br/>
        <a role="button" class="btn btn-primary" href="downloadPage.jsp">下载文件</a>
        <br/>
        <a role="button" class="btn btn-primary" href="gameQueryAll">玩过的游戏列表</a>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery-1.11.3.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
    </div>
</div>
</body>
</html>
