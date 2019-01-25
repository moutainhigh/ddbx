package com.example.ddbx.controller;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.WebApplicationInitializer;

@ComponentScan(basePackages = {
	"com.example.ddbx.controller",
	"com.example.ddbx.tt.tool",
})
@SpringBootApplication
//ServletComponentScan只扫描启动类所在文件夹下的Servlet，故Druid的Servlet只能放到启动类的文件夹下
@ServletComponentScan
public class DemoApplication extends SpringBootServletInitializer implements WebApplicationInitializer {
	@Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(DemoApplication.class);
    }
	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}

}

