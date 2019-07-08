package zerox.dao;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import zerox.bean.MCGameRecord;
import zerox.bean.MCUserRecord;
import zerox.bean.MineCleaningHero;
import zerox.utils.C3P0Utils;

import java.util.List;

public class MineCleaningDao {
    private JdbcTemplate jdbcTemplate = new JdbcTemplate(C3P0Utils.getDataSource());

    public int newGameRecord(MCGameRecord mcGameRecord){
        int count = jdbcTemplate.update("insert into mc_game_record (userid,startTime) values(?,?)",mcGameRecord.getUserid(),mcGameRecord.getStartTime());
        if(count!=1) return -1;
        else{
            return jdbcTemplate.queryForObject("select * from mc_game_record where userid = ? AND startTime = ? ", new BeanPropertyRowMapper<>(MCGameRecord.class), mcGameRecord.getUserid(), mcGameRecord.getStartTime()).getMcgameid();
        }
    }

    public MCUserRecord findUserRecordById(int userid){
        MCUserRecord mcUserRecord = null;
        try {
            mcUserRecord = jdbcTemplate.queryForObject("select * from mc_user_record where userid = ?", new BeanPropertyRowMapper<>(MCUserRecord.class), userid);
        } catch (EmptyResultDataAccessException e) {
            System.out.println("用户User[userid="+userid+"]尚未进行过扫雷游戏");
            e.printStackTrace();
        }
        return mcUserRecord;
    }

    public MCGameRecord findGameRecordById(int gameid){
        MCGameRecord mcGameRecord = null;
        try {
            mcGameRecord = jdbcTemplate.queryForObject("select * from mc_game_record where mcgameid = ?", new BeanPropertyRowMapper<>(MCGameRecord.class), gameid);
        } catch (EmptyResultDataAccessException e) {
            System.out.println("游戏记录mcgameid="+gameid+"不存在");
            e.printStackTrace();
        }
        return mcGameRecord;
    }

    public int newUserRecord(int userid){
        return jdbcTemplate.update("insert into mc_user_record (userid) values(?)",userid);
    }

    public int updateUserRecord(MCUserRecord mcUserRecord){
        Object[] params = {mcUserRecord.getPlayedGame(),mcUserRecord.getWinGame(),mcUserRecord.getLoseGame(), mcUserRecord.getUnfinishedGame(), mcUserRecord.getWinRate(),mcUserRecord.getFastWinMillis(),mcUserRecord.getUserid()};
        return jdbcTemplate.update("update mc_user_record set playedGame = ? , winGame = ? , loseGame = ? , unfinishedGame = ? , winRate = ? , fastWinMillis = ? WHERE userid = ?", params);
    }

    public int updateGameRecord(MCGameRecord mcGameRecord) {
        Object[] params = {mcGameRecord.getStatus(),mcGameRecord.getGameTimeMillis(),mcGameRecord.getRestUndig(),mcGameRecord.getStartTime(),mcGameRecord.getMcgameid()};
        return jdbcTemplate.update("update mc_game_record set status = ? , gameTimeMillis = ? , restUndig = ? , startTime = ? WHERE mcgameid = ?", params);
    }

    public List<MineCleaningHero> queryAllPlayer(String sortBy) {
        String sqlOrderBy = "SELECT u.`userid` AS userid,username,playedGame,winGame,loseGame,unfinishedGame,winRate,fastWinMillis FROM USER AS u ,mc_user_record AS r WHERE u.`userid` = r.`userid`";
        if("mostPlay".equals(sortBy)){
            sqlOrderBy += " ORDER BY playedGame DESC";
        }else if("mostWin".equals(sortBy)){
            sqlOrderBy += " ORDER BY winGame DESC";
        }else if("highestWinRate".equals(sortBy)){
            sqlOrderBy += " ORDER BY winRate DESC";
        }else if("fastTime".equals(sortBy)){
            sqlOrderBy += " ORDER BY fastWinMillis";
        }
        return jdbcTemplate.query(sqlOrderBy, new BeanPropertyRowMapper<>(MineCleaningHero.class));
    }
}
