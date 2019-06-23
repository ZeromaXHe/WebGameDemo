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
    <title>下载页面</title>
    <script>
        function isIE(){
            //获取当前浏览器相关信息
            var explorer = window.navigator.userAgent.toLowerCase() ;
            //判断是否是ie浏览器
            return (explorer.indexOf("msie") >= 0 || explorer.indexOf("rv:11.0) like gecko") >= 0);
        }
        window.onload = function () {
            if(isIE()){
                //在是IE浏览器的情况下，对中文请求参数编码
                var str = document.getElementById("ww").href;
                var str = encodeURI(str);
                document.getElementById("ww").href = str;
            }
        };
    </script>
</head>
<body>
<h2>下载页面</h2><br/>
<a href="index.jsp">返回首页</a><br/>
<h3>下载清单</h3>
<a id="ww" href="download?fileName=简介.txt">简介.txt</a>
</body>
</html>
