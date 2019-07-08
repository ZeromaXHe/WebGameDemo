package zerox.web.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebFilter(filterName = "filter3_referrerFilter", urlPatterns = {"/game","/download","*.txt","*.jpg","*.pdf","*.png","*.gif"})
public class filter3_referrerFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        //获取请求头referer
        String referer = request.getHeader("referer");
        //如果请求头referer存在，且请求来源于正规服务器的download.jsp页面的话
        if(referer==null || !(referer.contains("localhost:8080")||referer.contains("192.168."))){
            //请求来源于盗链者服务器的download.jsp页面的话
            PrintWriter writer = response.getWriter();
            writer.write("这是盗链！请从正常访问途径访问：");
            writer.write(" <a role=\"button\" class=\"btn btn-primary\"  href=\"/index.jsp\">首页</a>");
            writer.flush();
            writer.close();
        }
        else chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
