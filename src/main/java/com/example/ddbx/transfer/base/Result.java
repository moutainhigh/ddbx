package com.example.ddbx.transfer.base;
/**操作结果集
 * @Description:TODO
 * @author:LiWang
 * @time:2018年8月2日
 */
public class Result {
    private boolean success = true;
    private String message = "";
    private Object data = null;
    public boolean isSuccess() {
        return success;
    }
    public void setSuccess(boolean success) {
        this.success = success;
    }
    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }
    public Object getData() {
        return data;
    }
    public void setData(Object data) {
        this.data = data;
    }
    @Override
    public String toString() {
        return "Result [success=" + success + ", message=" + message + ", data=" + data + "]";
    }

}
