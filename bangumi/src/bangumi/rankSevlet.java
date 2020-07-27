package bangumi;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import net.sf.json.JSONObject;

import data.rankManger;

public class rankSevlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
				rankManger us = new rankManger();
		  
				List lists = us.queryRank();
				
				
				Gson gson = new Gson();
	  
				  
				String ranks = gson.toJson(lists);
				
				System.out.println(ranks);
				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().print(ranks);
	}

}
