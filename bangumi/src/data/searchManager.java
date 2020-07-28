package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import chartClass.Message;


public class searchManager {
	public Message  querySearch(final String str){
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		// lists = new ArrayList();
		Message message = new Message();
		try {
			
// 			 Class.forName("com.mysql.jdbc.Driver");
		
// 			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/anime","root","545811");
			
			
// 			 stmt = conn.createStatement();
			
// 			  rs = stmt.executeQuery("SELECT * from message WHERE title = '鬼灭之刃'");
		
// // 			  while(rs.next())
// // 			  {
// // 				  //System.out.println(rs.getString("title"));
					
// 					message.setTitle(rs.getString("title"));
// 					message.setCover(rs.getString("cover"));
// 					message.setIntro(rs.getString("intro"));
// 					message.setScore(rs.getString("score"));
// 					message.setIs_finish(rs.getString("is_finish"));
// 					message.setTag(rs.getString("tag"));

// 					message.setCoinsX(rs.getString("coinsX"));
// 					message.setDanmakusX(rs.getString("danmakusX"));
// 					message.setCommentX(rs.getString("commentX"));
// 					message.setFollowX(rs.getString("followX")); 
					// message.setViewsX(rs.getString("viewsX"));
					// message.setHot1(rs.getString("hot1"));
					// message.setHot2(rs.getString("hot2"));
					// message.setHot3(rs.getString("hot3"));
					// message.setHot4(rs.getString("hot4"));
					// message.setHot5(rs.getString("hot5"));
// 			  }

				//System.out.println(str);
				
				message.setTitle("鬼灭之刃");
				message.setCover("//i0.hdslb.com/bfs/bangumi/9d9cd5a6a48428fe2e4b6ed17025707696eab47b.png@282w_375h.webp");
				message.setIntro("intruduce");
				message.setScore("score");
				message.setIs_finish("1");
				message.setTag("战斗");
//
				 message.setCoinsX("0.8");
				 message.setDanmakusX("0.6");
				 message.setCommentX("0.9");
				 message.setFollowX("1.0");
				 message.setViewsX("0.9");

				 message.setHot1("50");
				 message.setHot2("44");
				 message.setHot3("50");
				 message.setHot4("55");
				 message.setHot5("40");
//				
				
				
				
//				System.out.println(message);
				
			
			
			
			
		} catch (final Exception e) {
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
		
		
		return message;
	}


}
