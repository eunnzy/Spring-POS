package com.pos.dao;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;
import javax.sql.*;
import org.springframework.jdbc.core.*;

import com.pos.dto.User;

public class UserDao {
	private Connection conn;
	private JdbcTemplate jdbcTemplate;

	public UserDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	// 회원가입시 DB에 데이터 삽입.
	public void register(User user) {
		String sql = "insert into USER (userId, userPw, userName, userPhone ,userType) values (?, ?, ?, ?, ?)";
		this.jdbcTemplate.update(sql,user.getUserId(),user.getUserPw(),user.getUserName(),user.getUserPhone(),user.getUserType());
	}
	//로그인
	public User login(String userId, String userPw) {
		String sql = "select * from USER where userId = ? and userPw = ?";
		List<User> results= this.jdbcTemplate.query(sql,
									new RowMapper<User>() {
										public User mapRow(ResultSet rs, int rowNum) throws SQLException {
											User user = new User(
												rs.getString("userId"),
												rs.getString("userPw"),
												rs.getString("userName"), 
												rs.getString("userPhone"),
												rs.getString("userType"));
											return user; 
										}
									}, userId, userPw);
		return results.isEmpty() ? null : results.get(0);
	}
	// id 중복체크
	public int idCheck(String userId) {
		String sql = "select count(*) from USER where userId = ?";
		int count = this.jdbcTemplate.queryForObject(sql, Integer.class, userId);
		
		return count;
	}
	// 비밀번호 변경 업데이트
	public int changePw(String userId, String userPw) {
		String sql = "update USER set userPw = ? where userId = ? ";
		int result = this.jdbcTemplate.update(sql, userPw, userId);
		System.out.println(result);
		return result;
	}
	
}
