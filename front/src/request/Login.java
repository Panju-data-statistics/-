package request;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Login extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		   doPost(request,response);
		 
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			String username=request.getParameter("name");
			String passwd=request.getParameter("passwd");
			
			if(username.equals("ash")&&passwd.equals("123")){
				System.out.println("success");
				request.getRequestDispatcher("/success.jsp").forward(request, response);
			}
			else{
				System.out.println("fail");
				request.getRequestDispatcher("/failed.jsp").forward(request, response);
			}
		
	}

}
