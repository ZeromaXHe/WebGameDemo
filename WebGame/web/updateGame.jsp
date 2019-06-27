<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/27
  Time: 8:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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

    <title>游戏信息修改</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-1.11.3.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp" flush="true"/>
<div class="container" style="width: 400px;">
    <br/>
    <br/>
    <br/>
    <h3 style="text-align: center;">修改游戏信息</h3>
    <form action="editGame" method="post">
        <input type="hidden" name="id" value="${game.id}">
        <div class="form-group">
            <label for="CHname">中文名</label>
            <input type="text" class="form-control" id="CHname" name="gameCHname" value="${game.gameCHname}" readonly="readonly" placeholder="请输入游戏中文名" />
        </div>

        <div class="form-group">
            <label for="ENname">英文名</label>
            <input type="text" class="form-control" id="ENname" name="gameENname" value="${game.gameENname}" readonly="readonly" placeholder="请输入游戏英文名" />
        </div>

        <div class="form-group">
            <label for="developer">开发商：</label>
            <input type="text" class="form-control" id="developer" value="${game.gamedeveloper}" name="gamedeveloper" placeholder="请输入开发商" />
        </div>

        <div class="form-group">
            <label for="publisher">发行商：</label>
            <input type="text" class="form-control" id="publisher" value="${game.gamepublisher}" name="gamepublisher" placeholder="请输入发行商" />
        </div>

        <div class="form-group">
            <label for="releasedate">发行时间：</label>
            <input type="text" class="form-control" id="releasedate" value="${game.gamereleasedate}" name="gamereleasedate" placeholder="请输入发行时间"/>
        </div>

        <div class="form-group">
            <label for="genre">游戏类型：</label>
            <input type="text" class="form-control" id="genre" value="${game.gamegenre}" name="gamegenre" placeholder="请输入游戏类型"/>
        </div>

        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="提交" />
            <input class="btn btn-default" type="reset" value="重置" />
            <input class="btn btn-default" type="button" onclick="history.back()" value="返回"/>
        </div>
    </form>
</div>

</body>
</html>
