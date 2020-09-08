package com.spring.template.api;

import org.springframework.web.bind.annotation.GetMapping;

/**
 * @Author C.W
 * @Date 2020/9/7 19:00
 * @Description api接口
 */
public interface TemplateApi {

    @GetMapping("/test.ajax")
    void test();

}
