package com.zty.cloudgateway.controller;

import lombok.Data;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @ClassName GatewayFilterDefinition
 * @Description TODO
 * @Author skcc
 * @Date 2020/7/31 11:51
 * @Version 1.0
 */
@Data
public class GatewayFilterDefinition {
    //Filter Name
    private String name;
    //对应的路由规则
    private Map<String, String> args = new LinkedHashMap<>();
}