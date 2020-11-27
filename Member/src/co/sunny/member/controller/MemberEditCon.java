package co.sunny.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.sunny.member.dao.MemberDao;
import co.sunny.member.vo.MemberVo;



@WebServlet("/MemberEdit.do")
public class MemberEditCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MemberEditCon() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		MemberDao dao = new MemberDao();
		MemberVo vo = new MemberVo();
		
		vo.setmId(request.getParameter("id"));  //borderRead.jsp의 name="id" value="${vo.borderId }"가 넘어온다
		
		vo = dao.selectOne(vo); //dao에서 search가 넘어와서 vo에 담긴다.
		
		request.setAttribute("vo", vo);  //결과를 vo라고하고 vo를 담는다.
		String viewPage = "jsp/manage/memberEdit.jsp";
		
		RequestDispatcher dp = request.getRequestDispatcher(viewPage);	
		dp.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
