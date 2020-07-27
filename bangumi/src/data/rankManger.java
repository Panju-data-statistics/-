package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;




import chartClass.Rank;

public class rankManger {
	
	public List queryRank(){
		List lists = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		lists = new ArrayList();
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/anime","root","545811");
			
			
			stmt = conn.createStatement();
			
			 rs = stmt.executeQuery(""
			 		+ "SELECT title,"
			 		+ "((views / 1000 * 0.1)/ ep_num + coins * 0.3 + follow * 0.2 + reply * 0.1 + (danmakus * 0.05) / ep_num) as hot "
			 		+ "FROM ban "
			 		+ "ORDER BY ((views / 1000 * 0.1)/ ep_num + coins * 0.3 + follow * 0.2 + reply * 0.1 + (danmakus * 0.05) / ep_num) DESC");
		
			while(rs.next()){
				
				Rank rank = new Rank();
				
				String title = rs.getString("title");
				rank.setTitle(title);
				
				String hot = Integer.toString(Double.valueOf(rs.getDouble("hot")).intValue());
				rank.setHot(hot);
				
				//System.out.println(rank.getTitle());
				
				
				//gmv.setDt(rs.getString("dt"));
				
//				rank .setTitle("abc");
//				rank .setHot("9899");
//				
//				Rank rank1 = new Rank();
//				rank1.setTitle("ccc");
//				rank1.setHot("2345");
				
				
				//gmv.setGmvAmount(rs.getString("gmv_amount"));
				
				lists.add(rank);
				//lists.add(rank1);
				
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
		
		System.out.println(lists);
		return lists;
	}

}
