package zerox.service;

import zerox.bean.Game;
import zerox.dao.PlayedGameDao;

import java.util.List;

public class PlayedGameService {
    private PlayedGameDao dao = new PlayedGameDao();

    public List<Game> queryAll() {
        return dao.queryAll();
    }

    public boolean add(Game game) {
        int count = dao.add(game);
        return count > 0;
    }

    public boolean delete(String id) {
        int count = dao.delete(id);
        return count>0;
    }

    public Game findGame(String id) {
        return dao.findGame(id);
    }

    public boolean edit(Game game) {
        int count = dao.edit(game);
        return count>0;
    }
}
