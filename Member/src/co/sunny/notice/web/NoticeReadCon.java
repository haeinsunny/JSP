package co.sunny.notice.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.sunny.notice.dao.NoticeDao;
import co.sunny.notice.vo.NoticeVo;



@WebServlet("/NoticeRead.do")
public class NoticeReadCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public NoticeReadCon() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		NoticeDao dao = new NoticeDao();   
		NoticeVo vo = new NoticeVo();  	
		
		vo.setnId(Integer.parseInt(request.getParameter("id"))); 
		vo = dao.selectOne(vo);  
		
		request.setAttribute("vo", vo);
		String viewPage = "jsp/notice/noticeRead.jsp";  
		
		RequestDispatcher dp = request.getRequestDispatcher(viewPage); 
		dp.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
