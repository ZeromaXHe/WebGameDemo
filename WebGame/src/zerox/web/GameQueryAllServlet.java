package zerox.web;

import zerox.bean.Game;
import zerox.service.PlayedGameService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "GameQueryAllServlet", urlPatterns = "/gameQueryAll")
public class GameQueryAllServlet extends HttpServlet {
    private PlayedGameService service = new PlayedGameService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.接收参数：略
        //2.封装实体：略
        //3.完成功能：调用service，查询所有用户
        List<Game> gameList = service.queryAll();
        //4.处理结果：请求转发到playedGameList.jsp
        request.setAttribute("gameList", gameList);
        request.getRequestDispatcher("/playedGameList.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
