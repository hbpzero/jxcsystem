package com.jxc.jxcsystem;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
public class JxcsystemApplication {

    public static void main(String[] args) {
        SpringApplication.run(JxcsystemApplication.class, args);
    }

}
