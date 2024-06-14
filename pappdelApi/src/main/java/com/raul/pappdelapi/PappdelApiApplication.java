package com.raul.pappdelapi;

//import com.raul.pappdelapi.security.JWTAuthorizationFilter;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
/*import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfiguration;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;*/

@SpringBootApplication
public class PappdelApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(PappdelApiApplication.class, args);
	}

	/*
	@EnableWebSecurity
	@Configuration
	class WebSecurityConfig extends WebSecurityConfiguration {
		@Override
		protected void configure(HttpSecurity http) throws Exception {
			http.csrf().disable()
					.addFilterAfter(new JWTAuthorizationFilter(), UsernamePasswordAuthenticationFilter.class)
					.authorizeRequests()
					.antMatchers(HttpMethod.POST, "/user").permitAll()
					.anyRequest().authenticated();
		}
	}
	 */
}
