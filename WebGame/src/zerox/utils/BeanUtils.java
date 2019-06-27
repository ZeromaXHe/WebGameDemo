package zerox.utils;

import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;

public class BeanUtils {
    /**
     * 封装实体<br>
     * 再次封装BeanUtils.populate方法，提供更简单的操作<br/>
     * 使用示例：<br>
     * User user = BeanUtil.populate(map, User.class);
     *
     * @param properties Map keyed by property name, with the corresponding (String or String[]) value(s) to be set
     * @param clazz      The class of JavaBean whose properties are being populated
     * @return 封装后的JavaBean实例
     */
    public static <T> T populate(Map<?, ?> properties, Class<T> clazz) {
        T instance = null;
        try {
            instance = clazz.newInstance();
            org.apache.commons.beanutils.BeanUtils.populate(instance, properties);
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        }
        return instance;
    }

}
