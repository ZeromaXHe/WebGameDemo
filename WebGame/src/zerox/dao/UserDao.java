package zerox.dao;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
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
    public User login(String username, String password) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(C3P0Utils.getDataSource());
        User user = null;
        try {
            user = jdbcTemplate.queryForObject("select * from user where username = ? and password = ?", new BeanPropertyRowMapper<>(User.class), username, password);
        } catch (EmptyResultDataAccessException e) {
            System.out.println("找不到用户User[username="+username+", password="+password+"]");
            e.printStackTrace();
        }
        return user;
    }
}
