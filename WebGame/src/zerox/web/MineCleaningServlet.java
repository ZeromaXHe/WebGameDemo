package zerox.web;

import com.fasterxml.jackson.databind.ObjectMapper;
import zerox.bean.*;
import zerox.service.MineCleaningService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

@WebServlet(name = "MineCleaningServlet",urlPatterns = "/minecleanning")
public class MineCleaningServlet extends BaseServlet {
    private MineCleaningService mineCleaningService = new MineCleaningService();

    public void newGame(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("loginUser");
        int userid = user.getUserid();

        System.out.println("正在为userid为："+userid+"的玩家创建新游戏");

        int status = 0;//0代表未完赛，1代表胜利，2代表失败
        int restUndig = 71;

        System.out.println(request.getParameter("startTime"));

        Timestamp startTime = Timestamp.valueOf(request.getParameter("startTime"));
        MCGameRecord mcGameRecord = new MCGameRecord(1,userid,status,999999999,restUndig,startTime);
        int gameid = mineCleaningService.newGame(mcGameRecord);
        request.getSession().setAttribute("gameid", gameid);
    }

    public void updateUnfinishedGame(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int gameid = Integer.parseInt(request.getSession().getAttribute("gameid").toString());//Session的Attribute转int
        int restUndig = Integer.parseInt(request.getParameter("restUndig"));

        mineCleaningService.updateUnfinishedGame(gameid,restUndig);
    }

    public void endGame(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int gameid = Integer.parseInt(request.getSession().getAttribute("gameid").toString());
        int restUndig = Integer.parseInt(request.getParameter("restUndig"));
        int gameTimeMillis = Integer.parseInt(request.getParameter("gameTimeMillis"));

        mineCleaningService.endGame(gameid, restUndig, gameTimeMillis);
    }

    public void isMCPlayer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ResultInfo info = null;
        int userid = Integer.parseInt(request.getParameter("userid"));
        MCUserRecord mcUserRecord = mineCleaningService.findMCPlayer(userid);
        if(mcUserRecord==null){
            info = new ResultInfo(false,"该userid="+userid+"的用户不是扫雷游戏玩家");
        }
        else{
            info = new ResultInfo(true, mcUserRecord,"是扫雷玩家");
        }
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(info);
        response.getWriter().print(json);
    }

    public void queryAllPlayer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ResultInfo info = null;
        String sortBy = request.getParameter("sortBy");
        List<MineCleaningHero> resList = mineCleaningService.queryAllPlayer(sortBy);
        if(resList.size()==0){
            info = new ResultInfo(false,"没有玩家");
        }
        else{
            info = new ResultInfo(true, resList, "玩家数为："+resList.size());
        }
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(info);
        response.getWriter().print(json);
    }
}
