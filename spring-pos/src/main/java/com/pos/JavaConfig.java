package com.pos;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import com.pos.dao.SalesDao;
import com.pos.dao.StockDao;
import com.pos.dao.UserDao;
import com.pos.service.SalesService;
import com.pos.service.StockService;
import com.pos.service.UserService;

@Configuration
public class JavaConfig {
	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://localhost:3306/pointofsales?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8");
		dataSource.setUsername("root");
		dataSource.setPassword("1234");
		return dataSource;
	}
	@Bean
	public UserDao userDao() {
		return new UserDao(dataSource());
	}
	@Bean
	public UserService userService() {
		return new UserService(userDao());
	}
	@Bean
	public StockDao stockDao() {
		return new StockDao(dataSource());
	}
	@Bean 
	public StockService stockService() {
		return new StockService(stockDao());
	}
	@Bean 
	public SalesDao salesDao() {
		return new SalesDao(dataSource());
	}
	@Bean
	public SalesService salesService() {
		return new SalesService(salesDao());
	}
}
