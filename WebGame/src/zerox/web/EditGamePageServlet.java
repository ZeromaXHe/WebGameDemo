package zerox.web;

import zerox.bean.Game;
import zerox.service.PlayedGameService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "EditGamePageServlet", urlPatterns = "/editGamePage")
public class EditGamePageServlet extends HttpServlet {
    private PlayedGameService service = new PlayedGameService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.接收参数：id
        String id = request.getParameter("id");
        //2.完成功能：调用Service，查询用户
        Game game = service.findGame(id);
        //3.处理结果：
        request.setAttribute("game", game);
        request.getRequestDispatcher("/updateGame.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
