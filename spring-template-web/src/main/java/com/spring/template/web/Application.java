package com.spring.template.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import tk.mybatis.spring.annotation.MapperScan;

@SpringBootApplication
@EnableAsync
@EnableTransactionManagement
@MapperScan("com.spring.template.web.dao")
@ComponentScan({"com.spring.template", "com.cw"})
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);

    }

}
