package zerox.web;

import com.fasterxml.jackson.databind.ObjectMapper;
import zerox.bean.ResultInfo;
import zerox.bean.User;
import zerox.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UserServlet",urlPatterns = "/user")
public class UserServlet extends BaseServlet {
    private UserService service = new UserService();

    private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }

    /**
     * 处理获取登录用户数据请求
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void getLoginUserData(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ResultInfo resultInfo = null;
        //获取用户登录数据
        User user = (User) request.getSession().getAttribute("loginUser");
        //判断登录数据有效性
        if (user == null) {
            //用户没有登录，直接存储false状态，代表获取数据失败
            resultInfo = new ResultInfo(false);
        } else {
            //用户有登录数据，状态为true,并且存储登录的数据进行返还
            resultInfo = new ResultInfo(true, user, null);
        }
        //将返回数据转换为json
        String jsonData = new ObjectMapper().writeValueAsString(resultInfo);
        //System.out.println(jsonData);
        //返回给浏览器
        response.getWriter().write(jsonData);
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
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
        User user = service.login(username, password);
        //3.处理结果
        if (user != null) {
            //登录成功了，重定向跳转到首页
            request.getSession().setAttribute("loginUser", user);
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } else {
            //登录失败了，请求转发跳转到登录页
            request.setAttribute("loginError", "用户名或密码错误");
            request.getRequestDispatcher("/loginPage.jsp").forward(request, response);
        }
    }

    private void register(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
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
        User user = new User(1,username,password);
        boolean b = false;
        try {
            b = service.register(user);
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

    public void personalPage(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int userid = Integer.parseInt(request.getParameter("userid"));
        request.setAttribute("userid",userid);
        request.setAttribute("username",service.findUserById(userid).getUsername());

        request.getRequestDispatcher("/personalPage.jsp").forward(request, response);
    }
}
