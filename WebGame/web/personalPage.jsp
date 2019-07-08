<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/8
  Time: 15:10
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

    <title>${username} 的个人资料页</title>

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

        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#profile" aria-controls="profile" role="tab"
                                                      data-toggle="tab">个人资料</a></li>
            <li role="presentation"><a href="#userMcRecord" aria-controls="userMcRecord" role="tab" data-toggle="tab">扫雷战绩</a>
            </li>
            <li role="presentation"><a href="#history" aria-controls="history" role="tab" data-toggle="tab">扫雷历史</a>
            </li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="profile">
                <div class="col-xs-12">
                    <h3 style="text-align: center">个人资料</h3>
                </div>
                <div class="col-xs-offset-3 col-xs-6 list-group">
                    <a href="#" class="list-group-item active">
                        <h4 class="list-group-item-heading">用户名：</h4>
                        <p class="list-group-item-text">${username}</p>
                    </a>
                    <a href="#" class="list-group-item">
                        <h4 class="list-group-item-heading">用户id：</h4>
                        <p class="list-group-item-text">${userid}</p>
                    </a>
                    <a href="#" class="list-group-item">
                        <h4 class="list-group-item-heading">个人简介：</h4>
                        <p class="list-group-item-text">该功能还未开放</p>
                    </a>
                </div>
            </div>


            <div role="tabpanel" class="tab-pane" id="userMcRecord">
                <div class="col-xs-12">
                    <h3 style="text-align: center">扫雷游戏战绩</h3>
                </div>
                <div class="col-xs-offset-2 col-xs-8">
                    <div class="progress">
                        <div class="progress-bar progress-bar-success progress-bar-striped active" id="winProgress" style="width: 50%">
                            <span id="winProgressText">Win: 5/10 (50%)</span>
                        </div>
                        <div class="progress-bar progress-bar-warning progress-bar-striped" id="unfinishedProgress" style="width: 20%">
                            <span id="unfinishedProgressText">Unfinished: 2/10 (20%)</span>
                        </div>
                        <div class="progress-bar progress-bar-danger" id="loseProgress" style="width: 30%">
                            <span id="loseProgressText">Lose: 3/10 (30%)</span>
                        </div>
                    </div>
                </div>
                <div class="col-xs-offset-2 col-xs-8">
                    <div class="col-xs-4">
                        <div class="panel panel-success">
                            <div class="panel-heading">胜利局数</div>
                            <div class="panel-body" id ="winGame">
                                5
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-4">
                        <div class="panel panel-warning">
                            <div class="panel-heading">未完成局数</div>
                            <div class="panel-body" id="unfinishedGame">
                                2
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-4">
                        <div class="panel panel-danger">
                            <div class="panel-heading">失败局数</div>
                            <div class="panel-body" id="loseGame">
                                3
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-offset-2 col-xs-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">游戏总次数</div>
                        <div class="panel-body" id="playedGame">
                            10
                        </div>
                    </div>
                </div>
                <div class="col-xs-offset-2 col-xs-8">
                    <div class="panel panel-primary">
                        <div class="panel-heading">胜率</div>
                        <div class="panel-body" id="winRate">
                            50%
                        </div>
                    </div>
                </div>

                <div class="col-xs-offset-2 col-xs-8">
                    <div class="panel panel-info">
                        <div class="panel-heading">最快获胜时间</div>
                        <div class="panel-body" id="fastWinTime">
                            00:20.127
                        </div>
                    </div>
                </div>
            </div>


            <div role="tabpanel" class="tab-pane" id="history">
                <div class="col-xs-12">
                    <h3 style="text-align: center">扫雷游玩历史(现在都是虚假数据)</h3>
                </div>
                <table border="1" class="table table-bordered table-hover">
                    <tr class="success">
                        <th>序号</th>
                        <th>游戏状态</th>
                        <th>游戏时间</th>
                        <th>剩余未挖掘安全地块</th>
                        <th>开始时间</th>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td style="color:green">胜利</td>
                        <td>00:20.127</td>
                        <td>0</td>
                        <td>2019-07-08 12:06:36</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td style="color:red">失败</td>
                        <td>00:17.259</td>
                        <td>5</td>
                        <td>2019-07-08 12:06:14</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td style="color:red">失败</td>
                        <td>00:01.511</td>
                        <td>71</td>
                        <td>2019-07-08 12:05:46</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td style="color:orange">未完成</td>
                        <td>--:--.---</td>
                        <td>71</td>
                        <td>2019-07-08 12:01:39</td>
                    </tr>
                    <tr>
                        <td colspan="5" align="center">
                            <nav>
                                <ul class="pagination">
                                    <li class="disabled">
                                        <a href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <li class="active">
                                        <a href="#">1 <span class="sr-only">(current)</span></a>
                                    </li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                    <li>
                                        <a href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </td>
                    </tr>
                </table>
            </div>
        </div>

    </div>
</div>

</body>

<script>
    $.post(
        "minecleanning",
        {action:"isMCPlayer",userid:${userid}},
        function (resultInfo) {
            if(resultInfo.ok){
                var mcUserRecord = resultInfo.data;
                var winPercentage = Math.round(mcUserRecord.winGame/mcUserRecord.playedGame*100*100)/100;
                var losePercentage = Math.round(mcUserRecord.loseGame/mcUserRecord.playedGame*100*100)/100;
                var unfinishedPercentage = Math.round(mcUserRecord.unfinishedGame/mcUserRecord.playedGame*100*100)/100;
                $("#winGame").text(""+mcUserRecord.winGame);
                $("#winProgress").attr("style","width:"+winPercentage+"%");
                $("#winProgressText").text("胜利："+mcUserRecord.winGame+"/"+mcUserRecord.playedGame+" ("+winPercentage+"%)");

                $("#loseGame").text(""+mcUserRecord.loseGame);
                $("#loseProgress").attr("style","width:"+losePercentage+"%");
                $("#loseProgressText").text("失败："+mcUserRecord.loseGame+"/"+mcUserRecord.playedGame+" ("+losePercentage+"%)");

                $("#unfinishedGame").text(""+mcUserRecord.unfinishedGame);
                $("#unfinishedProgress").attr("style","width:"+unfinishedPercentage+"%");
                $("#unfinishedProgressText").text("未完成："+mcUserRecord.unfinishedGame+"/"+mcUserRecord.playedGame+" ("+unfinishedPercentage+"%)");

                $("#playedGame").text(""+mcUserRecord.playedGame);
                $("#winRate").text(""+(Math.round(mcUserRecord.winRate*100*100)/100)+"%");

                var gameTimeMillis = mcUserRecord.fastWinMillis;

                if(gameTimeMillis!=999999999) {
                    var millis = gameTimeMillis % 1000;
                    if (millis < 10) var millis0 = "00";
                    else if (millis < 100) millis0 = "0";
                    else millis0 = "";

                    var sec = parseInt(gameTimeMillis / 1000) % 60;
                    if (sec < 10) var sec0 = "0";
                    else sec0 = "";

                    var min = parseInt(gameTimeMillis / 60000);

                    $("#fastWinTime").text("" + min + ":" + sec0 + sec + "." + millis0 + millis);
                }else{
                    $("#fastWinTime").text("--:--.---");
                }

            }
            else{
                $("#userMcRecord").html("<h3 style=\"text-align: center\"> 该用户并没有玩过扫雷</h3>");
                $("#history").html("<h3 style=\"text-align: center\"> 该用户并没有玩过扫雷</h3>");
            }
        }, "json"
    );
</script>
</html>
