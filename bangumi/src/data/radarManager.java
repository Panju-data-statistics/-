package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import chartClass.Message;
public class radarManager {
	public List queryRadar(String str)
	{
		
		List lists = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		lists = new ArrayList();
		
		try {
//			Class.forName("com.mysql.jdbc.Driver");
//		
//			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/anime","root","545811");
//			
//			
//			stmt = conn.createStatement();
//			
//			 rs = stmt.executeQuery("SELECT company,fame FROM company LIMIT 0,3");
//			
//			
//			while(rs.next()){
//				
//			Message message =new Message();
//			message.setCoinsX(rs.getString("coinsX"));
//			message.setCommentX(rs.getString("commentX"));
//			message.setDanmakusX(rs.getString("danmakusX"));
//			message.setFollowX(rs.getString("followX"));
//			message.setViewsX(rs.getString("viewsX"));
//				
//			lists.add(message);
//				
//				
//			}
			Message message =new Message();
			message.setCoinsX("0.8");
			message.setDanmakusX("0.8");
			message.setCommentX("0.7");
			message.setFollowX("1.0");
			message.setViewsX("0.9");
			lists.add(message);
			
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
