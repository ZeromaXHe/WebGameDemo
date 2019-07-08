<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/8
  Time: 18:57
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

    <title>扫雷英雄榜</title>

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
    <div>
        <div class="col-xs-12">
            <h3 style="text-align: center">扫雷英雄榜</h3>
        </div>

        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#fastTime" aria-controls="fastTime" role="tab" data-toggle="tab">最快记录</a></li>
            <li role="presentation"><a href="#mostWin" aria-controls="mostWin" role="tab" data-toggle="tab">胜利最多</a></li>
            <li role="presentation"><a href="#highestWinRate" aria-controls="settings" role="tab" data-toggle="tab">胜率最高</a></li>
            <li role="presentation"><a href="#mostPlay" aria-controls="mostPlay" role="tab" data-toggle="tab">游玩最多</a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="fastTime">
                <br/>
                <table border="1" class="table table-bordered table-hover" id="fastTimeTable">
                    <tr class="success">
                        <th>用户id</th>
                        <th>用户名</th>
                        <th>游戏总次数</th>
                        <th>胜利数</th>
                        <th>失败数</th>
                        <th>未完成数</th>
                        <th>胜率</th>
                        <th>最快胜利时间</th>
                        <th>个人资料</th>
                    </tr>
                </table>
            </div>
            <div role="tabpanel" class="tab-pane" id="mostWin">
                <br/>
                <table border="1" class="table table-bordered table-hover" id="mostWinTable">
                    <tr class="success">
                        <th>用户id</th>
                        <th>用户名</th>
                        <th>游戏总次数</th>
                        <th>胜利数</th>
                        <th>失败数</th>
                        <th>未完成数</th>
                        <th>胜率</th>
                        <th>最快胜利时间</th>
                        <th>个人资料</th>
                    </tr>
                </table>
            </div>
            <div role="tabpanel" class="tab-pane" id="highestWinRate">
                <br/>
                <table border="1" class="table table-bordered table-hover" id="highestWinRateTable">
                    <tr class="success">
                        <th>用户id</th>
                        <th>用户名</th>
                        <th>游戏总次数</th>
                        <th>胜利数</th>
                        <th>失败数</th>
                        <th>未完成数</th>
                        <th>胜率</th>
                        <th>最快胜利时间</th>
                        <th>个人资料</th>
                    </tr>
                </table>
            </div>
            <div role="tabpanel" class="tab-pane" id="mostPlay">
                <br/>
                <table border="1" class="table table-bordered table-hover" id="mostPlayTable">
                    <tr class="success">
                        <th>用户id</th>
                        <th>用户名</th>
                        <th>游戏总次数</th>
                        <th>胜利数</th>
                        <th>失败数</th>
                        <th>未完成数</th>
                        <th>胜率</th>
                        <th>最快胜利时间</th>
                        <th>个人资料</th>
                    </tr>
                </table>
            </div>
        </div>

    </div>

</div>
</body>

<script>
    function queryAllPlayerSortBy(sortBy){
        $.post(
            "minecleanning",
            {action:"queryAllPlayer",sortBy:sortBy},
            function (resultInfo) {
                if(resultInfo.ok){
                    var users = resultInfo.data;
                    var count = 0;
                    for(var user of users){
                        count++;
                        var gameTimeMillis = user.fastWinMillis;

                        if(gameTimeMillis!=999999999) {
                            var millis = gameTimeMillis % 1000;
                            if (millis < 10) var millis0 = "00";
                            else if (millis < 100) millis0 = "0";
                            else millis0 = "";

                            var sec = parseInt(gameTimeMillis / 1000) % 60;
                            if (sec < 10) var sec0 = "0";
                            else sec0 = "";

                            var min = parseInt(gameTimeMillis / 60000);
                            var fastWinTime = "" + min + ":" + sec0 + sec + "." + millis0 + millis;
                        }
                        else{
                            fastWinTime="--:--.---";
                        }
                        $("#"+sortBy+"Table").append("<tr>\n" +
                            "                        <td "+(count===1?"bgcolor=red":(count===2?"bgcolor=orange":(count===3?"bgcolor=yellow":"")))+">"+user.userid+"</td>\n" +
                            "                        <td "+(count===1?"bgcolor=red":(count===2?"bgcolor=orange":(count===3?"bgcolor=yellow":"")))+">"+user.username+"</td>\n" +
                            "                        <td>"+user.playedGame+"</td>\n" +
                            "                        <td>"+user.winGame+"</td>\n" +
                            "                        <td>"+user.loseGame+"</td>\n" +
                            "                        <td>"+user.unfinishedGame+"</td>\n" +
                            "                        <td>"+Math.round(user.winRate*100*100)/100+"%</td>\n" +
                            "                        <td>"+fastWinTime+"</td>\n" +
                            "                        <td><a role=\"button\" class=\"btn btn-info\" href=\"user?action=personalPage&userid="+user.userid+"\">"+user.username+" 的个人资料</a></td>\n" +
                            "                    </tr>");
                    }
                }
            },"json"
        );
    }

    queryAllPlayerSortBy("fastTime");
    queryAllPlayerSortBy("mostWin");
    queryAllPlayerSortBy("mostPlay");
    queryAllPlayerSortBy("highestWinRate");

</script>

</html>
