package bangumi;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import data.searchManager;
import chartClass.Message;
import data.radarManager;

public class searchServlet extends HttpServlet {

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
	private static final long serialVersionUID = 1L;
	public static String record = "";
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String Searchstr = request.getParameter("wd");
			if (request.getParameter("wd") != null) {
				record = Searchstr;
			} else {
				Searchstr = record;
			}
			
			Message message = new searchManager().querySearch(Searchstr);
			Gson gson = new Gson();
//			
			
			
			
			request.setAttribute("title", message.getTitle());
			request.setAttribute("intro",message.getIntro());
			request.setAttribute("cover", message.getCover());
			request.setAttribute("tag", message.getTag());
			request.setAttribute("score", message.getScore());
			request.setAttribute("coinsX",message.getCoinsX());
			request.setAttribute("commentX",message.getCommentX());
			request.setAttribute("danmakusX",message.getDanmakusX());
			request.setAttribute("followX",message.getFollowX());
			request.setAttribute("viewsX",message.getViewsX());
			request.setAttribute("hot1",message.getHot1());
			request.setAttribute("hot2",message.getHot2());
			request.setAttribute("hot3",message.getHot3());
			request.setAttribute("hot4",message.getHot4());
			request.setAttribute("hot5",message.getHot5());
			if(message.getIs_finish().equalsIgnoreCase("1"))
			{
				request.setAttribute("is_finish","已完结");
			}
			else{
				request.setAttribute("is_finish","连载中");
			}
			
			
//			
			
			response.setContentType("text/html;charset=UTF-8");
//			
			
			request.getRequestDispatcher("detail.jsp").forward(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
