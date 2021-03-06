package co.sunny.member.controller;

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
import co.sunny.member.dao.MemberDao;
import co.sunny.member.vo.MemberVo;


@WebServlet("/MemberUpdate.do")
public class MemberUpdateCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MemberUpdateCon() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		MemberDao dao = new MemberDao();
		MemberVo vo = new MemberVo();
		
		vo.setPassword(request.getParameter("pw"));
		vo.setmAuth(request.getParameter("auth"));
		
		int n = dao.update(vo); //dao의 update에 vo실어보내기
		
		if(n != 0) {
			response.sendRedirect("/Member/MemberList.do");
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
