package com.buba.wineparty1806;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.buba.wineparty1806.dao")
public class Wineparty1806Application {

    public static void main(String[] args) {
        SpringApplication.run(Wineparty1806Application.class, args);
    }

}
