<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/25
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<!-- 网页使用的语言 -->
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
    <title>游戏列表</title>

    <style>
        .error {
            color: red;
        }
    </style>
    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-1.11.3.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
    <style type="text/css">
        td, th {
            text-align: center;
        }
    </style>
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
            <li role="presentation" <c:if test="${gamePage.rangestrs!=null&&''!=gamePage.rangestrs}">class="active"</c:if>><a href="#searchTab" aria-controls="searchTab" role="tab" data-toggle="tab">搜索</a>
            </li>
            <li role="presentation" <c:if test="${gamePage.rangestrs==null||''==gamePage.rangestrs}">class="active"</c:if>><a href="#resultTab" aria-controls="resultTab" role="tab"
                                                      data-toggle="tab">结果</a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane <c:if test='${gamePage.rangestrs!=null&&""!=gamePage.rangestrs}'>active</c:if>" id="searchTab">
                <form id="searchForm" action="game" method="get">
                    <input type="hidden" name="action" value="queryAll">
                    <div class="form-group col-xs-6">
                        <label for="searchWord">搜索内容</label>
                        <input type="text" class="form-control" id="searchWord" name="word" value="${word}">
                    </div>
                    <div class="form-group col-xs-4">
                        <label for="pageSizeBox">每页显示行数</label>
                        <input type="text" class="form-control" id="pageSizeBox" name="pageSize" value="${pageSize}"
                               placeholder="3">
                    </div>
                    <div class="form-group col-xs-2" style="text-align: center">
                        <br/>
                        <input class="btn btn-primary btn-block" type="submit" value="提交"/>
                    </div>
                    <div class="form-group col-xs-10">
                        <label>搜索范围:&nbsp;</label>
                        <input type="checkbox" id="CHname" name="range" value="gameCHname" <c:if test="${fn:contains(gamePage.rangestrs,'gameCHname')||gamePage.rangestrs==null||''==gamePage.rangestrs}">checked="checked"</c:if>/>中文名&nbsp;
                        <input type="checkbox" id="ENname" name="range" value="gameENname" <c:if test="${fn:contains(gamePage.rangestrs,'gameENname')}">checked="checked"</c:if>/>英文名&nbsp;
                        <input type="checkbox" id="developer" name="range" value="gamedeveloper" <c:if test="${fn:contains(gamePage.rangestrs,'gamedeveloper')}">checked="checked"</c:if>/>开发商&nbsp;
                        <input type="checkbox" id="publisher" name="range" value="gamepublisher" <c:if test="${fn:contains(gamePage.rangestrs,'gamepublisher')}">checked="checked"</c:if>/>发行商&nbsp;
                        <input type="checkbox" id="releasedate" name="range" value="gamereleasedate" <c:if test="${fn:contains(gamePage.rangestrs,'gamereleasedate')}">checked="checked"</c:if>/>发布日期&nbsp;
                        <input type="checkbox" id="genre" name="range" value="gamegenre" <c:if test="${fn:contains(gamePage.rangestrs,'gamegenre')}">checked="checked"</c:if>/>游戏类型
                    </div>
                </form>
            </div>
            <div role="tabpanel" class="tab-pane <c:if test='${gamePage.rangestrs==null||""==gamePage.rangestrs}'>active</c:if>" id="resultTab" style="font-size: large">当前页面共${gamePage.data.size()}条，共${gamePage.pageCount}页，当前处于第${gamePage.pageNumber}页</div>
        </div>
    </div>

    <div class="col-xs-12">
        <h3 style="text-align: center">游戏列表</h3>
    </div>

    <table border="1" class="table table-bordered table-hover">
        <tr class="success">
            <th>序号</th>
            <th>游戏中文名</th>
            <th>英文名</th>
            <th>开发商</th>
            <th>发行商</th>
            <th>发布日期</th>
            <th>游戏类型</th>
            <th>操作</th>
        </tr>
        <c:if test="${gamePage.data.size()==0}">
            <tr>
                <td colspan="8" align="center" style="font-size: large;color: dimgrey">
                    本次查询无结果，请尝试刷新或者改变搜索条件
                </td>
            </tr>
        </c:if>
        <c:forEach items="${gamePage.data}" var="game">
            <tr>
                <td>${game.id}</td>
                <td>${game.gameCHname}</td>
                <td>${game.gameENname}</td>
                <td>${game.gamedeveloper}</td>
                <td>${game.gamepublisher}</td>
                <td>${game.gamereleasedate}</td>
                <td>${game.gamegenre}</td>
                <td>
                    <a class="btn btn-default btn-sm" href="javascript:void(0)"
                       onclick="confirmAction(${game.id},'edit')">修改</a>&nbsp;
                        <%--  a标签的href值设置为：javascript:void(0)表示禁用超链接的跳转--%>
                    <a class="btn btn-danger btn-sm" href="javascript:void(0)"
                       onclick="confirmAction(${game.id},'delete')">删除</a>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="8" align="center">
                <a class="btn btn-primary" href="javascript:void(0)" onclick="confirmAction(0,'add')">添加游戏</a>
            </td>
        </tr>
        <c:set var="after" value="${gamePage.pageNumber-2 gt 1?2:6-gamePage.pageNumber}"/>
        <c:set var="before"
               value="${gamePage.pageNumber+2 lt gamePage.pageCount?2:5-gamePage.pageCount+gamePage.pageNumber}"/>
        <c:if test="${gamePage.data.size()>0}">
            <tr>
                <td colspan="8" align="center">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                                <%--
                                上一页按钮
                                如果当前页码>1：允许点击“上一页”按钮
                                否则：不允许点击“上一页”
                                --%>
                            <c:if test="${gamePage.pageNumber > 1}">
                                <li>
                                    <a href="game?action=queryAll&pageNumber=${gamePage.pageNumber-1}&pageSize=${pageSize}&word=${word}${gamePage.rangestrs}"
                                       aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${gamePage.pageNumber <= 1}">
                                <li class="disabled">
                                    <a aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>

                                <%--
                                页码按钮：
                                当总页数小于7时，
                                是实际计算分了多少页，就显示多少个页码按钮。从1循环到 gamePage.pageCount
                                否则的话，判断前后是否和开头1和结尾pageCount相连，根据需要输出“...”
                                并且保证总共显示的页面跳转按钮为7个。
                                --%>
                            <c:choose>

                                <c:when test="${gamePage.pageCount<=7}">
                                    <c:forEach var="i" begin="1" end="${gamePage.pageCount}" step="1">
                                        <%--
                                        要把当前页码按钮标示出来：
                                        if i==gamePage.pageNumber：i就是当前页码；否则就i就不是当前页码
                                        --%>
                                        <li ${i==gamePage.pageNumber?'class="active"':''}><a
                                                href="game?action=queryAll&pageNumber=${i}&pageSize=${pageSize}&word=${word}${gamePage.rangestrs}">${i}</a>
                                        </li>

                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <li ${1==gamePage.pageNumber?'class="active"':''}><a
                                            href="game?action=queryAll&pageNumber=1&pageSize=${pageSize}&word=${word}${gamePage.rangestrs}">1</a>
                                    </li>
                                    <c:if test="${gamePage.pageNumber-2 gt 2}">
                                        <li class="disabled"><a href="">...</a></li>
                                    </c:if>
                                    <c:forEach var="i"
                                               begin="${gamePage.pageNumber-2 gt 1?gamePage.pageNumber-before:2}"
                                               end="${gamePage.pageNumber+2 lt gamePage.pageCount?gamePage.pageNumber+after:gamePage.pageCount-1}"
                                               step="1">
                                        <%--
                                        要把当前页码前后的按钮标示出来：
                                        if i==gamePage.pageNumber：i就是当前页码；否则就i就不是当前页码
                                        --%>
                                        <li ${i==gamePage.pageNumber?'class="active"':''}><a
                                                href="game?action=queryAll&pageNumber=${i}&pageSize=${pageSize}&word=${word}${gamePage.rangestrs}">${i}</a>
                                        </li>

                                    </c:forEach>
                                    <c:if test="${gamePage.pageNumber+2 lt gamePage.pageCount-1}">
                                        <li class="disabled"><a href="">...</a></li>
                                    </c:if>
                                    <li ${gamePage.pageCount==gamePage.pageNumber?'class="active"':''}><a
                                            href="game?action=queryAll&pageNumber=${gamePage.pageCount}&pageSize=${pageSize}&word=${word}${gamePage.rangestrs}">${gamePage.pageCount}</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                                <%--
                                下一页按钮
                                如果  当前页码 < 总页数：允许点击“下一页”按钮
                                否则：不允许点击“下一页”按钮
                                --%>
                            <c:if test="${gamePage.pageNumber < gamePage.pageCount}">
                                <li>
                                    <a href="game?action=queryAll&pageNumber=${gamePage.pageNumber+1}&pageSize=${pageSize}&word=${word}${gamePage.rangestrs}"
                                       aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${gamePage.pageNumber >= gamePage.pageCount}">
                                <li class="disabled">
                                    <a aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </td>
            </tr>
        </c:if>
    </table>
