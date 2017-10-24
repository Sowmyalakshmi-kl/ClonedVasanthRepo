package com.ynr.prd.viewer;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;

@SpringBootApplication
public class EPubViewerBootApplication extends SpringBootServletInitializer {
	public static void main(String[] args) {
		SpringApplication.run(EPubViewerBootApplication.class, args);
	}

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(EPubViewerBootApplication.class);
	}
}
