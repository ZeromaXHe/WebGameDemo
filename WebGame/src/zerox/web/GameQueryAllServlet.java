package zerox.web;

import zerox.bean.Game;
import zerox.bean.GamePage;
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
        //1.接收参数
        String pageNumberStr = request.getParameter("pageNumber");
        String pageSizeStr = request.getParameter("pageSize");
        int pageNumber = 1;
        int pageSize = 3;
        if (pageNumberStr != null && !"".equals(pageNumberStr)) {
            pageNumber = Integer.parseInt(pageNumberStr);
        }
        if (pageSizeStr != null && !"".equals(pageSizeStr)) {
            pageSize = Integer.parseInt(pageSizeStr);
        }

        //2.封装实体：略

        //3.完成功能：调用service，查询分页中的所有游戏
        /*List<Game> gameList = service.queryAll();*/
        GamePage<Game> gamePage = service.findByPage(pageNumber, pageSize);
        //4.处理结果：请求转发到playedGameList.jsp
        request.setAttribute("gamePage", gamePage);
        request.setAttribute("pageNumber", pageNumber);
        request.setAttribute("pageSize", pageSize);
        request.getRequestDispatcher("/playedGameList.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
