/*
 * @Description: 客户端UI控制类
 * @Author: tt
 * @Date: 2018-12-30 22:20:07
 * @LastEditTime: 2019-01-15 15:06:15
 * @LastEditors: tt
 */
package com.example.ddbx.tt.tool;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Ui {
    public String showOpt(String cn,long id) {
      return Tools.dicopt(cn, id);
    }
}