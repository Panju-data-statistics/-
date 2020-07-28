package data;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



import chartClass.Company;
public class companyManager {
    public List queryCompany(){
		
		List lists = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		lists = new ArrayList();
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/anime","root","545811");
			
			
			stmt = conn.createStatement();
			
			 rs = stmt.executeQuery("SELECT company,fame FROM company LIMIT 0,3");
			
			
			while(rs.next()){
				
				Company company = new Company();
				
				company.setCompany(rs.getString("company"));
				company.setFame(rs.getString("fame"));
				//gmv.setDt(rs.getString("dt"));
				
//				company.setCompany("UFO");
//				company.setFame("9899");
				
				
				
				
				//gmv.setGmvAmount(rs.getString("gmv_amount"));
				
				lists.add(company);
				
				
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
