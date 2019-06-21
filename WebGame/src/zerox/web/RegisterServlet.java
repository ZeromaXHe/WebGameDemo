package zerox.web;

import zerox.bean.User;
import zerox.service.UserService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "RegisterServlet", urlPatterns = "/register")
public class RegisterServlet implements Servlet{
    @Override
    public void init(ServletConfig servletConfig) throws ServletException {

    }

    @Override
    public ServletConfig getServletConfig() {
        return null;
    }

    @Override
    public void service(ServletRequest servletRequest, ServletResponse servletResponse) throws ServletException, IOException {
        servletRequest.setCharacterEncoding("UTF-8");
        servletResponse.setContentType("text/html;charset=UTF-8");
        //1 接收请求参数
        String username = servletRequest.getParameter("username");
        String password = servletRequest.getParameter("password");
        User user = new User(username,password);

        //2 通过service进行注册
        UserService userService = new UserService();
        boolean b = false;
        PrintWriter out = servletResponse.getWriter();
        try {
            b = userService.register(user);
            //3 提示
            if(b){
                servletResponse.getWriter().print("用户注册成功<br/>");
                servletResponse.getWriter().print("<a href='/demo'>继续注册</a>");
            } else {
                servletResponse.getWriter().print("用户注册失败:您的用户名已被他人使用<br/>");
                servletResponse.getWriter().print("<a href='/demo'>重新尝试注册</a>");
            }
        } catch (IllegalArgumentException e) {
            servletResponse.getWriter().print("用户注册失败:"+e.getMessage()+"<br/>");
            servletResponse.getWriter().print("<a href='/demo'>重新尝试注册</a>");
        }


    }

    @Override
    public String getServletInfo() {
        return null;
    }

    @Override
    public void destroy() {

    }
}
