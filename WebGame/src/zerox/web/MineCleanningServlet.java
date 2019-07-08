package zerox.web;

import zerox.bean.MCGameRecord;
import zerox.bean.User;
import zerox.service.MineCleannningService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet(name = "MineCleanningServlet",urlPatterns = "/minecleanning")
public class MineCleanningServlet extends BaseServlet {
    private MineCleannningService mineCleannningService = new MineCleannningService();

    public void newGame(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("loginUser");
        int userid = user.getUserid();

        System.out.println("正在为userid为："+userid+"的玩家创建新游戏");

        int status = 0;//0代表未完赛，1代表胜利，2代表失败
        int restUndig = 71;

        System.out.println(request.getParameter("startTime"));

        Timestamp startTime = Timestamp.valueOf(request.getParameter("startTime"));
        MCGameRecord mcGameRecord = new MCGameRecord(1,userid,status,999999999,restUndig,startTime);
        int gameid = mineCleannningService.newGame(mcGameRecord);
        request.getSession().setAttribute("gameid", gameid);
    }

    public void updateUnfinishedGame(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int gameid = Integer.parseInt(request.getSession().getAttribute("gameid").toString());//Session的Attribute转int
        int restUndig = Integer.parseInt(request.getParameter("restUndig"));

        mineCleannningService.updateUnfinishedGame(gameid,restUndig);
    }

    public void endGame(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int gameid = Integer.parseInt(request.getSession().getAttribute("gameid").toString());
        int restUndig = Integer.parseInt(request.getParameter("restUndig"));
        int gameTimeMillis = Integer.parseInt(request.getParameter("gameTimeMillis"));

        mineCleannningService.endGame(gameid, restUndig, gameTimeMillis);
    }
}
