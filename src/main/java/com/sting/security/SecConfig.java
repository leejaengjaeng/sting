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
			.antMatchers("/").permitAll()
			.antMatchers("/admin").hasRole("ADMIN")
			.and()
		.formLogin()
			/*
			 	�씤利앹씠 �븘�슂�븳 怨녹뿉 �젒洹쇳븷�븣 login �럹�씠吏�瑜� �굹���깂
			 	�븘�옒 寃쎌슦�뿉 
			 	�씤利� �떎�뙣�떆 /login?error 濡� 由щ떎�씠�젆�듃
			 	濡쒓렇�븘�썐 �떆 /login?logout �쑝濡� 由щ떎�씠�젆�듃 
			 	�씪怨좏븯�뒗�뜲 �씠�긽�븳�벏 
			*/
			.loginPage("/login").permitAll() // /login�뿉 ���븳 �젒洹쇱� 紐⑤몢�뿉寃� �뿀�슜  
			//�씠 寃쎈줈濡� �젒洹쇳븯硫� 濡쒓렇�씤 泥섎━瑜� �궡遺��쟻�쑝濡� �븯�뒗寃껋씤媛�...
			//�씠 寃쎈줈濡� �젒洹쇳븯硫� AuhenticationManagerBuilder濡� �씤利앹쓣 �븯�뒗寃껋씤媛�.. 
			.loginProcessingUrl("/login.do")
			.usernameParameter("id")
			.passwordParameter("password")	
			.successForwardUrl("/loginProcess.do")
			.and()
		.logout()
			.logoutUrl("/logout")
			.logoutSuccessUrl("/login");
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
