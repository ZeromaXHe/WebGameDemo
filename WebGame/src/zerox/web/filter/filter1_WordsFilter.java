package zerox.web.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

@WebFilter("/*")
public class filter1_WordsFilter implements Filter {
    private List<String> words = new ArrayList<>();

    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        //处理敏感词

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        //创建一个request对象的包装类对象，包装类对getParameter方法进行增强
        MyRequest myRequest = new MyRequest(request, words);

        chain.doFilter(myRequest, response);
    }

    public void init(FilterConfig config) throws ServletException {
        //读取words.txt，把文件里的每一行，添加到words集合里
        InputStream is = null;
        BufferedReader reader = null;

        try {
            //1.获取ServletContext
            ServletContext context = config.getServletContext();
            //2.读取资源文件。 ServletContext是从web文件夹下读取的，方法的参数就写资源文件在web文件夹里的路径即可
            is = context.getResourceAsStream("WEB-INF/bannedWords.txt");
            //3.转换成字符流
            reader = new BufferedReader(new InputStreamReader(is, "utf-8"));
            //4.读取文件里每一行内容
            String line = null;
            while ((line = reader.readLine()) != null) {
                words.add(line);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            //5.关闭流
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

}
class MyRequest extends HttpServletRequestWrapper {
    private List<String> words = new ArrayList<>();

    public MyRequest(HttpServletRequest request) {
        super(request);
    }

    public MyRequest(HttpServletRequest request, List<String> words) {
        super(request);
        this.words = words;
    }

    @Override
    public String getParameter(String name) {
        String value = super.getParameter(name);
        if (value != null && !"".equals(value)) {
            for (String word : words) {
                //获取和敏感词汇相同数量的星号
                String starChar = getStarChar(word.length());
                value = value.replace(word, starChar);
            }
        }
        return value;
    }

    //大部分敏感词汇在10个以内，直接返回缓存的字符串
    public static String[] starArr={"*","**","***","****","*****","******"};

    /**
     * 生成n个星号的字符串
     * @param length
     * @return
     */
    private static String getStarChar(int length) {
        if (length <= 0) {
            return "";
        }
        //大部分敏感词汇在10个以内，直接返回缓存的字符串
        if (length <= 6) {
            return starArr[length - 1];
        }

        //生成n个星号的字符串
        char[] arr = new char[length];
        for (int i = 0; i < length; i++) {
            arr[i] = '*';
        }
        return new String(arr);
    }
}