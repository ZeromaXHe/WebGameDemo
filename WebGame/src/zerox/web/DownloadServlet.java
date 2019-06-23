package zerox.web;

import sun.misc.BASE64Encoder;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.Base64;

@WebServlet(name = "DownloadServlet", urlPatterns = "/download")
public class DownloadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        //获取请求头referer
        String referer = request.getHeader("referer");
        //如果请求头referer存在，且请求来源于正规服务器的download.jsp页面的话
        if(referer==null || !referer.equals("http://localhost:8080/downloadPage.jsp")){
            //请求来源于盗链者服务器的download.jsp页面的话
            PrintWriter writer = response.getWriter();
            writer.write("这是盗链，不可以下载");
            writer.flush();
            writer.close();
        }
        else {
            //1 获取要下载的文件名称
            String fileName = request.getParameter("fileName");
            System.out.println(fileName);
            //2 加载当前文件
            // 注意：需要动态的获取当前文件的目录位置（即使服务器所在目录发生变化，我也可以获取到准确位置）
            // 我们需要使用servletContext，获取资源路径
            ServletContext context = getServletContext();
            String realPath = context.getRealPath("/files");
            File file = new File(realPath, fileName);
            //3 处理中文文件名乱码问题
            //获得浏览器信息,根据不同的浏览器处理下载文件名
            // 火狐浏览器,采用Base64编码
            // 其他浏览器参数 Unicode编码
            String agent = request.getHeader("user-agent");
            if (agent.contains("Firefox")) {
                // 火狐浏览器
                fileName = base64EncodeFileName(fileName);
            } else {
                // IE，其他浏览器
                fileName = URLEncoder.encode(fileName, "UTF-8");
            }
            //4 提示浏览器，以下载的方式，获取服务器资源
            //响应消息头设置：
            //Content‐Disposition 设置要被下载的文件名        response.setHeader("content‐disposition", "attachment;filename=" + fileName);
            response.setHeader("content-disposition", "attachment;filename=" + fileName);
            //Content‐Type 设置文件媒体格式 getMimeType：1.txt 2.jpg 获取文件的后缀名
            response.setContentType(getServletContext().getMimeType(fileName) + ";charset=UTF-8");
            //5 将指定文件使用IO技术，向浏览器输出
            FileInputStream in = new FileInputStream(file);
            ServletOutputStream out = response.getOutputStream();
            //6 标准IO代码
            byte[] buf = new byte[1024];
            int len = -1;
            while ((len = in.read(buf)) != -1) {
                out.write(buf, 0, len);
            }
            in.close();
        }
    }

    public static String base64EncodeFileName(String fileName) {
        BASE64Encoder base64Encoder = new BASE64Encoder();
        try {
            return "=?UTF-8?B?"
                    + new String(base64Encoder.encode(fileName
                    .getBytes("UTF-8"))) + "?=";
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}

