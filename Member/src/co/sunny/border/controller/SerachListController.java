package co.sunny.border.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.sunny.border.command.BorderList;
import co.sunny.border.dao.BorderDao;
import co.sunny.border.vo.BorderVo;
import co.sunny.common.BorderCommand;


@WebServlet("/SearchList.do")
public class SerachListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SerachListController() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		BorderDao dao = new BorderDao();   //BorderDao 클래스가져와 dao라는 이름으로 쓸거임
		
		String search = request.getParameter("search");
		String word = request.getParameter("word");
		
		ArrayList<BorderVo> slist = dao.selectSearch(search, word); 
		
		request.setAttribute("slist", slist);		
		String viewPage = "jsp/border/searchList.jsp";		
		RequestDispatcher dp = request.getRequestDispatcher(viewPage); //디스패쳐
		dp.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
