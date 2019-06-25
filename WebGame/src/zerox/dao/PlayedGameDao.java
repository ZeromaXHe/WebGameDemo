package zerox.dao;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import zerox.bean.Game;
import zerox.utils.C3P0Utils;

import java.util.List;

public class PlayedGameDao {
    private JdbcTemplate jdbcTemplate = new JdbcTemplate(C3P0Utils.getDataSource());

    public List<Game> queryAll() {
        return jdbcTemplate.query("select * from games", new BeanPropertyRowMapper<>(Game.class));
    }
}
