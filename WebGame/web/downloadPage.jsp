<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/21
  Time: 21:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>下载页面</title>
    <jsp:include page="header.jsp" flush="true"/>
    <script>
        function isIE() {
            //获取当前浏览器相关信息
            var explorer = window.navigator.userAgent.toLowerCase();
            //判断是否是ie浏览器
            return (explorer.indexOf("msie") >= 0 || explorer.indexOf("rv:11.0) like gecko") >= 0);
        }

        window.onload = function () {
            if (isIE()) {
                //在是IE浏览器的情况下，对中文请求参数编码
                var str = document.getElementById("ww").href;
                var str = encodeURI(str);
                document.getElementById("ww").href = str;
            }
        };
    </script>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<br/>
<br/>
<br/>
<h2>下载页面</h2><br/>
<a href="index.jsp">返回首页</a><br/>
<h3>下载清单</h3>
<a id="ww" href="download?fileName=简介.txt">简介.txt</a>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-1.11.3.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>
