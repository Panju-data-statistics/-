package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import chartClass.People;
public class peopleManager {
	public List queryPeople(){
		
		List lists = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		lists = new ArrayList();
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/anime","root","545811");
			
			
			stmt = conn.createStatement();
			
			 rs = stmt.executeQuery("SELECT * FROM  online WHERE time >= 0");
			
			
			while(rs.next()){
				
				People people = new People();
				people.setTime(rs.getString("time"));
				people.setMax_number(rs.getString("max_number"));
				people.setMin_number(rs.getString("min_number"));
				
				//gmv.setDt(rs.getString("dt"));
				
					//people.setTime("11");
					//people.setMax_number("20");
					// people.setAvg_number("80");
					//people.setMin_number("10");
				lists.add(people);
				// People people = new People();
				
				// //gmv.setDt(rs.getString("dt"));
				
				// people.setTime("0ʱ");
				// people.setNumber("9899");
				
				// People people1 = new People();
				// people1.setTime("1ʱ");
				// people1.setNumber("2345");
				
				
				//gmv.setGmvAmount(rs.getString("gmv_amount"));
				
				// lists.add(people);
				// lists.add(people1);
				
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