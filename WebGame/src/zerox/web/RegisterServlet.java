package zerox.web;

import zerox.bean.User;
import zerox.service.UserService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //1 接收请求参数
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String check = request.getParameter("check");
        //2.完成功能：校验验证码，校验用户名和密码。任何一项校验不通过，就登录失败
        //2.1 先校验验证码
        String checkcode_server = (String) request.getSession().getAttribute("TWISTEDVERICODE_SERVER");
        if (!check.equalsIgnoreCase(checkcode_server)) {
            //验证码错误
            request.setAttribute("registerError", "验证码错误");
            request.getRequestDispatcher("/registerPage.jsp").forward(request, response);
            return;
        }

        //2.2 再校验用户名,通过service进行注册
        User user = new User(username,password);
        UserService userService = new UserService();
        boolean b = false;
        try {
            b = userService.register(user);
            //3 提示
            if(b){
                PrintWriter out = response.getWriter();
                response.getWriter().print("用户注册成功<br/>");
                response.getWriter().print("<a href='index.jsp'>返回首页</a>");
            } else {
                request.setAttribute("registerError", "您填入的用户名已被他人使用");
                request.getRequestDispatcher("/registerPage.jsp").forward(request, response);
            }
        } catch (IllegalArgumentException e) {
            request.setAttribute("registerError", e.getMessage());
            request.getRequestDispatcher("/registerPage.jsp").forward(request, response);
        }
    }
}
