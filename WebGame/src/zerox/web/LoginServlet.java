package zerox.web;

import zerox.bean.User;
import zerox.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginServlet" , urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //1.接收参数
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String check = request.getParameter("check");

        //2.完成功能：校验验证码，校验用户名和密码。任何一项校验不通过，就登录失败
        //2.1 先校验验证码
        String checkcode_server = (String) request.getSession().getAttribute("VERIFICATIONCODE_SERVER");
        if (!check.equalsIgnoreCase(checkcode_server)) {
            //验证码错误
            request.setAttribute("loginError", "验证码错误");
            request.getRequestDispatcher("/loginPage.jsp").forward(request, response);
            return;
        }

        //2.2 再校验用户名和密码
        UserService service = new UserService();
        User user = service.login(username, password);
        //3.处理结果
        if (user != null) {
            //登录成功了，重定向跳转到首页
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }else{
            //登录失败了，请求转发跳转到登录页
            request.setAttribute("loginError", "用户名或密码错误");
            request.getRequestDispatcher("/loginPage.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
