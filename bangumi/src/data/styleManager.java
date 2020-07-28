package data;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



import chartClass.Style;
public class styleManager {
        public List queryStyle(){
            
            List lists = null;
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            lists = new ArrayList();
            try {
                Class.forName("com.mysql.jdbc.Driver");
            
                conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/anime","root","545811");
                
                
                stmt = conn.createStatement();
                
                 rs = stmt.executeQuery("SELECT tag,tag_number FROM style LIMIT 0,30");
                 
                 
                
                while(rs.next()){
                    
                    Style style = new Style();
                    
                    style.setTag(rs.getString("tag"));
                    style.setTag_number(rs.getString("tag_number"));
                    //gmv.setDt(rs.getString("dt"));
                    
//                    style.setTag("战斗");
//                    style.setTag_number("9899");
                    
                    
                    
                    
                    //gmv.setGmvAmount(rs.getString("gmv_amount"));
                    
                    lists.add(style);
                   
                    
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
