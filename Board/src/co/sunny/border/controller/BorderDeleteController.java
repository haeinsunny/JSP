package co.sunny.border.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.sunny.border.dao.BorderDao;
import co.sunny.border.vo.BorderVo;

@WebServlet("/BorderDelete.do")
public class BorderDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public BorderDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		BorderDao dao = new BorderDao();
		BorderVo vo = new BorderVo();
		
		vo.setBorderId(Integer.parseInt(request.getParameter("id")));  //borderRead.jsp의 name="id" value="${vo.borderId }"가 넘어온다
		
		int n = dao.delete(vo); //dao의 delete에 vo실어보내기
		
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


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
