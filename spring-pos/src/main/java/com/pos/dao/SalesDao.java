package com.pos.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.sql.DataSource;
import com.pos.dto.Sales;
import com.pos.dto.Stock;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;

public class SalesDao {
	private Connection conn;
	private JdbcTemplate jdbcTemplate;
	
	public  SalesDao (DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	// 판매내역 삽입
	public void insertSold(String[] stockName, int[] amount, int[] price, String type) {
		String sql = "insert into SALES(stockName, amount, price, soldDate, type) values (?, ?, ?, ?, ?)";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date now = new Date();
		String soldDate = sdf.format(now);
		
		for(int i=0; i<stockName.length; i++) {
			this.jdbcTemplate.update(sql, stockName[i], amount[i], price[i], soldDate, type);
		}
	}
	
	//현재 재고 수량.
	public int getAmount(String stockName) {
		String sql = "select amount from STOCKS where stockName = ? ";
		return this.jdbcTemplate.queryForObject(sql,Integer.class, stockName);
	}
	
	// 재고 업데이트
	public void updateStock(String[] stockName, int[] amount) {
		String sql = "update STOCKS set amount = ? where stockName =? ";
		
		for(int i=0; i<stockName.length; i++) {
			int current = getAmount(stockName[i]);
			current -= amount[i];
			this.jdbcTemplate.update(sql,current,stockName[i]);
		}
	}
	
	// 판매내역 (시간 내림차순 - 가장 최근 것 부터)
	public List<Sales> salesHistory() {
		String sql = "select * from SALES order by soldDate DESC";
		List<Sales> results= this.jdbcTemplate.query(sql,
				new RowMapper<Sales>() {
					public Sales mapRow(ResultSet rs, int rowNum) throws SQLException {
						Sales sales = new Sales(
							rs.getString("stockName"),
							rs.getInt("amount"), 
							rs.getInt("price"),
							rs.getString("soldDate"),
							rs.getString("type"));
						return sales; 
					}
		});
		return results;
	}

	// 판매날짜별 리스트
	public List<Sales> findSoldDate(String findDate) {
		findDate = findDate + "%";
		String sql = "select * from SALES where soldDate LIKE ?";
		
		List<Sales> findList = this.jdbcTemplate.query(sql, 
					new RowMapper<Sales>() {
						public Sales mapRow(ResultSet rs, int rowNum) throws SQLException {
							Sales sales = new Sales(
								rs.getString("stockName"),
								rs.getInt("amount"), 
								rs.getInt("price"),
								rs.getString("soldDate"));
							return sales; 
						}
					},findDate);
				
		return findList; 
	}
	
	// 내림차순으로 가장 많이 팔린 제품 나열
	public List<Sales> groupByStock() {
		String sql ="select stockName, sum(amount)as 'amount', sum(price) as 'price' from sales Group By stockName order by amount DESC";
		List<Sales> list = this.jdbcTemplate.query(sql, 
				new RowMapper<Sales>() {
					public Sales mapRow(ResultSet rs, int rowNum) throws SQLException {
						Sales sales = new Sales(
							rs.getString("stockName"),
							rs.getInt("amount"), 
							rs.getInt("price"));
						return sales; 
					}
				});
			
	return list;
	}
	
}
