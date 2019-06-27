<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/25
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- HTML5文档-->
<!DOCTYPE html>
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
    <title>添加游戏</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-1.11.3.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp" flush="true"/>
<div class="container">
    <br/>
    <br/>
    <br/>
    <center><h3>添加游戏页面</h3></center>
    <form action="addGame" method="post">
        <div class="form-group">
            <label for="CHname">中文名：</label>
            <input type="text" class="form-control" id="CHname" name="gameCHname" placeholder="请输入游戏中文名">
        </div>

        <div class="form-group">
            <label for="ENname">英文名：</label>
            <input type="text" class="form-control" id="ENname" name="gameENname" placeholder="请输入游戏英文名">
        </div>

        <div class="form-group">
            <label for="developer">开发商：</label>
            <input type="text" class="form-control" id="developer" name="gamedeveloper" placeholder="请输入游戏开发商名字">
        </div>

        <div class="form-group">
            <label for="publisher">发行商：</label>
            <input type="text" class="form-control" id="publisher" name="gamepublisher" placeholder="请输入游戏发行商名字">
        </div>

        <div class="form-group">
            <label for="releasedate">发布时间：</label>
            <input type="text" class="form-control" id="releasedate" name="gamereleasedate" placeholder="请输入游戏发布日期：如2000-01-01">
        </div>

        <div class="form-group">
            <label for="genre">游戏类型：</label>
            <input type="text" class="form-control" id="genre" name="gamegenre" placeholder="请输入游戏类型：如FPS,RPG">
        </div>

        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="提交" />
            <input class="btn btn-default" type="reset" value="重置" />
            <input class="btn btn-default" type="button" onclick="history.back()" value="返回" />
        </div>
    </form>
</div>

</body>
</html>
