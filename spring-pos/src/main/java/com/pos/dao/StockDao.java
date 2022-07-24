package com.pos.dao;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.sql.*;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import com.pos.dto.Stock;
import com.pos.dto.User;

public class StockDao {
	private Connection conn;
	private JdbcTemplate jdbcTemplate;
	
	public StockDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	// 모든 제품 리스트 출력
	public List<Stock> allStockList() {
			String sql = "select * from stocks";   // available = 1-> 판매가능한 재고
			List<Stock> results= this.jdbcTemplate.query(sql,
					new RowMapper<Stock>() {
						public Stock mapRow(ResultSet rs, int rowNum) throws SQLException {
							Stock stock = new Stock(
								rs.getString("stockId"),
								rs.getString("stockName"),
								rs.getInt("amount"), 
								rs.getInt("price"),
								rs.getString("regDate"),
								rs.getInt("available"));
							return stock; 
						}
			});
			return results;
	}

	// 판매 가능한 제품 리스트 출력
	public List<Stock> stockAvailableList() {
		String sql = "select * from stocks where (amount > 0 and available = 1)";   // 제품 수량 > 0 and available = 1-> 판매가능한 재고
		
		List<Stock> results= this.jdbcTemplate.query(sql,
				new RowMapper<Stock>() {
					public Stock mapRow(ResultSet rs, int rowNum) throws SQLException {
						Stock stock = new Stock(
							rs.getString("stockId"),
							rs.getString("stockName"),
							rs.getInt("amount"), 
							rs.getInt("price"),
							rs.getString("regDate"),
							rs.getInt("available"));
						return stock; 
					}
		});
		return results;
	}

	//새로운 제품 추가
	public void addNewStock(Stock stock) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		stock.setRegDate(sdf.format(now));
		String sql = "insert into stocks (stockId, stockName, amount, price, regdate) values (?, ?, ?, ?, ?)";
		
		this.jdbcTemplate.update(sql, stock.getStockId(), stock.getStockName(), stock.getAmount(), stock.getPrice(), stock.getRegDate()); 
	}
	// 제품 수정
	public void modifyStock(Stock stock) {
		String sql = "update STOCKS set amount = ? , price = ?, regDate = ? where stockId = ?";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		stock.setRegDate(sdf.format(now));
		
		this.jdbcTemplate.update(sql,stock.getAmount(), stock.getPrice(), stock.getRegDate(), stock.getStockId());
	}
	// 현재 재고 수량
	public int currentAmount(String stockId) {
		String sql ="select amount from STOCKS where stockId = ?";
		return this.jdbcTemplate.queryForObject (sql, Integer.class, stockId);
	}
	// 제품 개수 추가
	public void addStock(String stockId, int amount) {
		String sql = "update STOCKS set amount = ?, regDate = ? where stockId = ?";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		int current = currentAmount(stockId);
		current += amount;
		
		this.jdbcTemplate.update(sql, current, sdf.format(now), stockId);
	}
	
	// 판매 상태 -- > 불가로 변경 (불가 -> available = 0)
	public void deleteStock(String stockId) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		int available = 0;
		
		String sql = "update STOCKS set regDate = ?, available = ? where stockId = ?";
		this.jdbcTemplate.update (sql,  sdf.format(now), available, stockId);

	}
	// 판매 상태 -- > 가능으로 변경 (가능 -> available = 1)
	public void availableStock(String stockId) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		int available = 1;
		String sql = "update STOCKS set regDate = ?, available = ? where stockId = ?";
		this.jdbcTemplate.update (sql, sdf.format(now), available,stockId);

	}
	// 중복된 아이디 있는지 체크 
	public int stockIdCheck(String stockId) {
		String sql = "select count(*) from STOCKS where stockId = ?";
		int count = this.jdbcTemplate.queryForObject (sql, Integer.class, stockId);
		return count;
	}
}
