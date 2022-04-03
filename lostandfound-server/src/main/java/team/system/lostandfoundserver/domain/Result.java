package team.system.lostandfoundserver.domain;

import org.springframework.stereotype.Component;
import java.util.ArrayList;

/**
 * @ClassName: Result
 * @Description:
 * @Author: Jason
 * @Date: 2022/2/14 3:39 下午
 * @Version: 1.0
 */
@Component
public class Result {
    private String code;
    private String msg;
    private ArrayList<Object> data;

    public Result() {}
    public Result(ArrayList<Object> data) {
        this.data = data;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<Object> getData() {
        return data;
    }

    public void setData(ArrayList<Object> data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "Result{" +
                "code='" + code + '\'' +
                ", msg='" + msg + '\'' +
                ", data=" + data +
                '}';
    }

    public static Result success(ArrayList<Object> data){
        Result result = new Result(data);
        result.setCode("200");
        result.setMsg("success");
        return  result;
    }

    public static Result error(String code,String msg){
        Result result = new Result();
        result.setCode(code);
        result.setMsg(msg);
        return  result;
    }

}
