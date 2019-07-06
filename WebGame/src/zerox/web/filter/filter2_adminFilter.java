package zerox.web.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "filter2_adminFilter",urlPatterns = {"/updatePage.jsp"})
public class filter2_adminFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        String requestPath = request.getServletPath();
        System.out.println("用户请求页面："+requestPath);
        //判断用户是否登录
        HttpSession session = request.getSession();
        //没有登录，且访问页面不是登录也页面
        if(session.getAttribute("loginUser") == null||!"admin".equals(session.getAttribute("loginUser"))){
            //转发到登录页面
            request.getRequestDispatcher("/loginPage.jsp").forward(req,resp);
        }else{
            //放行
            chain.doFilter(req,resp);
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
