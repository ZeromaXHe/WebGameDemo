<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/1
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>扫雷</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery-1.11.3.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp" flush="true"></jsp:include>
<div class="container">
    <br/>
    <br/>
    <br/>
    <h3 style="text-align: center">扫雷游戏</h3>
    <button class="btn btn-primary" onclick="gaming()">
        重新开启一局游戏
    </button>
    <div id="minemap"> </div>
</div>
</body>

<script>
    var mineMap = new Array(11);
    for(var i=0;i<11;i++){
        mineMap[i]= new Array(11);
    }

    var mineMapMask = new Array(11);
    for(i=0;i<11;i++){ //js的作用域只有函数采用，所以这里i不需要var
        mineMapMask[i]= new Array(11);
    }

    var offset = [[-1,-1],[-1,0],[-1,1],[0,-1],[0,1],[1,-1],[1,0],[1,1]];
    var mineNum = 10;
    var remainingUndig = 81;
    var endGameFlag = false;

    gaming();

    function gaming(){
        renderMap();
        endGameFlag=false;
        reMineMap();
        initMineMap();
        reMineMapMask();
        setBoundary();
        remainingUndig = 81;
    }

    function renderMap(){
        var htmlstr = "<table border=\"1\" class=\"table table-bordered\" style=\"table-layout:fixed;font-size: large;font-weight: bold;align-content: center\" cellpadding=\"0\" cellspacing=\"0\">";
        for(var i=1;i<=9;i++){
            htmlstr+="<tr id=\"tr"+i+"\">";
            for(var j=1;j<=9;j++){
                htmlstr+="<td id=\""+i+"_"+j+"\" align=\"center\"><button class=\"btn btn-block\" onclick=\"userMineMapMaskAfterDig("+i+","+j+")\">&nbsp;</button></td>";
            }
            htmlstr+="</tr>";
        }
        htmlstr+="</table>";
        $("#minemap").html(htmlstr);
    }

    function initMineMap(){
        mineGenerator();
        numGenerator();
    }

    function reMineMap(){
        for(var i=0;i<11;i++){
            for(var j=0;j<11;j++){
                mineMap[i][j]=0;
            }
        }
    }

    function reMineMapMask(){
        for(var i=0;i<11;i++){
            for(var j=0;j<11;j++){
                mineMapMask[i][j]=false;
            }
        }
    }

    function mineGenerator(){
        var finishMineGeneratorFlag = true;
        var mineCount = 0;
        var row;
        var col;
        while (finishMineGeneratorFlag) {
            row = Math.floor(Math.random()*9) + 1;
            col = Math.floor(Math.random()*9) + 1;
            if (mineMap[row][col] !== 9) {
                mineMap[row][col] = 9;
                mineCount++;
            }
            if (mineCount === mineNum) {
                finishMineGeneratorFlag = false;
            }
        }
    }

    function numGenerator(){
        for(var i=1;i<10;i++){
            for(var j=1;j<10;j++){
                if(mineMap[i][j]!==9){
                    var countBomb = 0;
                    for(var k=0;k<8; k++){
                        if(mineMap[i+offset[k][0]][j+offset[k][1]]===9){
                            countBomb++;
                        }
                    }
                    mineMap[i][j] = countBomb;
                }
            }
        }
    }

    function setBoundary(){
        for(var i=0;i<11;i++){
            mineMapMask[i][0] = mineMapMask[i][10] = true;
        }
        for(var j=1;j<10;j++){
            mineMapMask[0][j] = mineMapMask[10][j] = true;
        }
    }

    function userMineMapMaskAfterDig(aRow,aCol){
        if (mineMap[aRow][aCol] === 9) {
            endGameFlag = true;
            $("#minemap button").attr("disabled",true);
            dig(aRow, aCol);
            displayMineMapAfterLose(aRow,aCol);
            alert("你输了，你点击的[" + aRow + "，" + aCol + "]位置是地雷");
        } else {
            dig(aRow, aCol);
            displayMineMap();
            if(remainingUndig === mineNum){
                alert("你赢了！");
                endGameFlag=true;
                $("#minemap button").attr("disabled",true);
            }
        }
    }

    function dig(aRow,aCol){
        mineMapMask[aRow][aCol] = true;
        if (mineMap[aRow][aCol] !== 9) remainingUndig--;
        if (mineMap[aRow][aCol] === 0) {
            for (var i = 0; i < 8; i++) {
                if (!mineMapMask[aRow + offset[i][0]][aCol + offset[i][1]])
                    dig(aRow + offset[i][0], aCol + offset[i][1]);
            }
        }
    }

    function displayMineMap(){
        for (var i = 1; i <= 9; i++) {
            for (var j = 1; j <= 9; j++) {
                if (mineMapMask[i][j]) {
                    if(mineMap[i][j]<=0) $("#"+i+"_"+j).html("<span>&nbsp;</span>");
                    else if(mineMap[i][j]>=9) $("#"+i+"_"+j).html("<span class=\"glyphicon glyphicon-asterisk\" aria-hidden=\"true\"></span>");
                    else {
                        $("#"+i+"_"+j).text(mineMap[i][j]);
                        switch(mineMap[i][j]) {
                            case 1:$("#"+i+"_"+j).attr("style","font-size: large;font-weight: bold;color:blue");break;
                            case 2:$("#"+i+"_"+j).attr("style","font-size: large;font-weight: bold;color:green");break;
                            case 3:$("#"+i+"_"+j).attr("style","font-size: large;font-weight: bold;color:red");break;
                            case 4:$("#"+i+"_"+j).attr("style","font-size: large;font-weight: bold;color:purple");break;
                            case 5:$("#"+i+"_"+j).attr("style","font-size: large;font-weight: bold;color:brown");break;
                            case 6:$("#"+i+"_"+j).attr("style","font-size: large;font-weight: bold;color:cyan");break;
                            case 7:$("#"+i+"_"+j).attr("style","font-size: large;font-weight: bold;color:black");break;
                            case 8:$("#"+i+"_"+j).attr("style","font-size: large;font-weight: bold;color:grey");break;
                        }
                    }
                }
            }
        }
    }

    function displayMineMapAfterLose(aRow,aCol){
        for (var i = 1; i <= 9; i++) {
            for (var j = 1; j <= 9; j++) {
                if(mineMap[i][j]===9) {
                    if(i!==aRow||j!==aCol) $("#"+i+"_"+j).html("<span class=\"glyphicon glyphicon-asterisk\" aria-hidden=\"true\"></span>");
                    else {
                        $("#"+i+"_"+j).attr("style","font-size: large;font-weight: bold;color:orange");
                        $("#"+i+"_"+j).html("<span class=\"glyphicon glyphicon-fire\" aria-hidden=\"true\"></span>");
                    }
                }
            }
        }
    }
</script>

</html>
