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

@WebServlet("/BorderUpdate.do")
public class BorderUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BorderUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		BorderDao dao = new BorderDao();
		BorderVo vo = new BorderVo();
		
		vo.setBorderId(Integer.parseInt(request.getParameter("id")));
		vo.setBorderDate(Date.valueOf(request.getParameter("wdate")));
		vo.setBorderContent(request.getParameter("content"));
		
		int n = dao.update(vo); //dao의 update에 vo실어보내기
		
		if(n != 0) {
			response.sendRedirect("/Board/BorderList.do");
		}else {
			String msg = "수정하지 못했습니다.";	
			request.setAttribute("msg", msg);
			String viewPage = "jsp/error/inputError.jsp";
			RequestDispatcher dp = request.getRequestDispatcher(viewPage);	
			dp.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
