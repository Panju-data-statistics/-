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
			
			 rs = stmt.executeQuery("SELECT title,hot FROM rank LIMIT 0,10");
		
			while(rs.next()){
				
				Rank rank = new Rank();
				
				String title = rs.getString("title");
				rank.setTitle(title);
				
				String hot = rs.getString("hot");
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
		
		//System.out.println(lists);
		return lists;
	}

}
