package zerox.bean;

public class MineCleaningHero {
    private int userid;
    private String username;
    private int playedGame;
    private int winGame;
    private int loseGame;
    private int unfinishedGame;
    private float winRate;
    private int fastWinMillis;

    public MineCleaningHero() {
    }

    public MineCleaningHero(int userid, String username, int playedGame, int winGame, int loseGame, int unfinishedGame, float winRate, int fastWinMillis) {
        this.userid = userid;
        this.username = username;
        this.playedGame = playedGame;
        this.winGame = winGame;
        this.loseGame = loseGame;
        this.unfinishedGame = unfinishedGame;
        this.winRate = winRate;
        this.fastWinMillis = fastWinMillis;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getPlayedGame() {
        return playedGame;
    }

    public void setPlayedGame(int playedGame) {
        this.playedGame = playedGame;
    }

    public int getWinGame() {
        return winGame;
    }

    public void setWinGame(int winGame) {
        this.winGame = winGame;
    }

    public int getLoseGame() {
        return loseGame;
    }

    public void setLoseGame(int loseGame) {
        this.loseGame = loseGame;
    }

    public int getUnfinishedGame() {
        return unfinishedGame;
    }

    public void setUnfinishedGame(int unfinishedGame) {
        this.unfinishedGame = unfinishedGame;
    }

    public float getWinRate() {
        return winRate;
    }

    public void setWinRate(float winRate) {
        this.winRate = winRate;
    }

    public int getFastWinMillis() {
        return fastWinMillis;
    }

    public void setFastWinMillis(int fastWinMillis) {
        this.fastWinMillis = fastWinMillis;
    }

    @Override
    public String toString() {
        return "MineCleaningHero{" +
                "userid=" + userid +
                ", username='" + username + '\'' +
                ", playedGame=" + playedGame +
                ", winGame=" + winGame +
                ", loseGame=" + loseGame +
                ", unfinishedGame=" + unfinishedGame +
                ", winRate=" + winRate +
                ", fastWinMillis=" + fastWinMillis +
                '}';
    }
}
