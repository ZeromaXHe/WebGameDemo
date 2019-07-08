package zerox.service;

import zerox.bean.MCGameRecord;
import zerox.bean.MCUserRecord;
import zerox.dao.MineCleannningDao;

public class MineCleannningService {
    private MineCleannningDao mineCleannningDao = new MineCleannningDao();

    public int newGame(MCGameRecord mcGameRecord){
        int gameid = mineCleannningDao.newGameRecord(mcGameRecord);
        if(gameid == -1){
            return -1;
        }
        MCUserRecord mcUserRecord = mineCleannningDao.findUserRecordById(mcGameRecord.getUserid());
        if(mcUserRecord==null){
            mineCleannningDao.newUserRecord(mcGameRecord.getUserid());
        }
        else{
            mcUserRecord.setPlayedGame(mcUserRecord.getPlayedGame()+1);
            mcUserRecord.setUnfinishedGame(mcUserRecord.getUnfinishedGame()+1);
            mcUserRecord.setWinRate((float)(mcUserRecord.getWinGame())/(float)mcUserRecord.getPlayedGame());
            mineCleannningDao.updateUserRecord(mcUserRecord);
        }
        return gameid;
    }


    public void updateUnfinishedGame(int gameid, int restUndig) {
        MCGameRecord mcGameRecord = mineCleannningDao.findGameRecordById(gameid);
        mcGameRecord.setRestUndig(restUndig);
        mineCleannningDao.updateGameRecord(mcGameRecord);
    }

    public void endGame(int gameid, int restUndig, int gameTimeMillis) {
        MCGameRecord mcGameRecord = mineCleannningDao.findGameRecordById(gameid);
        mcGameRecord.setRestUndig(restUndig);
        if(restUndig==0) mcGameRecord.setStatus(1);
        else mcGameRecord.setStatus(2);
        mcGameRecord.setGameTimeMillis(gameTimeMillis);
        mineCleannningDao.updateGameRecord(mcGameRecord);

        MCUserRecord mcUserRecord = mineCleannningDao.findUserRecordById(mcGameRecord.getUserid());
        mcUserRecord.setUnfinishedGame(mcUserRecord.getUnfinishedGame()-1);
        if(restUndig==0) {
            mcUserRecord.setWinGame(mcUserRecord.getWinGame()+1);
            if(mcGameRecord.getGameTimeMillis()<mcUserRecord.getFastWinMillis()){
                mcUserRecord.setFastWinMillis(mcGameRecord.getGameTimeMillis());
            }
        }
        else mcUserRecord.setLoseGame(mcUserRecord.getLoseGame()+1);
        mcUserRecord.setWinRate((float)(mcUserRecord.getWinGame())/(float)mcUserRecord.getPlayedGame());
        mineCleannningDao.updateUserRecord(mcUserRecord);
    }
}
