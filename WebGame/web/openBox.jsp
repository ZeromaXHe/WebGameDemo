<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/30
  Time: 12:32
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

    <title>开箱</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-1.11.3.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp" flush="true"/>
<br/>
<br/>
<br/>
<div class="container">
    <h3 style="text-align: center">开箱页面</h3>
    <!-- 小像框 -->
    <div class="col-xs-4" id="div1" style="border-style:dotted;width:160px;height:100px">
        <img class="img-responsive" id="img1ID" src="imgs/box_touhaotexun.png"/>
    </div>

    <!-- 大像框 -->
    <div class="col-xs-8" id="div2" style="border-style:double;width:640px;height:400px;">
        <img style="width:640px;height:400px;display: block" id="img2ID" src="imgs/box_touhaotexun.png" />
    </div>

    <!-- 开始按钮 -->
    <input
            id="startID"
            type="button"
            value="点击开始"
            style="width:150px;height:150px;font-size:22px"
            onclick="imgStart()">

    <!-- 停止按钮 -->
    <input
            id="stopID"
            type="button"
            value="点击停止"
            style="width:150px;height:150px;font-size:22px"
            onclick="imgStop()">


    <script language='javascript' type='text/javascript'>
        //准备一个一维数组，装用户的像片路径
        var imgs = [
            "imgs/yellow_zhuazidao.png",
            "imgs/red_ak47_erximofu.png",
            "imgs/red_awp_heisemeiying.png",
            "imgs/violet_desert_jixiegongye.png",
            "imgs/violet_mp5_linguangti.png",
            "imgs/violet_ump45_dongliang.png",
            "imgs/purple_g3sg1_jinghuazhe.png",
            "imgs/purple_mac10_xiaosheng.png",
            "imgs/purple_galil_xinhaodeng.png",
            "imgs/purple_p250_xiabuweili.png",
            "imgs/purple_usp_shanhui.png",
            "imgs/blue_tec9_potonglantie.png",
            "imgs/blue_sg553_weixianjuli.png",
            "imgs/blue_sawedoff_heisha.png",
            "imgs/blue_nova_zhuomu.png",
            "imgs/blue_mp9_zhongduweixie.png",
            "imgs/blue_glock18_xiushilieyan.png",
            "imgs/blue_m4a4_meiyuansu.png"
        ];

        /*
    点击开始：在小像框里img1ID不停的切换图片。20毫秒切换一次，从数组imgs里得到随机的一张图片
    分析：
        20毫秒切换一次：setInterval
        从imgs里随机获取一个图片的路径：Math.random() 范围是：[0, 1)，转换成：[0, 6]随机整数

        定时器开启之后，把开始按钮设置为禁用
     */
        var timer;
        function imgStart() {
            timer = setInterval(function () {
                // Math.random() 范围是：[0, 1)， *7 得到：[0, 7)， 向下取整
                var index = Math.floor(Math.random() * imgs.length);
                var src = imgs[index];
                if(index==0) $("#div1").css("background-image","linear-gradient(to top,yellow, grey 30%)");
                else if(index<=2) $("#div1").css("background-image","linear-gradient(to top,red,grey 30%");
                else if(index<=5) $("#div1").css("background-image","linear-gradient(to top,violet,grey 30%");
                else if(index<=10) $("#div1").css("background-image","linear-gradient(to top,darkviolet,grey 30%");
                else $("#div1").css("background-image","linear-gradient(to top,blue,grey 30%");
                $("#img1ID").attr("src", src);
            }, 20);
            //定时器开启之后，把开始按钮设置为禁用
            $("#startID").attr("disabled", true);
        }

        /*
        点击停止：小像框里停止切换，把小像框里的图片，显示到大像框里
        分析：
            停止切换，清除定时器：clearInterval
            获取小像框的src属性值，设置给大像框的src

            停止定时器之后，把开始按钮设置为可用的
         */
        function imgStop() {
            clearInterval(timer);
            //把小像框里的图片，显示到大像框里
            var src = $("#img1ID").attr("src");
            $("#img2ID").attr("src", src);
            $("#div2").css("background-image",$("#div1").css("background-image"));
            //停止定时器之后，把开始按钮设置为可用的
            $("#startID").attr("disabled", false);
        }
    </script>
</div>
</body>
</html>
