package zerox.bean;

import java.sql.Timestamp;

public class MCGameRecord {
    private int mcgameid;
    private int userid;
    private int status;
    private int gameTimeMillis;
    private int restUndig;
    private Timestamp startTime;

    public MCGameRecord() {
    }

    public MCGameRecord(int mcgameid, int userid, int status, int gameTimeMillis, int restUndig, Timestamp startTime) {
        this.mcgameid = mcgameid;
        this.userid = userid;
        this.status = status;
        this.gameTimeMillis = gameTimeMillis;
        this.restUndig = restUndig;
        this.startTime = startTime;
    }

    public int getMcgameid() {
        return mcgameid;
    }

    public void setMcgameid(int mcgameid) {
        this.mcgameid = mcgameid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getGameTimeMillis() {
        return gameTimeMillis;
    }

    public void setGameTimeMillis(int gameTimeMillis) {
        this.gameTimeMillis = gameTimeMillis;
    }

    public int getRestUndig() {
        return restUndig;
    }

    public void setRestUndig(int restUndig) {
        this.restUndig = restUndig;
    }

    public Timestamp getStartTime() {
        return startTime;
    }

    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    @Override
    public String toString() {
        return "MCGameRecord{" +
                "mcgameid=" + mcgameid +
                ", userid=" + userid +
                ", status=" + status +
                ", gameTimeMillis=" + gameTimeMillis +
                ", restUndig=" + restUndig +
                ", startTime=" + startTime +
                '}';
    }
}
