package zerox.web;

import zerox.service.PlayedGameService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteGameServlet",urlPatterns = "/deleteGame")
public class DeleteGameServlet extends HttpServlet {
    private PlayedGameService gameService = new PlayedGameService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.接收参数
        String id = request.getParameter("id");
        //2.完成功能
        boolean success = gameService.delete(id);
        //3.处理结果
        response.sendRedirect(request.getContextPath() + "/gameQueryAll");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
