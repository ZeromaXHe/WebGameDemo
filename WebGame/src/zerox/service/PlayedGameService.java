package zerox.service;

import zerox.bean.Game;
import zerox.dao.PlayedGameDao;

import java.util.List;

public class PlayedGameService {
    private PlayedGameDao dao = new PlayedGameDao();

    public List<Game> queryAll() {
        return dao.queryAll();
    }
}
