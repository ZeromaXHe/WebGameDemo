package zerox.bean;

import java.io.Serializable;

/**
 * 用于封装后端返回前端数据对象。对应json格式：
 * {"ok":true, "data":{结果数据}, "msg":"消息描述"}
 */
public class ResultInfo implements Serializable{
    private boolean ok;//后端返回结果正常为true，发生异常返回false
    private Object data;//后端返回结果数据对象
    private String msg;//描述消息。如果不正常，就是错误信息

    //无参构造方法
    public ResultInfo() {
    }

    /**
     * @param ok 是否正常处理完成
     */
    public ResultInfo(boolean ok) {
        this.ok = ok;
    }

    /**
     * @param ok 是否正常处理
     * @param data 处理结果数据
     */
    public ResultInfo(boolean ok, Object data) {
        this.ok = ok;
        this.data = data;
    }

    /**
     * @param ok 是否正常处理
     * @param msg  消息描述
     */
    public ResultInfo(boolean ok, String msg) {
        this.ok = ok;
        this.msg = msg;
    }

    /**
     * @param ok 是否正常处理
     * @param data 返回数据
     * @param msg  消息描述
     */
    public ResultInfo(boolean ok, Object data, String msg) {
        this.ok = ok;
        this.data = data;
        this.msg = msg;
    }

    public boolean isOk() {
        return ok;
    }

    public void setOk(boolean ok) {
        this.ok = ok;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
