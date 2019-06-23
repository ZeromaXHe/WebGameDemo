<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/21
  Time: 20:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>注册页面</title>
    <jsp:include page="header.jsp" flush="true"/>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container theme-showcase" role="main">
    <br/>
    <br/>
    <br/>
    <h2>注册页面</h2>
    <!--注册错误提示消息-->
    <div id="errorMsg" style="background-color: crimson;color: white"
         class="alert alert-danger"><%=request.getAttribute("registerError") == null ? "" : request.getAttribute("registerError")%>
    </div>
    <%--<form id="registerForm" action="<%=request.getContextPath()%>/login" method="post" accept-charset="utf-8">--%>
    <form class="form-horizontal" id="registerForm" action="register" method="post" accept-charset="utf-8">
        <div class="form-group">
            <label for="inputUsername" class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-8">
                <input name="username" id="inputUsername" class="form-control" type="text" placeholder="请输入账号" autocomplete="off">
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword" class="col-sm-2 control-label">密码</label>
            <div class="col-sm-8">
                <input name="password" id="inputPassword" class="form-control" type="password" placeholder="请输入密码" autocomplete="off">
            </div>
        </div>
        <div class="form-group">
            <label for="inputVeriCode" class="col-sm-2 control-label">验证码</label>
            <div class="col-sm-6">
                <input name="check" id="inputVeriCode" class="form-control" type="text" placeholder="请输入验证码" autocomplete="off">
            </div>
            <div class="col-sm-2"><img src="twistedVeriCode" alt="" onclick="changeImage(this)"></div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-8">
                <button type="submit" class="btn btn-primary">注册</button>
            </div>
        </div>
    </form>
</div>
<script>
    function changeImage(obj) {
        //浏览器的缓存。src属性值变更前 == 变更后的值，浏览器认为我们请求的是同一图片，所以直接从缓存里取出显示了
        //让src属性值，变更前后是不同的
        //  路径地址?提交的表单参数，等价于form标签的get方式提交
        obj.src = "twistedVeriCode?a=" + Math.random();
    }
</script>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>
