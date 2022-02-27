package com.example.springboot.domain;

/**
 * @ClassName: Result
 * @Description:
 * @Author: Jason
 * @Date: 2022/2/14 3:39 下午
 * @Version: 1.0
 */
public class Result<T> {
    private String code;
    private String msg;
    private T data;

    public Result() {}
    public Result(T data) {
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

    public T getData() {
        return data;
    }

    public void setData(T data) {
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

    public static Result success(){
        Result result = new Result();
        result.setCode("200");
        result.setMsg("success");
        return result;
    }
    public static <T> Result<T> success(T data){
        Result<T> result = new Result<>(data);
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
