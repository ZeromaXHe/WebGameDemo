<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/23
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Fixed navbar -->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp">WebGameDemo by ZeromaX</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="index.jsp">首页</a></li>
            </ul>
            <!-- 未登录状态 -->
            <div class="logout">
                <ul class="logout nav navbar-nav navbar-right">
                    <li><a href="loginPage.jsp">登录</a></li>
                    <li><a href="registerPage.jsp">注册</a></li>
                </ul>
            </div>
            <!-- 登录状态 -->
            <div class="login" style="display: none;">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">[用户名]，欢迎您~ 您已登录<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">个人资料</a></li>
                            <li><a href="#">修改密码</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">关于</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="user?action=logout">退出登录</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<script>
    // $(function() {}) 是$(document).ready(function()的简写。DOM加载完毕之后执行
    $(function () {
        //获取用户登录数据异步请求
        var url = "user";//UserServlet
        var data = {action:"getLoginUserData"};
        var callback = function (resultInfo) {
            //判断返回数据有效性
            if (resultInfo.ok) {
                //拼接登录数据
                var html = "<ul class=\"nav navbar-nav navbar-right\">" +
                    "<li class=\"dropdown\">\n" +
                    "<a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\" aria-haspopup=\"true\" aria-expanded=\"false\">" + resultInfo.data.username + "，欢迎您~ 您已登录<span class=\"caret\"></span></a>\n" +
                    "<ul class=\"dropdown-menu\">\n" +
                    "<li><a href=\"#\">个人资料</a></li>\n" +
                    "<li><a href=\"#\">修改密码</a></li>\n" +
                    "<li role=\"separator\" class=\"divider\"></li>\n" +
                    "<li><a href=\"#\">关于</a></li>\n" +
                    "<li role=\"separator\" class=\"divider\"></li>\n" +
                    "<li><a href=\"user?action=logout\">退出登录</a></li>\n" +
                    "</ul>\n" +
                    "</li>";
                $(".login").html(html);
                //显示登录信息
                $(".login").show();
                //成功返回登录数据，隐藏非登录信息
                $(".logout").hide();
            }
        };
        var type = "json";
        $.post(url, data, callback, type);
    });
</script>
