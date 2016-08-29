package com.sting.security;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;

@EnableWebSecurity
public class SecConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	@Qualifier("UserAuthService")
	private UserDetailsService UserAuthService;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception
	{
		http
			.authorizeRequests()
			.antMatchers("/signupinput","/checkid").permitAll()
			.antMatchers("/**","/signupinput","/checkid").permitAll()
			.antMatchers("/admin").hasRole("ADMIN")
			.and()
			.formLogin()
			.loginPage("/login").permitAll() 
			.loginProcessingUrl("/login.do")
			.usernameParameter("id")
			.passwordParameter("password")	
			.successForwardUrl("/loginProcess.do")
			.and()
		.exceptionHandling()
			.accessDeniedPage("/insert")
			.and()
		.logout()
			.logoutSuccessUrl("/");
		//static 寃쎈줈
		http
			.authorizeRequests()
			.antMatchers("/css/**","/js/**").permitAll();
	}
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception
	{
		//UserAuthService瑜� �궗�슜�빐�꽌 �씤利앺븯�뒗�벏
		auth.userDetailsService(UserAuthService);	
		
		/*.jdbcAuthentication()
				.dataSource(dataSource)
				.usersByUsernameQuery(
						"select id,password from user where id=?"
				)
				.authoritiesByUsernameQuery(
						"select id,role from user where id=?"
				);
		*/		
	}
}
