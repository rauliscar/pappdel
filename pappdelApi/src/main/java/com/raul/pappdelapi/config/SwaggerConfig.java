package com.raul.pappdelapi.config;

import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@Configuration
@EnableWebMvc
public class SwaggerConfig {

    @Bean
    public OpenAPI customOpenAPI() {
        return new OpenAPI()
                .components(new Components())
                .info(new Info().title("API PAPPDEL")
                        .description("API REST aplicación pádel")
                        .contact(new Contact()
                                .name("Raul")
                                .email("raul@raul.com")
                                .url("https://raul.com"))
                        .version("1.0"));
    }
}

