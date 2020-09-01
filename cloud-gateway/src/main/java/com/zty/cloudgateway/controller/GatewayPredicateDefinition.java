package com.zty.cloudgateway.controller;

import lombok.Data;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @ClassName GatewayPredicateDefinition
 * @Description TODO
 * @Author skcc
 * @Date 2020/7/31 11:52
 * @Version 1.0
 */
@Data
public class GatewayPredicateDefinition {
    //断言对应的Name
    private String name;
    //配置的断言规则
    private Map<String, String> args = new LinkedHashMap<>();
    //此处省略Get和Set方法
}