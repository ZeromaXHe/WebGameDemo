package zerox.dao;

import org.springframework.dao.EmptyResultDataAccessException;
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

    public int add(Game game) {
        Object[] params = {game.getGameCHname(), game.getGameENname(), game.getGamedeveloper(), game.getGamepublisher(), game.getGamereleasedate(), game.getGamegenre()};
        return jdbcTemplate.update("INSERT INTO games (gameCHname,gameENname,gamedeveloper,gamepublisher,gamereleasedate,gamegenre) VALUES (?,?,?,?,?,?)",params);
    }

    public int delete(String id) {
        return jdbcTemplate.update("delete from games where id = ?", id);
    }

    public Game findGame(String id) {
        Game game = null;
        try {
            game = jdbcTemplate.queryForObject("select * from games where id = ?", new BeanPropertyRowMapper<>(Game.class), id);
        } catch (EmptyResultDataAccessException e) {
            e.printStackTrace();
        }
        return game;
    }

    public int edit(Game game) {
        Object[] params = {game.getGameCHname(), game.getGameENname(), game.getGamedeveloper(), game.getGamepublisher(), game.getGamereleasedate(), game.getGamegenre(), game.getId()};
        return jdbcTemplate.update("update games set gameCHname = ?, gameENname = ?, gamedeveloper = ?, gamepublisher = ?, gamereleasedate = ?, gamegenre = ? WHERE id = ?", params);
    }

    public List<Game> findByPage(int index, int pageSize) {
        return jdbcTemplate.query("select * from games limit ?,?", new BeanPropertyRowMapper<>(Game.class), index, pageSize);
    }

    public int getTotalCount() {
        return jdbcTemplate.queryForObject("select count(*) from games", Integer.class);
    }

    public List<Game> findByPageAndWord(int index, int pageSize, String trim, String[] rangeStrs) {
        String insert = formSearchWordSql(trim,rangeStrs);
        return jdbcTemplate.query("select * from games WHERE "+insert+" limit ?,?", new BeanPropertyRowMapper<>(Game.class), index, pageSize);
    }

    public int getTotalCountWithWord(String trim, String[] rangeStrs) {
        String insert = formSearchWordSql(trim,rangeStrs);
        return jdbcTemplate.queryForObject("select count(*) from games WHERE "+insert, Integer.class);
    }

    private String formSearchWordSql(String trim, String[] rangeStrs){
        StringBuilder sb = new StringBuilder();
        for(int i=0;i<rangeStrs.length;i++){
            if(i>0) sb.append(" or ");
            sb.append(rangeStrs[i]);
            sb.append(" like \"%");
            sb.append(trim);
            sb.append("%\"");
        }
        return sb.toString();
    }
}
