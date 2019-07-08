package zerox.service;

import zerox.bean.MCGameRecord;
import zerox.bean.MCUserRecord;
import zerox.bean.MineCleaningHero;
import zerox.dao.MineCleaningDao;

import java.util.List;

public class MineCleaningService {
    private MineCleaningDao mineCleaningDao = new MineCleaningDao();

    public int newGame(MCGameRecord mcGameRecord){
        int gameid = mineCleaningDao.newGameRecord(mcGameRecord);
        if(gameid == -1){
            return -1;
        }
        MCUserRecord mcUserRecord = mineCleaningDao.findUserRecordById(mcGameRecord.getUserid());
        if(mcUserRecord==null){
            mineCleaningDao.newUserRecord(mcGameRecord.getUserid());
        }
        else{
            mcUserRecord.setPlayedGame(mcUserRecord.getPlayedGame()+1);
            mcUserRecord.setUnfinishedGame(mcUserRecord.getUnfinishedGame()+1);
            mcUserRecord.setWinRate((float)(mcUserRecord.getWinGame())/(float)mcUserRecord.getPlayedGame());
            mineCleaningDao.updateUserRecord(mcUserRecord);
        }
        return gameid;
    }


    public void updateUnfinishedGame(int gameid, int restUndig) {
        MCGameRecord mcGameRecord = mineCleaningDao.findGameRecordById(gameid);
        mcGameRecord.setRestUndig(restUndig);
        mineCleaningDao.updateGameRecord(mcGameRecord);
    }

    public void endGame(int gameid, int restUndig, int gameTimeMillis) {
        MCGameRecord mcGameRecord = mineCleaningDao.findGameRecordById(gameid);
        mcGameRecord.setRestUndig(restUndig);
        if(restUndig==0) mcGameRecord.setStatus(1);
        else mcGameRecord.setStatus(2);
        mcGameRecord.setGameTimeMillis(gameTimeMillis);
        mineCleaningDao.updateGameRecord(mcGameRecord);

        MCUserRecord mcUserRecord = mineCleaningDao.findUserRecordById(mcGameRecord.getUserid());
        mcUserRecord.setUnfinishedGame(mcUserRecord.getUnfinishedGame()-1);
        if(restUndig==0) {
            mcUserRecord.setWinGame(mcUserRecord.getWinGame()+1);
            if(mcGameRecord.getGameTimeMillis()<mcUserRecord.getFastWinMillis()){
                mcUserRecord.setFastWinMillis(mcGameRecord.getGameTimeMillis());
            }
        }
        else mcUserRecord.setLoseGame(mcUserRecord.getLoseGame()+1);
        mcUserRecord.setWinRate((float)(mcUserRecord.getWinGame())/(float)mcUserRecord.getPlayedGame());
        mineCleaningDao.updateUserRecord(mcUserRecord);
    }

    public MCUserRecord findMCPlayer(int userid) {
        MCUserRecord mcUserRecord = mineCleaningDao.findUserRecordById(userid);
        return mcUserRecord;
    }

    public List<MineCleaningHero> queryAllPlayer(String sortBy) {
        return mineCleaningDao.queryAllPlayer(sortBy);
    }
}
