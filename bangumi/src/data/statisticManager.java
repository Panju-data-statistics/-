package data;
import java.sql.Connection;
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
			/*Class.forName("com.mysql.jdbc.Driver");
		
			conn = DriverManager.getConnection("jdbc:mysql://192.168.52.110:3306/tclmall","root","123456");
			
			
			stmt = conn.createStatement();
			
			 rs = stmt.executeQuery("select * from  ads_gmv_sum_day");
			
			
			while(rs.next()){*/
				
				Statistic statistic = new Statistic();
				
				//gmv.setDt(rs.getString("dt"));
				
				statistic.setPeople("1233");
				statistic.setCoins("9899");
				statistic.setViews("123");
				statistic.setComment("33");
				statistic.setDanmakus("23232");
				statistic.setSerial("1233123");
				// Rank rank1 = new Rank();
				// rank1.setName("ccc");
				// rank1.setHot("2345");
				
				
				//gmv.setGmvAmount(rs.getString("gmv_amount"));
				
				lists.add(statistic);
				// lists.add(rank1);
				
			//}
			
			
			
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
