package zerox.dao;

import org.springframework.jdbc.core.JdbcTemplate;
import zerox.bean.User;
import zerox.utils.C3P0Utils;

public class UserDao {
    public int save(User user) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(C3P0Utils.getDataSource());
        return jdbcTemplate.update("insert into user(username,password) values(?,?)",user.getUsername(),user.getPassword());
    }

    public int contains(User user) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(C3P0Utils.getDataSource());
        return jdbcTemplate.queryForList("select * FROM user where username=?",user.getUsername()).size();
    }
}
