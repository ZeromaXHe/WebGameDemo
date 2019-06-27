package zerox.web;

import zerox.bean.Game;
import zerox.service.PlayedGameService;
import zerox.utils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "AddGameServlet", urlPatterns = "/addGame")
public class AddGameServlet extends HttpServlet {
    private PlayedGameService service = new PlayedGameService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        //1.接收参数：Map
        Map<String, String[]> map = request.getParameterMap();
        //2.封装实体：User对象
        Game game = BeanUtils.populate(map, Game.class);

        //3.完成功能：调用Service，保存数据到数据库
        boolean success = service.add(game);
        //4.处理结果：简单处理，直接跳转到UserQueryAllServlet
        response.sendRedirect(request.getContextPath() + "/gameQueryAll");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
