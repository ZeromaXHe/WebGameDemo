package zerox.web;

import zerox.bean.Game;
import zerox.bean.GamePage;
import zerox.service.PlayedGameService;
import zerox.utils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.Map;

@WebServlet(name = "GameServlet", urlPatterns = "/game")
public class GameServlet extends BaseServlet {
    private PlayedGameService service = new PlayedGameService();

    private void add(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        //1.接收参数：Map
        Map<String, String[]> map = request.getParameterMap();
        //2.封装实体：User对象
        Game game = BeanUtils.populate(map, Game.class);

        //3.完成功能：调用Service，保存数据到数据库
        boolean success = service.add(game);
        //4.处理结果：简单处理，直接跳转到UserQueryAllServlet
        response.sendRedirect(request.getContextPath() + "/game?action=queryAll");
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //1.接收参数
        String id = request.getParameter("id");
        //2.完成功能
        boolean success = service.delete(id);
        //3.处理结果
        response.sendRedirect(request.getContextPath() + "/game?action=queryAll");
    }

    private void editPage(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //1.接收参数：id
        String id = request.getParameter("id");
        //2.完成功能：调用Service，查询用户
        Game game = service.findGame(id);
        //3.处理结果：
        request.setAttribute("game", game);
        request.getRequestDispatcher("/updateGame.jsp").forward(request, response);
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        //1.接收参数
        Map<String, String[]> map = request.getParameterMap();
        //2.封装实体
        Game game = BeanUtils.populate(map, Game.class);
        //3.完成功能
        boolean success = service.edit(game);
        //4.处理结果
        response.sendRedirect(request.getContextPath() + "/game?action=queryAll");
    }

    private void queryAll(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //1.接收参数
        String pageNumberStr = request.getParameter("pageNumber");
        String pageSizeStr = request.getParameter("pageSize");
        String wordStr = request.getParameter("word");
        String[] rangeStrs = request.getParameterValues("range");
        int pageNumber = 1;
        int pageSize = 3;
        if (pageNumberStr != null && !"".equals(pageNumberStr)) {
            pageNumber = Integer.parseInt(pageNumberStr);
        }
        if (pageSizeStr != null && !"".equals(pageSizeStr)) {
            pageSize = Integer.parseInt(pageSizeStr);
        }
        if(wordStr!=null){
            wordStr=wordStr.trim();
        }

        //2.封装实体：略

        //3.完成功能：调用service，查询分页中的所有游戏
        /*List<Game> gameList = service.queryAll();*/
        GamePage<Game> gamePage = null;
        if (rangeStrs==null ||"".equals(rangeStrs[0])|| wordStr == null || "".equals(wordStr)) {
            gamePage = service.findByPage(pageNumber, pageSize);
        }else{
            gamePage = service.findByPageAndWord(pageNumber, pageSize, wordStr,rangeStrs);
        }
        //4.处理结果：请求转发到playedGameList.jsp
        request.setAttribute("gamePage", gamePage);
        request.setAttribute("pageNumber", pageNumber);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("word",wordStr);
        request.setAttribute("range",rangeStrs);
        request.getRequestDispatcher("/playedGameList.jsp").forward(request, response);
    }
}
