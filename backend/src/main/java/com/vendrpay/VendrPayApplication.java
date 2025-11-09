package com.vendrpay;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class VendrPayApplication {

    public static void main(String[] args) {
        SpringApplication.run(VendrPayApplication.class, args);
        System.out.println("VendrPay Application Started Successfully!");
    }
}
