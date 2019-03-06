package com.example.ddbx.tt.table;

import com.example.ddbx.tt.data.TtMap;
import com.example.ddbx.tt.tool.DbCtrl;
import javax.servlet.http.HttpServletRequest;

public class visual extends DbCtrl {
    public visual(){
        super("dd_icbc");
    }

    @Override
    public void doGetForm(HttpServletRequest request, TtMap post) {
        super.doGetForm(request, post);
    }
    @Override
    public void doPost(TtMap post, long id, TtMap result2){
        super.doPost(post, id, result2);
    }
}
