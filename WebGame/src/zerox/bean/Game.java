package zerox.bean;

public class Game {
    private Integer id;
    private String gameCHname;
    private String gameENname;
    private String gamedeveloper;
    private String gamepublisher;
    private String gamereleasedate;
    private String gamegenre;

    public Game() {
    }

    public Game(Integer id, String gameCHname, String gameENname, String gamedeveloper, String gamepublisher, String gamereleasedate, String gamegenre) {
        this.id = id;
        this.gameCHname = gameCHname;
        this.gameENname = gameENname;
        this.gamedeveloper = gamedeveloper;
        this.gamepublisher = gamepublisher;
        this.gamereleasedate = gamereleasedate;
        this.gamegenre = gamegenre;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getGameCHname() {
        return gameCHname;
    }

    public void setGameCHname(String gameCHname) {
        this.gameCHname = gameCHname;
    }

    public String getGameENname() {
        return gameENname;
    }

    public void setGameENname(String gameENname) {
        this.gameENname = gameENname;
    }

    public String getGamedeveloper() {
        return gamedeveloper;
    }

    public void setGamedeveloper(String gamedeveloper) {
        this.gamedeveloper = gamedeveloper;
    }

    public String getGamepublisher() {
        return gamepublisher;
    }

    public void setGamepublisher(String gamepublisher) {
        this.gamepublisher = gamepublisher;
    }

    public String getGamereleasedate() {
        return gamereleasedate;
    }

    public void setGamereleasedate(String gamereleasedate) {
        this.gamereleasedate = gamereleasedate;
    }

    public String getGamegenre() {
        return gamegenre;
    }

    public void setGamegenre(String gamegenre) {
        this.gamegenre = gamegenre;
    }

    @Override
    public String toString() {
        return "Game{" +
                "id=" + id +
                ", gameCHname='" + gameCHname + '\'' +
                ", gameENname='" + gameENname + '\'' +
                ", gamedeveloper='" + gamedeveloper + '\'' +
                ", gamepublisher='" + gamepublisher + '\'' +
                ", gamereleasedate=" + gamereleasedate +
                ", gamegenre='" + gamegenre + '\'' +
                '}';
    }
}
