package zerox.web;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name="DemoServlet", urlPatterns = "/demo")
public class DemoServlet implements Servlet {
    @Override
    public void init(ServletConfig servletConfig) throws ServletException {

    }

    @Override
    public ServletConfig getServletConfig() {
        return null;
    }

    @Override
    public void service(ServletRequest servletRequest, ServletResponse servletResponse) throws ServletException, IOException {
        servletResponse.setContentType("text/html;charset=UTF-8");
        PrintWriter out = servletResponse.getWriter();
        out.print("<form action='/register' method='post'>");
        out.print("用户名: <input type='text' name='username' value='' placeholder='username here'/> <br/>");
        out.print("密码: <input type='password' name='password' value='' placeholder='password here'/> <br/>");
        out.print(" <input type='submit'  value='提交'/>");
        out.print("</form>");
    }

    @Override
    public String getServletInfo() {
        return null;
    }

    @Override
    public void destroy() {

    }
}
