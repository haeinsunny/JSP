package co.sunny.member.controller;

import java.io.IOException;

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

@WebServlet("/MemberRead.do")
public class MemberReadCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MemberReadCon() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		MemberDao dao = new MemberDao();   //BorderDao 클래스가져와 dao라는 이름으로 쓸거임
		MemberVo vo = new MemberVo();   //BorderVo 클래스가져와 vo라는 이름으로 쓸거임	
		
		vo.setmId(request.getParameter("id")); //form에서 넘어오는 id(String)값을 integer객체를 통해서 int처리하겠다.
		vo = dao.selectOne(vo);  //vo 객체를 담은 dao의 selectOne메소드를 부른다
		
		request.setAttribute("vo", vo);
		String viewPage = "jsp/manage/memberRead.jsp";  //command가 불러야할 페이지를 이controller가 바로 불러주는것
		
		RequestDispatcher dp = request.getRequestDispatcher(viewPage); //디스패쳐
		dp.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
