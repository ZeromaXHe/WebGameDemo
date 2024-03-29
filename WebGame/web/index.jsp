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

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery-1.11.3.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</head>
<body>

<jsp:include page="header.jsp" flush="true"></jsp:include>
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
        <div>
            <a role="button" class="btn btn-success" href="loginPage.jsp">我有账号，我要登录</a>
            <a role="button" class="btn btn-warning" href="registerPage.jsp">没有账号，开始注册</a>
        </div>
        <br/>
        <div>
            <a role="button" class="btn btn-primary" href="downloadPage.jsp">下载文件</a>
        </div>
        <br/>
        <div>
            <a role="button" class="btn btn-primary" href="game?action=queryAll">玩过的游戏列表</a>
        </div>
        <br/>
        <div>
            <a role="button" class="btn btn-primary" href="openBox.jsp">开个箱子（抽奖）</a>
        </div>
        <br/>
        <div>
            <a role="button" class="btn btn-primary" href="#" onclick="confirmLogin()">扫雷</a>
            <a role="button" class="btn btn-info" href="minecleanningHero.jsp" >扫雷英雄榜</a>
        </div>
    </div>
</div>
<script>
    function confirmLogin() {
        //获取用户登录数据异步请求
        var url = "user";//UserServlet
        var data = {action: "getLoginUserData"};
        var callback = function (resultInfo) {
            //判断返回数据有效性
            if (resultInfo.ok ) {
                    //发请求到扫雷界面
                    location.href = "/minecleanning.jsp";
            }
            else {
                var wantLogin = confirm("你还没有登录，是否登录？（此游戏仅限登录账号后进行游玩）");
                if (wantLogin) {
                    //发请求到Servlet，并且传参游戏的id
                    location.href = "/loginPage.jsp";
                }
            }
        }
        var type = "json";
        $.post(url, data, callback, type);
    }
</script>
</body>
</html>
