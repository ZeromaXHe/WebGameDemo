package zerox.web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;

@WebServlet(name = "BaseServlet")
public class BaseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            String action = request.getParameter("action");
            Class clazz = this.getClass();
            Method method = clazz.getDeclaredMethod(action,HttpServletRequest.class,HttpServletResponse.class);
            method.setAccessible(true);
            method.invoke(this, request, response);
        }catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