</div>
<script src="js/jquery.validate.min.js"></script>
<script>
    $("#searchForm").validate({
        rules: {
            pageSize: {digits: true, min: 1}
        }, messages: {
            pageSize: {digits: "请输入大于等于1的整数", min: "请输入大于等于1的整数"}
        }
    });
</script>

<script>
    function confirmAction(id, action) {
        //获取用户登录数据异步请求
        var url = "user";//UserServlet
        var data = {action: "getLoginUserData"};
        var callback;
        if (action === "delete") {
            callback = function (resultInfo) {
                //判断返回数据有效性
                if (resultInfo.ok && "admin" === resultInfo.data.username) {
                    var isYes = confirm("确定要删除吗？");
                    if (isYes) {
                        //发请求到Servlet，并且传参游戏的id
                        location.href = "game?action=delete&id=" + id;
                    }
                }
                else {
                    alert("你不是管理员，没有进行删除操作的权限");
                }
            }
        } else if (action === "edit") {
            callback = function (resultInfo) {
                //判断返回数据有效性
                if (resultInfo.ok && "admin" === resultInfo.data.username) {
                    //发请求到Servlet，并且传参游戏的id
                    location.href = "game?action=editPage&id=" + id;
                }
                else {
                    alert("你不是管理员，没有进行修改操作的权限");
                }
            }
        } else if (action === "add") {
            callback = function (resultInfo) {
                //判断返回数据有效性
                if (resultInfo.ok) {
                    //发请求到Servlet，并且传参游戏的id
                    location.href = "addGamePage.jsp";
                }
                else {
                    alert("你还没有登录，不能添加游戏");
                }
            }
        }
        var type = "json";
        $.post(url, data, callback, type);
    }
</script>
</body>
</html>
