package com.dimple.test.killifelse;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

public class OperatorFactory {

    static Map<String, Operation> operationMap = new HashMap<>();

    static {
        operationMap.put("add", new Operation.OrdinaryOperation());
        operationMap.put("divide", new Operation.SilverOperation());
    }

    private OperatorFactory() {
    }

    private static class internalClass {
        private static final OperatorFactory o = new OperatorFactory();
    }

    public static OperatorFactory getInstance() {
        return internalClass.o;
    }

    public static Optional<Operation> getOperation(String operator) {
        return Optional.ofNullable(operationMap.get(operator));
    }

}
