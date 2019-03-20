package com.example.ddbx.tt.utils;

import com.example.ddbx.tt.data.TtMap;

import java.util.Map;
import java.util.Set;

public class MapUtil {

    /**
     * map null值替换""
     * @param map
     * @return
     */
    public static TtMap nullToEmpty(TtMap map) {
        Set<String> set = map.keySet();
        if(set != null && !set.isEmpty()) {
            for(String key : set) {
                if(map.get(key) == null) { map.put(key, ""); }
            }
        }
        return map;
    }

}
