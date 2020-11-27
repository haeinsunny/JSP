package co.sunny.border.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.sunny.border.dao.BorderDao;
import co.sunny.border.vo.BorderVo;

@WebServlet("/BorderEdit.do")
public class BorderEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public BorderEditController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// command없이 controller에 구현
		request.setCharacterEncoding("utf-8");
		BorderDao dao = new BorderDao();
		BorderVo vo = new BorderVo();
		
		vo.setBorderId(Integer.parseInt(request.getParameter("id")));  //borderRead.jsp의 name="id" value="${vo.borderId }"가 넘어온다
		
		vo = dao.selectSearch(vo); //dao에서 search가 넘어와서 vo에 담긴다.
		
		request.setAttribute("vo", vo);  //결과를 vo라고하고 vo를 담는다.
		String viewPage = "jsp/border/borderEdit.jsp";
		
		RequestDispatcher dp = request.getRequestDispatcher(viewPage);	
		dp.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
