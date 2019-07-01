package zerox.service;

import zerox.bean.Game;
import zerox.bean.GamePage;
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

    public GamePage<Game> findByPage(int pageNumber, int pageSize) {
        GamePage<Game> gamePageBean = new GamePage<Game>();
        //1. 当前页码对应的数据集合List<Game>
        int index = (pageNumber - 1) * pageSize;
        List<Game> gameList = dao.findByPage(index, pageSize);
        gamePageBean.setData(gameList);

        //2. 当前页码
        gamePageBean.setPageNumber(pageNumber);

        //3. 总共分了多少页
        int totalCount = dao.getTotalCount();
        int pageCount = (int) Math.ceil(totalCount * 1.0 / pageSize);
        gamePageBean.setPageCount(pageCount);

        return gamePageBean;
    }

    public GamePage<Game> findByPageAndWord(int pageNumber, int pageSize, String trim, String[] rangeStrs) {
        GamePage<Game> gamePageBean = new GamePage<>();
        //1. 当前页码对应的数据集合List<Game>
        int index = (pageNumber - 1) * pageSize;
        List<Game> gameList = dao.findByPageAndWord(index, pageSize, trim, rangeStrs);
        gamePageBean.setData(gameList);

        //2. 当前页码
        gamePageBean.setPageNumber(pageNumber);

        //3. 总共分了多少页
        int totalCount = dao.getTotalCountWithWord(trim, rangeStrs);
        int pageCount = (int) Math.ceil(totalCount * 1.0 / pageSize);
        gamePageBean.setPageCount(pageCount);

        StringBuilder sb = new StringBuilder();
        for(String range: rangeStrs){
            if(range!=null&&!"".equals(range)){
                sb.append("&range=");
                sb.append(range);
            }
        }
        gamePageBean.setRangestrs(sb.toString());

        return gamePageBean;
    }
}
