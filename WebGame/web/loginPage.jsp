<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/21
  Time: 20:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>登录界面</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery-1.11.3.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>

    <script language="javascript" type="text/javascript">
        function checkInCorrect()      //判断用户名和密码是否为空
        {
            if (document.getElementById('inputUsername').value == "") {
                alert('请输入用户名！');
                document.getElementById('inputUsername').focus();
                return false
            }
            if (document.getElementById('inputPassword').value == "") {
                alert('请输入密码！');
                document.getElementById('inputPassword').focus();
                return false
            }
            else {
                saveInfo();
                return true;
            }
        }

        saveInfo = function () {
            try {
                var isSave = document.getElementById('remember_password').checked;   //保存按键是否选中
                if (isSave) {
                    var username = document.getElementById('inputUsername').value;
                    var password = document.getElementById('inputPassword').value;
                    if (username != "" && password != "") {
                        SetCookie(username, password);
                    }
                } else {
                    SetCookie("", "");
                }
            } catch (e) {

            }
        }

        function SetCookie(username, password) {
            var Then = new Date();
            Then.setTime(Then.getTime() + 1866240000000);
            document.cookie = "username=" + username + "%%" + password + ";expires=" + Then.toGMTString();
        }

        function GetCookie() {
            var nmpsd;
            var nm;
            var psd;
            var cookieString = new String(document.cookie);
            var cookieHeader = "username=";
            var beginPosition = cookieString.indexOf(cookieHeader);
            cookieString = cookieString.substring(beginPosition);
            var ends = cookieString.indexOf(";");
            if (ends != -1) {
                cookieString = cookieString.substring(0, ends);
            }
            if (beginPosition > -1) {
                nmpsd = cookieString.substring(cookieHeader.length);
                if (nmpsd != "") {
                    beginPosition = nmpsd.indexOf("%%");
                    nm = nmpsd.substring(0, beginPosition);
                    psd = nmpsd.substring(beginPosition + 2);
                    document.getElementById('inputUsername').value = nm;
                    document.getElementById('inputPassword').value = psd;
                    if (nm != "" && psd != "") {
                        // document.forms[0].checkbox.checked = true;
                        document.getElementById('remember_password').checked = true;
                    }
                }
            }
        }
    </script>
</head>
<body onLoad="document.getElementById('inputUsername').focus();GetCookie();">
<jsp:include page="header.jsp" flush="true"/>
<div class="container theme-showcase" role="main">
    <br/>
    <br/>
    <br/>
    <h2>登录页面</h2>
    <!--登录错误提示消息-->
    <div id="errorMsg" style="background-color: crimson;color: white"
    class="alert alert-danger"><%=request.getAttribute("loginError") == null ? "" : request.getAttribute("loginError")%>
    </div>
    <%--<form id="loginForm" action="<%=request.getContextPath()%>/login" method="post" accept-charset="utf-8">--%>
    <form class="form-horizontal" id="loginForm" action="login" method="post" accept-charset="utf-8" onsubmit="return checkInCorrect()">
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
            <div class="col-sm-2"><img src="verificationCode" alt="" onclick="changeImage(this)"></div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-8">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" id="remember_password"> 记住我（自动登录）
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-8">
                <button type="submit" class="btn btn-primary">登录</button>
                <button type="button" class="btn btn-default" onclick="location.href='registerPage.jsp'">没有账号，我要注册</button>
            </div>
        </div>
    </form>
</div>
<script>
    function changeImage(obj) {
        //浏览器的缓存。src属性值变更前 == 变更后的值，浏览器认为我们请求的是同一图片，所以直接从缓存里取出显示了
        //让src属性值，变更前后是不同的
        //  路径地址?提交的表单参数，等价于form标签的get方式提交
        obj.src = "verificationCode?a=" + Math.random();
    }
</script>

</body>
</html>
