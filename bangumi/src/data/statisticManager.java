package data;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bangumi.statisticServlet;
import chartClass.Statistic;

public class statisticManager {
    public List queryStatistic(){
		List lists = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		lists = new ArrayList();
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/anime","root","545811");
			
			
			stmt = conn.createStatement();
			
			 rs = stmt.executeQuery("SELECT people,serial,coins,danmakus,comment,views FROM statistic");
			
			
			while(rs.next()){
				
				Statistic statistic = new Statistic();
				
				statistic.setPeople(rs.getString("people"));
				statistic.setSerial(rs.getString("serial"));
				statistic.setCoins(rs.getString("coins"));
				statistic.setDanmakus(rs.getString("danmakus"));
				statistic.setComment(rs.getString("comment"));
				statistic.setViews(rs.getString("views"));
				
				//gmv.setDt(rs.getString("dt"));
				
//				statistic .setPeople("1233");
//				statistic .setCoins("9899");
//				statistic.setCoins("22");
//				statistic.setComment("33");
//				statistic.setDanmakus("23232");
//				statistic.setSerial("1233123");
				// Rank rank1 = new Rank();
				// rank1.setName("ccc");
				// rank1.setHot("2345");
				
				
				//gmv.setGmvAmount(rs.getString("gmv_amount"));
				
				lists.add(statistic);
				// lists.add(rank1);
				
			}
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			/*
			try {
				rs.close();
			
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			*/
		}
		
		return lists;
	}
}
