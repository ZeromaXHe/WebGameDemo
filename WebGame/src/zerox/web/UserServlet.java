package zerox.web;

import com.fasterxml.jackson.databind.ObjectMapper;
import zerox.bean.ResultInfo;
import zerox.bean.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UserServlet",urlPatterns = "/user")
public class UserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获得请求的标识符
        String action = request.getParameter("action");
        //System.out.println(action);
        if ("getLoginUserData".equals(action)) {
            getLoginUserData(request, response);
        }else if("logout".equals(action)){
            logout(request,response);
        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        response.sendRedirect(request.getContextPath()+"/index.jsp");
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
        if(user==null){
            //用户没有登录，直接存储false状态，代表获取数据失败
            resultInfo = new ResultInfo(false);
        }else{
            //用户有登录数据，状态为true,并且存储登录的数据进行返还
            resultInfo = new ResultInfo(true, user, null);
        }
        //将返回数据转换为json
        String jsonData = new ObjectMapper().writeValueAsString(resultInfo);
        //System.out.println(jsonData);
        //返回给浏览器
        response.getWriter().write(jsonData);
    }
}
