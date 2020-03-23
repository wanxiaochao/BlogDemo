package com.dimple.test.tactful;

import com.dimple.test.map.HashMap;
import com.dimple.test.map.Map;

public class TactfulFactory {

    private static Map<String, TactfulInterface> tactfulInterfaceMap;

    static {
        tactfulInterfaceMap = new HashMap<>();
        tactfulInterfaceMap.put("t1", new Tactful1());
        tactfulInterfaceMap.put("t2", new Tactful2());
        tactfulInterfaceMap.put("t3", new Tactful3());
        tactfulInterfaceMap.put("t4", new Tactful4());
    }

    public TactfulFactory() {
    }

    public static TactfulInterface getTactfulInterface(String type) {
        return tactfulInterfaceMap.get(type);
    }

}
