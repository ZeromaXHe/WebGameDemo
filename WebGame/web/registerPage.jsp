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
    <title>注册页面</title>
</head>
<body>
    <!--注册错误提示消息-->
    <div id="errorMsg" style="background-color: crimson;color: white" class="alert alert-danger" ><%=request.getAttribute("registerError")==null?"":request.getAttribute("registerError")%></div>
    <%--<form id="registerForm" action="<%=request.getContextPath()%>/login" method="post" accept-charset="utf-8">--%>
    <form id="registerForm" action="register" method="post" accept-charset="utf-8">
        用户名：<input name="username" type="text" placeholder="请输入账号" autocomplete="off"><br/>
        密码：<input name="password" type="password" placeholder="请输入密码" autocomplete="off">
        <div class="verify">
            验证码：<input name="check" type="text" placeholder="请输入验证码" autocomplete="off">
            <span><img src="verificationCode" alt="" onclick="changeImage(this)"></span>
        </div>
        <input type='submit'  value='注册'/>
    </form>
    <script>
        function changeImage(obj) {
            //浏览器的缓存。src属性值变更前 == 变更后的值，浏览器认为我们请求的是同一图片，所以直接从缓存里取出显示了
            //让src属性值，变更前后是不同的
            //  路径地址?提交的表单参数，等价于form标签的get方式提交
            obj.src = "verificationCode?a="+Math.random();
        }
    </script>
</body>
</html>
