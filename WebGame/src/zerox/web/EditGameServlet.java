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

@WebServlet(name = "EditGameServlet", urlPatterns = "/editGame")
public class EditGameServlet extends HttpServlet {
    private PlayedGameService gameService = new PlayedGameService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        //1.接收参数
        Map<String, String[]> map = request.getParameterMap();
        //2.封装实体
        Game game = BeanUtils.populate(map, Game.class);
        //3.完成功能
        boolean success = gameService.edit(game);
        //4.处理结果
        response.sendRedirect(request.getContextPath() + "/gameQueryAll");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
