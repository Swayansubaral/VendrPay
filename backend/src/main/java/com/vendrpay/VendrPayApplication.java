package com.vendrpay;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class VendrPayApplication implements CommandLineRunner {

    @Value("${server.port}")
    private String serverPort;

    @Value("${spring.datasource.url}")
    private String dbUrl;

    public static void main(String[] args) {
        SpringApplication.run(VendrPayApplication.class, args);
        System.out.println("\n VendrPay Application Started Successfully!\n");
    }

    @Override
    public void run(String... args) {
        System.out.println("==============================================");
        System.out.println(" VendrPay Status");
        System.out.println("==============================================");
        System.out.println(" ▶ Server running on port: " + serverPort);
        System.out.println(" ▶ Connected DB URL:      " + dbUrl);
        System.out.println(" ▶ Active Profile:        default");
        System.out.println("==============================================\n");
    }
}
